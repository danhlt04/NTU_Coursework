import time
import pandas as pd
import networkx as nx
import osmnx as ox

WARDS = [
    "Phường Nha Trang, Khánh Hòa, Vietnam",
    "Phường Bắc Nha Trang, Khánh Hòa, Vietnam",
    "Phường Nam Nha Trang, Khánh Hòa, Vietnam",
    "Phường Tây Nha Trang, Khánh Hòa, Vietnam",
]
OUT_FILE = "data/nhatrang_final.graphml"

gdfs = []
for name in WARDS:
    gdfs.append(ox.geocode_to_gdf(name))
    time.sleep(1.1)  # Nominatim giới hạn ~1 yêu cầu/giây
area = pd.concat(gdfs, ignore_index=True)
polygon = area.geometry.union_all()
print("Đã gộp ranh giới 4 phường.")

G = ox.graph_from_polygon(polygon, network_type="drive")
ox.save_graphml(G, OUT_FILE)
print("Đã lưu:", OUT_FILE)

print("Số nút:", G.number_of_nodes())
print("Số cạnh:", G.number_of_edges())
print("Cạnh song song (key > 0):", sum(1 for _, _, k in G.edges(keys=True) if k > 0))
lengths = [d["length"] for _, _, d in G.edges(data=True)]
print("length min/max/TB (m): %.1f / %.1f / %.1f"
      % (min(lengths), max(lengths), sum(lengths) / len(lengths)))
scc = sorted(nx.strongly_connected_components(G), key=len, reverse=True)
print("Thành phần liên thông mạnh:", len(scc),
      "| lớn nhất:", len(scc[0]), "nút")