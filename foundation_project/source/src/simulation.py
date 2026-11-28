from dataclasses import dataclass, field


@dataclass
class State:
    index: int = -1
    dist: dict = field(default_factory=dict)  
    done: set = field(default_factory=set)    
    prev: dict = field(default_factory=dict)   
    current: object = None                    
    checking: object = None                   
    event: object = None                      
    finished: bool = False
    found: bool = False

    @property
    def frontier(self):
        return set(self.dist) - self.done

    def copy(self):
        return State(self.index, dict(self.dist), set(self.done),
                     dict(self.prev), self.current, self.checking,
                     self.event, self.finished, self.found)


def apply_event(state, ev, i):
    state.index = i
    state.event = ev
    t = ev["type"]
    if t == "init":
        state.dist[ev["node"]] = 0.0
    elif t == "select":
        state.done.add(ev["node"])
        state.current = ev["node"]
        state.checking = None
    elif t == "check":
        state.checking = (ev["from"], ev["to"], ev["key"])
        if ev["updated"]:
            state.dist[ev["to"]] = ev["new_dist"]
            state.prev[ev["to"]] = (ev["from"], ev["key"])
    elif t == "finish":
        state.current = None
        state.checking = None
        state.finished = True
        state.found = ev["found"]


class Simulation:
    def __init__(self, steps, result=None, checkpoint_every=100):
        if not steps:
            raise ValueError("Danh sách bước rỗng (cần record_steps=True)")
        self.steps = steps
        self.result = result
        self.K = checkpoint_every
        self.n = len(steps)

        self.checkpoints = {}
        st = State()
        for i, ev in enumerate(steps):
            apply_event(st, ev, i)
            if i % self.K == 0:
                self.checkpoints[i] = st.copy()

        self.pos = 0
        self.state = self.checkpoints[0].copy()

    def goto(self, i):
        i = max(0, min(i, self.n - 1))
        base = (i // self.K) * self.K
        st = self.checkpoints[base].copy()
        for j in range(base + 1, i + 1):
            apply_event(st, self.steps[j], j)
        self.state, self.pos = st, i
        return self.state

    def next(self):
        if self.pos < self.n - 1:
            self.pos += 1
            apply_event(self.state, self.steps[self.pos], self.pos)
        return self.state

    def previous(self):
        return self.goto(self.pos - 1)

    def reset(self):
        return self.goto(0)

    def at_end(self):
        return self.pos == self.n - 1

    def final_path(self):
        if self.state.finished and self.state.found and self.result:
            return self.result["path_nodes"], self.result["path_edges"]
        return None