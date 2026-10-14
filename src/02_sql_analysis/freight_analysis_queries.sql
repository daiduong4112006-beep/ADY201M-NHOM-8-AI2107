-- =====================================================================
-- ADY201M - NHOM 8 - AI2107
-- FREIGHT ANALYSIS SQL QUERIES (SQLite)
-- Tap du lieu: Brazilian E-Commerce by Olist (Bang: freight_data)
-- =====================================================================


-- ---
SELECT
    CASE
        WHEN distance_km < 200  THEN '1. Gần (<200km)'
        WHEN distance_km < 800  THEN '2. Trung bình (200-800km)'
        WHEN distance_km < 1500 THEN '3. Xa (800-1500km)'
        ELSE '4. Rất xa (>1500km)'
    END AS nhom_khoang_cach,
    COUNT(*) AS so_don,
    ROUND(AVG(freight_value), 2) AS phi_ship_TB,
    ROUND(AVG(distance_km), 1) AS khoang_cach_TB_km
FROM freight_data
GROUP BY nhom_khoang_cach
ORDER BY nhom_khoang_cach;


-- ---
SELECT
    CASE WHEN same_state = 1 THEN 'Cùng bang' ELSE 'Khác bang' END AS nhom,
    COUNT(*) AS so_don,
    ROUND(AVG(freight_value), 2) AS phi_ship_TB,
    ROUND(AVG(distance_km), 1) AS khoang_cach_TB
FROM freight_data
GROUP BY same_state;


-- ---
SELECT
    category,
    COUNT(*) AS so_don,
    ROUND(AVG(freight_value), 2) AS phi_ship_TB,
    ROUND(AVG(weight_g), 0) AS trong_luong_TB
FROM freight_data
GROUP BY category
HAVING COUNT(*) >= 30
ORDER BY phi_ship_TB DESC
LIMIT 10;


-- ---
SELECT
    CASE
        WHEN weight_g < 500  THEN '1. Rất nhẹ (<500g)'
        WHEN weight_g < 2000 THEN '2. Nhẹ (500-2000g)'
        WHEN weight_g < 5000 THEN '3. Trung bình (2-5kg)'
        ELSE '4. Nặng (>5kg)'
    END AS nhom_trong_luong,
    COUNT(*) AS so_don,
    ROUND(AVG(freight_value), 2) AS phi_ship_TB
FROM freight_data
GROUP BY nhom_trong_luong
ORDER BY nhom_trong_luong;


-- ---
SELECT
    seller_state,
    COUNT(*) AS so_don,
    ROUND(AVG(freight_value), 2) AS phi_ship_TB,
    ROUND(AVG(distance_km), 1) AS khoang_cach_TB
FROM freight_data
GROUP BY seller_state
HAVING COUNT(*) >= 20
ORDER BY phi_ship_TB DESC
LIMIT 10;


-- ---
SELECT
    month,
    COUNT(*) AS so_don,
    ROUND(AVG(freight_value), 2) AS phi_ship_TB
FROM freight_data
GROUP BY month
ORDER BY month;


-- ---
SELECT
    CASE
        WHEN price < 50  THEN '1. Giá rẻ (<50)'
        WHEN price < 150 THEN '2. Trung bình (50-150)'
        WHEN price < 400 THEN '3. Cao (150-400)'
        ELSE '4. Rất cao (>400)'
    END AS nhom_gia,
    COUNT(*) AS so_don,
    ROUND(AVG(freight_value), 2) AS phi_ship_TB,
    ROUND(AVG(price), 2) AS gia_TB,
    ROUND(AVG(freight_value * 1.0 / price) * 100, 1) AS ty_le_phi_tren_gia_pct
FROM freight_data
GROUP BY nhom_gia
ORDER BY nhom_gia;


-- ---
SELECT
    seller_state || ' -> ' || customer_state AS tuyen_duong,
    COUNT(*) AS so_don,
    ROUND(AVG(freight_value), 2) AS phi_ship_TB,
    ROUND(AVG(distance_km), 1) AS khoang_cach_TB
FROM freight_data
GROUP BY seller_state, customer_state
HAVING COUNT(*) >= 20
ORDER BY phi_ship_TB DESC
LIMIT 10;


-- **Nhận xét**: Các tuyến đắt nhất đều xuất phát từ Santa Catarina (SC) và Paraná (PR) đến các bang vùng Đông Bắc/Bắc Brazil (PB, CE, PA, PI, MA) — khoảng cách trung bình trên 2.000km, xác nhận chi tiết hơn phát hiện ở Query 5.

-- ---
SELECT
    CASE WHEN order_n_items = 1 THEN '1 sản phẩm' ELSE '>=2 sản phẩm' END AS nhom,
    COUNT(*) AS so_don,
    ROUND(AVG(freight_value), 2) AS phi_ship_TB
FROM freight_data
GROUP BY nhom;


-- ---
SELECT
    seller_state,
    COUNT(*) AS so_don,
    ROUND(AVG(geo_imputed) * 100, 1) AS pct_geo_imputed,
    ROUND(AVG(category_imputed) * 100, 1) AS pct_category_imputed
FROM freight_data
GROUP BY seller_state
HAVING COUNT(*) >= 50
ORDER BY pct_geo_imputed DESC
LIMIT 10;
