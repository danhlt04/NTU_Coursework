import heapq
import math


def dijkstra(G, source, target, record_steps=False):
    dist = {source: 0.0}      
    prev = {}                
    done = set()             
    heap = [(0.0, source)]
    steps = []

    if record_steps:
        steps.append({"type": "init", "node": source})

    found = False
    while heap:
        d, u = heapq.heappop(heap)

        if u in done or d > dist.get(u, math.inf):
            continue
        done.add(u)

        if record_steps:
            steps.append({"type": "select", "node": u, "dist": d})

        if u == target:      
            found = True
            break

        for _, v, key, data in G.out_edges(u, keys=True, data=True):
            if v == u or v in done:
                continue     
            w = data["length"]
            new_d = d + w
            old_d = dist.get(v, math.inf)
            updated = new_d < old_d
            if updated:
                dist[v] = new_d
                prev[v] = (u, key)
                heapq.heappush(heap, (new_d, v))
            if record_steps:
                steps.append({
                    "type": "check", "from": u, "to": v, "key": key,
                    "weight": w, "new_dist": new_d,
                    "old_dist": None if old_d == math.inf else old_d,
                    "updated": updated,
                })

    if record_steps:
        steps.append({"type": "finish", "found": found})

    if not found:
        return {"found": False, "path_nodes": [], "path_edges": [],
                "length": math.inf, "steps": steps}

    nodes, edges = [target], []
    cur = target
    while cur != source:
        p, key = prev[cur]
        edges.append((p, cur, key))
        nodes.append(p)
        cur = p
    nodes.reverse()
    edges.reverse()

    return {"found": True, "path_nodes": nodes, "path_edges": edges,
            "length": dist[target], "steps": steps}