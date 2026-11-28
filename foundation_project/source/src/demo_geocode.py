import os
import time
import numpy as np
import osmnx as ox

PLACE = "Nha Trang, Khánh Hòa, Vietnam"
GRAPH_FILE = "data/nhatrang.graphml"
MAX_DIST_M = 200 

QUERIES = [
    "Ga Nha Trang",
    "Chợ Đầm",
    "Đại học Nha Trang",
    "Po Nager Cham Towers",
    "Vinpearl Nha Trang",
    "Quảng trường 2 tháng 4 Nha Trang",
    "Địa điểm không tồn tại xyz123",
]

os.makedirs("data", exist_ok=True)
if os.path.exists(GRAPH_FILE):
    G = ox.load_graphml(GRAPH_FILE)
    print("Đã đọc đồ thị từ file.")
else:
    G = ox.graph_from_place(PLACE, network_type="drive")
    ox.save_graphml(G, GRAPH_FILE)
    print("Đã tải và lưu đồ thị.")

node_ids = np.array(list(G.nodes))
node_lat = np.array([G.nodes[n]["y"] for n in node_ids])
node_lon = np.array([G.nodes[n]["x"] for n in node_ids])


def nearest_node(lat, lon):
    d = ox.distance.great_circle(lat, lon, node_lat, node_lon)
    i = int(np.argmin(d))
    return node_ids[i], float(d[i])


for name in QUERIES:
    print("\n>>", name)
    try:
        lat, lon = ox.geocode(f"{name}, Nha Trang, Vietnam")
    except Exception as e:
        print("   Không tìm thấy địa điểm.")
        time.sleep(1.1)
        continue

    node, dist = nearest_node(lat, lon)
    print(f"   Tọa độ: {lat:.5f}, {lon:.5f}")
    print(f"   Nút gần nhất: {node} (cách {dist:.0f} m)")
    if dist > MAX_DIST_M:
        print(f"   CẢNH BÁO: cách nút gần nhất hơn {MAX_DIST_M} m")
    time.sleep(1.1) 