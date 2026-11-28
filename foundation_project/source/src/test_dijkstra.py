import math
import random
import networkx as nx
import osmnx as ox
from dijkstra import dijkstra

G = ox.load_graphml("data/nhatrang_final.graphml")
nodes = list(G.nodes)
random.seed(42)

N = 200
bad = 0
for _ in range(N):
    s, t = random.sample(nodes, 2)
    mine = dijkstra(G, s, t)
    ref = nx.dijkstra_path_length(G, s, t, weight="length")
    ok = math.isclose(mine["length"], ref, rel_tol=1e-9)

    total = sum(G[u][v][k]["length"] for u, v, k in mine["path_edges"])
    ok = ok and math.isclose(total, mine["length"], rel_tol=1e-9)
    ok = ok and mine["path_nodes"][0] == s and mine["path_nodes"][-1] == t
    if not ok:
        bad += 1
        print("SAI:", s, t, mine["length"], ref)
print(f"[1] So với NetworkX: {N - bad}/{N} cặp khớp")

s, t = random.sample(nodes, 2)
a = dijkstra(G, s, t, record_steps=False)
b = dijkstra(G, s, t, record_steps=True)
same = a["path_nodes"] == b["path_nodes"] and a["length"] == b["length"]
print("[2] Ghi/không ghi bước giống nhau:", same, "| số bước:", len(b["steps"]))

r = dijkstra(G, s, s)
print("[3] Nguồn = đích: length =", r["length"], "| path =", r["path_nodes"] == [s])

H = nx.MultiDiGraph()
H.add_edge(1, 2, length=5.0)
H.add_node(3)
r = dijkstra(H, 1, 3)
print("[4] Không có đường đi: found =", r["found"], "| length =", r["length"])

P = nx.MultiDiGraph()
P.add_edge(1, 2, length=214.5)
P.add_edge(1, 2, length=41.4)
r = dijkstra(P, 1, 2)
print("[5] Cạnh song song: length =", r["length"], "| cạnh chọn =", r["path_edges"])