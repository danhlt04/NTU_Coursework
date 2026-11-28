import networkx as nx
import osmnx as ox

G = ox.load_graphml("data/nhatrang_final.graphml")
print("Loại:", type(G).__name__, "|", G.number_of_nodes(), "nút,", G.number_of_edges(), "cạnh")

n = next(iter(G.nodes))
print("\nNút", n, "| vĩ độ, kinh độ:", G.nodes[n]["y"], G.nodes[n]["x"])
for u, v, k, d in G.out_edges(n, keys=True, data=True):
    print(f"  {u} -> {v} | key={k} | length={d['length']:.1f} m")

pair = next(((u, v) for u, v in set(G.edges())
             if G.number_of_edges(u, v) > 1), None)
if pair:
    u, v = pair
    print("\nCạnh song song giữa", u, "và", v)
    for k, d in G[u][v].items():
        print(f"  key={k} | length={d['length']:.1f} m")
    print("  Trọng số nhỏ nhất dùng cho Dijkstra:",
          round(min(d["length"] for d in G[u][v].values()), 1), "m")

lengths = [d["length"] for _, _, d in G.edges(data=True)]
print("\nKiểu dữ liệu length:", type(lengths[0]).__name__)
print("Cạnh length < 0:", sum(1 for x in lengths if x < 0))
print("Khuyên (self-loop):", nx.number_of_selfloops(G))
print("Liên thông mạnh:", nx.is_strongly_connected(G))

u, v, d = max(G.edges(data=True), key=lambda e: e[2]["length"])
print(f"\nCạnh dài nhất: {d['length']:.1f} m")
print("  Từ", (G.nodes[u]["y"], G.nodes[u]["x"]))
print("  Đến", (G.nodes[v]["y"], G.nodes[v]["x"]), "| highway:", d.get("highway"))