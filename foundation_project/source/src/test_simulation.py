import math
import random
import networkx as nx
import osmnx as ox
from dijkstra import dijkstra
from simulation import Simulation, State, apply_event

G = ox.load_graphml("data/nhatrang_final.graphml")
nodes = list(G.nodes)
random.seed(7)
s, t = random.sample(nodes, 2)
result = dijkstra(G, s, t, record_steps=True)
steps = result["steps"]
print("Số bước:", len(steps), "| length:", round(result["length"], 1), "m")

sim = Simulation(steps, result)

last_settled = -1.0
ok1 = True
while True:
    st = sim.state
    if not st.done <= set(st.dist):
        ok1 = False
    ev = st.event
    if ev["type"] == "select":
        if st.dist[ev["node"]] != ev["dist"] or ev["dist"] < last_settled:
            ok1 = False
        last_settled = ev["dist"]
    if sim.at_end():
        break
    sim.next()
print("[1] Từng trạng thái hợp lệ:", ok1)

st = sim.state
ok2 = st.finished and st.found and math.isclose(st.dist[t], result["length"])
path, cur = [], t         
while cur != s:
    p, k = st.prev[cur]
    path.append((p, cur, k))
    cur = p
path.reverse()
ok2 = ok2 and path == result["path_edges"]
print("[2] Trạng thái cuối khớp kết quả:", ok2,
      "| final_path:", sim.final_path() is not None)

ok3 = True
for i in random.sample(range(len(steps) - 1), 50):
    sim.goto(i)
    before = sim.state.copy()
    sim.next()
    sim.previous()
    if sim.state != before:
        ok3 = False
print("[3] Tiến rồi lùi giữ nguyên trạng thái:", ok3)

ok4 = True
for i in random.sample(range(len(steps)), 50):
    ref = State()
    for j in range(i + 1):
        apply_event(ref, steps[j], j)
    if Simulation(steps, result).goto(i) != ref:
        ok4 = False
print("[4] Nhảy thẳng = phát lại từ đầu:", ok4)

sim.reset()
sim.previous()
ok5 = sim.pos == 0
sim.goto(10**9)
ok5 = ok5 and sim.at_end()
sim.next()
ok5 = ok5 and sim.at_end()
sim.reset()
ok5 = ok5 and sim.pos == 0 and not sim.state.finished
print("[5] Biên và reset:", ok5)

H = nx.MultiDiGraph()
H.add_edge(1, 2, length=5.0)
H.add_node(3)
r = dijkstra(H, 1, 3, record_steps=True)
sm = Simulation(r["steps"], r)
sm.goto(10**9)
print("[6] Không có đường đi: finished =", sm.state.finished,
      "| found =", sm.state.found, "| final_path =", sm.final_path())