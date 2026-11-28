import osmnx as ox

G = ox.load_graphml("data/nhatrang.graphml")
print("Trước:", G.number_of_nodes(), "nút,", G.number_of_edges(), "cạnh")

G2 = ox.truncate.largest_component(G, strongly=True)
print("Sau:  ", G2.number_of_nodes(), "nút,", G2.number_of_edges(), "cạnh")

ox.save_graphml(G2, "data/nhatrang_final.graphml")
print("Đã lưu data/nhatrang_final.graphml")