import os
import osmnx as ox
import folium

GRAPH_FILE = "data/nhatrang.graphml"
OUT_FILE = "data/xem_do_thi.html"
DRAW_ALL = False  
MAJOR = {"primary", "secondary", "tertiary", "trunk",
         "primary_link", "secondary_link", "tertiary_link", "trunk_link"}

G = ox.load_graphml(GRAPH_FILE)
nodes, edges = ox.graph_to_gdfs(G)

print("Nút:", len(nodes), "| Cạnh:", len(edges))
print("Cột của bảng nút:", list(nodes.columns))
print("Cột của bảng cạnh:", list(edges.columns))
print(edges[["length", "highway", "oneway"]].head())

def is_major(h):
    if isinstance(h, list):
        return any(x in MAJOR for x in h)
    return h in MAJOR

if not DRAW_ALL:
    edges = edges[edges["highway"].apply(is_major)]
print("Số cạnh được vẽ:", len(edges))

center = [nodes["y"].mean(), nodes["x"].mean()]
m = folium.Map(location=center, zoom_start=12, tiles="OpenStreetMap")

folium.GeoJson(
    edges[["length", "geometry"]].to_json(),
    style_function=lambda f: {"color": "#d62728", "weight": 2},
    tooltip=folium.GeoJsonTooltip(fields=["length"], aliases=["Dài (m):"]),
).add_to(m)

m.save(OUT_FILE)
print("Đã lưu:", os.path.abspath(OUT_FILE))