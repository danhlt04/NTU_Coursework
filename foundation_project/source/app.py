import numpy as np
import folium
import osmnx as ox
import streamlit as st
from streamlit_folium import st_folium

from src.dijkstra import dijkstra
from src.places import PLACES

GRAPH_FILE = "data/nhatrang_final.graphml"
MAX_SNAP_M = 200

st.set_page_config(page_title="Dijkstra – Nha Trang", layout="wide")
st.title("Mô phỏng thuật toán Dijkstra – Khu vực Nha Trang")


@st.cache_resource
def load_graph():
    G = ox.load_graphml(GRAPH_FILE)
    ids = np.array(list(G.nodes))
    lat = np.array([G.nodes[n]["y"] for n in ids])
    lon = np.array([G.nodes[n]["x"] for n in ids])
    return G, ids, lat, lon


G, NODE_IDS, NODE_LAT, NODE_LON = load_graph()


def nearest_node(lat, lon):
    d = ox.distance.great_circle(lat, lon, NODE_LAT, NODE_LON)
    i = int(np.argmin(d))
    return int(NODE_IDS[i]), float(d[i])


def make_point(lat, lon, label):
    node, snap = nearest_node(lat, lon)
    return {"lat": lat, "lon": lon, "label": label, "node": node, "snap_m": snap}


def path_latlons(edges):
    pts = []
    for u, v, k in edges:
        geom = G[u][v][k].get("geometry")
        if geom is not None:
            pts.extend((y, x) for x, y in geom.coords)
        else:
            pts.append((G.nodes[u]["y"], G.nodes[u]["x"]))
            pts.append((G.nodes[v]["y"], G.nodes[v]["x"]))
    return pts


for key in ("start", "end", "result", "last_click"):
    st.session_state.setdefault(key, None)


def pick_place(which):
    name = st.session_state[f"{which}_sel"]
    if name != "—":
        lat, lon = PLACES[name]
        st.session_state[which] = make_point(lat, lon, name)
        st.session_state.result = None


def clear_all():
    st.session_state.start = None
    st.session_state.end = None
    st.session_state.result = None
    st.session_state.start_sel = "—"
    st.session_state.end_sel = "—"


left, center, right = st.columns([1.1, 3, 1.3])

with left:
    st.subheader("Chọn điểm")
    options = ["—"] + list(PLACES)
    st.selectbox("Điểm xuất phát", options, key="start_sel",
                 on_change=pick_place, args=("start",))
    st.selectbox("Điểm đích", options, key="end_sel",
                 on_change=pick_place, args=("end",))
    st.radio("Hoặc nhấp lên bản đồ để đặt:",
             ["Điểm xuất phát", "Điểm đích"], key="click_target")

    ready = st.session_state.start is not None and st.session_state.end is not None
    if st.button("Tìm đường", type="primary", disabled=not ready):
        s = st.session_state.start["node"]
        t = st.session_state.end["node"]
        st.session_state.result = dijkstra(G, s, t)
    st.button("Xóa lựa chọn", on_click=clear_all)

with center:
    m = folium.Map(location=[NODE_LAT.mean(), NODE_LON.mean()],
                   zoom_start=12, tiles="OpenStreetMap")

    for name, (lat, lon) in PLACES.items():
        folium.CircleMarker([lat, lon], radius=5, color="#1f77b4",
                            fill=True, tooltip=name).add_to(m)

    res = st.session_state.result
    if res and res["found"] and res["path_edges"]:
        folium.PolyLine(path_latlons(res["path_edges"]),
                        color="#d62728", weight=5, opacity=0.9).add_to(m)

    for which, color in (("start", "green"), ("end", "red")):
        p = st.session_state[which]
        if p:
            folium.Marker([p["lat"], p["lon"]], tooltip=p["label"],
                          icon=folium.Icon(color=color)).add_to(m)

    out = st_folium(m, height=560, use_container_width=True,
                    returned_objects=["last_clicked"], key="map")
    click = out.get("last_clicked") if out else None
    if click and click != st.session_state.last_click:
        st.session_state.last_click = click
        which = "start" if st.session_state.click_target == "Điểm xuất phát" else "end"
        st.session_state[which] = make_point(
            click["lat"], click["lng"], "Vị trí chọn trên bản đồ")
        st.session_state.result = None
        st.rerun()

with right:
    st.subheader("Thông tin")
    for which, title in (("start", "Điểm xuất phát"), ("end", "Điểm đích")):
        p = st.session_state[which]
        if p:
            st.markdown(f"**{title}:** {p['label']}  \n"
                        f"Nút gần nhất: `{p['node']}` (cách {p['snap_m']:.0f} m)")
            if p["snap_m"] > MAX_SNAP_M:
                st.warning(f"{title} cách nút gần nhất hơn {MAX_SNAP_M} m.")
        else:
            st.markdown(f"**{title}:** chưa chọn")

    res = st.session_state.result
    if res:
        st.divider()
        if not res["found"]:
            st.error("Không tìm thấy đường đi giữa hai điểm.")
        else:
            st.metric("Tổng chiều dài", f"{res['length']:,.1f} m")
            st.metric("Tính theo km", f"{res['length'] / 1000:.3f} km")
            st.write(f"Số nút trên đường đi: {len(res['path_nodes'])}")
            with st.expander("Thứ tự các nút"):
                st.write(" → ".join(str(n) for n in res["path_nodes"]))