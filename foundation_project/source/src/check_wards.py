import time
import osmnx as ox
import folium

WARDS = [
    "Phường Nha Trang, Khánh Hòa, Vietnam",
    "Phường Bắc Nha Trang, Khánh Hòa, Vietnam",
    "Phường Nam Nha Trang, Khánh Hòa, Vietnam",
    "Phường Tây Nha Trang, Khánh Hòa, Vietnam",
]
COLORS = ["#d62728", "#1f77b4", "#2ca02c", "#ff7f0e"]
OUT_FILE = "data/ranh_gioi_4_phuong.html"

found = []
for name in WARDS:
    print("\n>>", name)
    try:
        gdf = ox.geocode_to_gdf(name)
    except Exception as e:
        print("   Không tìm thấy ranh giới:", type(e).__name__, "-", e)
        time.sleep(1.1)
        continue

    row = gdf.iloc[0]
    geom_type = row.geometry.geom_type
    area_km2 = ox.projection.project_gdf(gdf).geometry.area.iloc[0] / 1e6
    print("   Tên OSM trả về:", row.get("display_name"))
    print("   Loại:", row.get("class"), "/", row.get("type"))
    print("   Dạng hình học:", geom_type)
    print(f"   Diện tích: {area_km2:.1f} km2")
    if geom_type == "Point":
        print("   CẢNH BÁO: chỉ là một điểm, không có ranh giới vùng")
    found.append((name, gdf))
    time.sleep(1.1)  

print(f"\nTìm được {len(found)}/{len(WARDS)} phường.")

if found:
    c = found[0][1].geometry.centroid.iloc[0]
    m = folium.Map(location=[c.y, c.x], zoom_start=11, tiles="OpenStreetMap")
    for i, (name, gdf) in enumerate(found):
        folium.GeoJson(
            gdf[["geometry"]].to_json(),
            name=name,
            style_function=lambda f, col=COLORS[i % 4]: {
                "color": col, "weight": 2, "fillOpacity": 0.15},
            tooltip=name.split(",")[0],
        ).add_to(m)
    folium.LayerControl().add_to(m)
    m.save(OUT_FILE)
    print("Đã lưu bản đồ:", OUT_FILE)