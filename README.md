# 🚚 ADY201M - NHÓM 8 - LỚP AI2107
## Đề tài: Ứng dụng Phân tích Dữ liệu trong Dự đoán Phí Vận chuyển Đơn hàng Thương mại Điện tử (Freight Value Prediction & Analysis)

---

## 📌 MỤC LỤC
1. [I. Lý do chọn đề tài & Mô tả bài toán](#i-lý-do-chọn-đề-tài--mô-tả-bài-toán)
   - [1.1 Bài toán thực tiễn](#11-bài-toán-thực-tiễn)
   - [1.2 Mục tiêu dự án](#12-mục-tiêu-dự-án)
   - [1.3 Đối tượng người dùng cuối](#13-đối-tượng-người-dùng-cuối)
   - [1.4 Các câu hỏi nghiên cứu chính (RQ)](#14-các-câu-hỏi-nghiên-cứu-chính)
   - [1.5 Chỉ số đánh giá mô hình](#15-chỉ-số-đánh-giá-mô-hình)
2. [II. Mô tả và Nguồn tập dữ liệu](#ii-mô-tả-và-nguồn-tập-dữ-liệu)
   - [2.1 Nguồn gốc dữ liệu](#21-nguồn-gốc-dữ-liệu)
   - [2.2 Chi tiết 9 bảng dữ liệu Olist](#22-chi-tiết-9-bảng-dữ-liệu-olist)
   - [2.3 Dữ liệu sạch sau tiền xử lý](#23-dữ-liệu-sạch-sau-tiền-xử-lý)
3. [III. Các công cụ và Thư viện sử dụng](#iii-các-công-cụ-và-thư-viện-sử-dụng)
4. [IV. Cấu trúc thư mục dự án](#iv-cấu-trúc-thư-mục-dự-án)
5. [V. Tóm tắt tiến độ & Công việc đã hoàn thành](#v-tóm-tắt-tiến-độ--công-việc-đã-hoàn-thành)
   - [1. Chọn đề tài & Nghiên cứu dữ liệu (Đã hoàn thành)](#1-chọn-đề-tài--nghiên-cứu-dữ-liệu-đã-hoàn-thành)
   - [2. Làm sạch & Tiền xử lý dữ liệu (Đã hoàn thành)](#2-làm-sạch--tiền-xử-lý-dữ-liệu-data-cleaning--feature-engineering-đã-hoàn-thành)
   - [3. Phân tích chuyên sâu bằng SQL (Đã hoàn thành)](#3-phân-tích-chuyên-sâu-bằng-sql-10-queries-đã-hoàn-thành)
   - [4. Kế hoạch giai đoạn tiếp theo (Đang triển khai)](#4-kế-hoạch-giai-đoạn-tiếp-theo-đang-triển-khai)
6. [VI. Phân công công việc & Minh chứng đóng góp](#vi-phân-công-công-việc--minh-chứng-đóng-góp)
   - [6.1 Danh sách thành viên](#61-danh-sách-thành-viên)
   - [6.2 Phân công trách nhiệm](#62-phân-công-trách-nhiệm)
   - [6.3 Minh chứng đóng góp cụ thể](#63-minh-chứng-đóng-góp-cụ-thể)

---

## I. LÝ DO CHỌN ĐỀ TÀI & MÔ TẢ BÀI TOÁN

### 1.1 Bài toán thực tiễn
Thương mại điện tử (*e-commerce*) là một trong những lĩnh vực bán lẻ tăng trưởng nhanh nhất hiện nay. Cùng với sự bùng nổ này, **chi phí vận chuyển (phí ship)** ngày càng trở thành một yếu tố quyết định trong trải nghiệm mua sắm trực tuyến, thay vì chỉ là một khoản phụ phí đơn thuần:

- **Bối cảnh tại Việt Nam:** Theo *Báo cáo Chỉ số Thương mại điện tử Việt Nam 2025* của [VECOM](https://vecom.vn/bao-cao-chi-so-thuong-mai-dien-tu-viet-nam-2025), quy mô thị trường bán lẻ trực tuyến đạt khoảng **32 tỷ USD** trong năm 2024, tăng trưởng 27% so với năm trước. Tuy nhiên, theo báo cáo của Ngân hàng Thế giới do VCCI dẫn lại, [chi phí logistics của Việt Nam chiếm khoảng 20,9% GDP](https://vnbusiness.vn/chi-phi-logistics-qua-cao.html), trong đó riêng chi phí vận tải đã chiếm tới **59%** — cao hơn rất nhiều so với mức 9 - 15% GDP ở các nước phát triển.
- **Tác động đến hành vi khách hàng:** Theo nghiên cứu của [Baymard Institute](https://hostadvice.com/blog/monetization/ecommerce/abandoned-cart-statistics/), có tới **48% người mua hàng trực tuyến rời bỏ giỏ hàng** ở bước thanh toán cuối vì các chi phí phát sinh bất ngờ như phí ship, thuế hoặc các phụ phí khác.
- **Thách thức tại thị trường địa lý rộng lớn:** Theo khảo sát của [ABComm](https://abiacom.org/noticias/pesquisa-logistica-no-e-commerce-brasileiro-2019/) (Hiệp hội Thương mại điện tử Brazil), phí vận chuyển là thành phần chiếm tỷ trọng lớn nhất trong chi phí logistics của e-commerce, đạt **65,9%** và có xu hướng tăng dần qua các năm.

Từ thực tế trên, việc **dự đoán trước phí vận chuyển** dựa trên các đặc điểm của đơn hàng (thông số sản phẩm, khoảng cách, số lượng mặt hàng...) trở thành một bài toán mang tính thực tiễn cao:
1. Giúp người bán minh bạch hóa chi phí sớm cho khách hàng ngay từ bước duyệt sản phẩm, giảm tỷ lệ bỏ rơi giỏ hàng.
2. Hỗ trợ các nền tảng thương mại điện tử và đơn vị vận chuyển tối ưu hóa kế hoạch logistics và định giá linh hoạt.

Vì vậy, nhóm quyết định lựa chọn đề tài: **"Ứng dụng Phân tích Dữ liệu trong Dự đoán Phí Vận chuyển Đơn hàng Thương mại điện tử"** (áp dụng trên tập dữ liệu thực tế của sàn TMĐT Olist).

---

### 1.2 Mục tiêu dự án
* **Mục tiêu chung:**
  Tìm hiểu các yếu tố ảnh hưởng đến phí vận chuyển đơn hàng thương mại điện tử; xây dựng mô hình hồi quy học máy (Regression Model) có khả năng ước tính mức phí vận chuyển tham khảo chính xác và ổn định.
* **Mục tiêu cụ thể:**
  1. Thu thập, ghép nối và làm sạch dữ liệu giao dịch thực tế từ sàn TMĐT Olist (9 bảng dữ liệu quan hệ).
  2. Xác định và kiểm chứng bằng thực nghiệm các yếu tố có ý nghĩa thống kê và thực tế giải thích cho biến động phí ship (kích thước, khối lượng, khoảng cách địa lý, số lượng sản phẩm, loại thanh toán...).
  3. Xây dựng, huấn luyện và đánh giá các mô hình hồi quy (Linear Regression, Random Forest...), áp dụng kiểm định chéo (*Cross-Validation*) để đảm bảo mô hình không bị quá khớp (*overfitting*).
  4. Trực quan hóa dữ liệu và xây dựng báo cáo phân tích hỗ trợ tra cứu mức phí tham khảo.

---

### 1.3 Đối tượng người dùng cuối (End-Users)
* **Người bán hàng (Sellers / Merchants):** Nhập trước thông tin sản phẩm (cân nặng, kích thước, địa chỉ kho và địa chỉ giao hàng) để có mức phí ship tham khảo, từ đó cấu hình chính sách trợ giá ship hoặc thông báo trước cho người mua để giảm tỷ lệ huỷ giỏ hàng.
* **Bộ phận Vận hành & Logistics (Platform / Operations):** Tìm hiểu các tuyến đường đắt đỏ, phát hiện sự chênh lệch chi phí giữa các vùng miền, từ đó đề xuất giải pháp kho bãi liên kết (*fulfillment centers*) gần khách hàng hơn.

> *Lưu ý:* Kết quả dự đoán đóng vai trò mức phí tham khảo tối ưu, không thay thế hoàn toàn bảng giá cố định của từng đơn vị bưu chính chuyển phát nhanh.

---

### 1.4 Các câu hỏi nghiên cứu chính (Research Questions)
* **RQ1:** Đặc điểm vật lý của sản phẩm (khối lượng `product_weight_g`, thể tích `volume_cm3`, giá tiền `price`) có ảnh hưởng như thế nào đến phí vận chuyển (`freight_value`)?
* **RQ2:** Khoảng cách địa lý giữa người bán và người mua (`distance_km`) và yếu tố địa lý (cùng bang vs khác bang) có mối quan hệ định lượng như thế nào với phí vận chuyển?
* **RQ3:** Số lượng sản phẩm trong đơn hàng (`order_item_id`) và các đặc điểm thanh toán (số kỳ trả góp, loại thẻ) có tương quan với phí ship không? Có hiệu ứng giảm phí ship trên từng món khi mua số lượng nhiều không?
* **RQ4:** Có thể phối hợp các biến đặc trưng về sản phẩm, địa lý và đơn hàng để xây dựng mô hình hồi quy dự đoán phí vận chuyển với độ tin cậy cao hay không?
* **RQ5:** Mô hình dự đoán đạt mức độ chính xác như thế nào (dựa trên MAE, RMSE, MAPE, R²) và có đủ tính khả thi để áp dụng thực tế làm công cụ tham khảo giá hay không?

---

### 1.5 Chỉ số đánh giá mô hình (Evaluation Metrics)
Để đánh giá định lượng hiệu quả của các mô hình dự đoán, nhóm lựa chọn 4 chỉ số cốt lõi:
1. **MAE (Mean Absolute Error):**
   $$\text{MAE} = \frac{1}{n} \sum_{i=1}^n |y_i - \hat{y}_i|$$
   Đo sai số tuyệt đối trung bình bằng đơn vị tiền tệ thực tế (đồng Real Brazil - R$). Giúp giải thích trực quan về mặt nghiệp vụ cho người bán.
2. **RMSE (Root Mean Squared Error):**
   $$\text{RMSE} = \sqrt{\frac{1}{n} \sum_{i=1}^n (y_i - \hat{y}_i)^2}$$
   Phạt nặng hơn đối với các sai số lớn (những đơn hàng đặc biệt nặng hoặc tuyến đường xa bất thường).
3. **MAPE (Mean Absolute Percentage Error):**
   $$\text{MAPE} = \frac{100\%}{n} \sum_{i=1}^n \left| \frac{y_i - \hat{y}_i}{y_i} \right|$$
   Đo sai số tương đối theo phần trăm so với phí thực tế, hữu ích khi so sánh đơn hàng giá trị nhỏ và giá trị lớn.
4. **$R^2$ (Coefficient of Determination):**
   $$R^2 = 1 - \frac{\sum (y_i - \hat{y}_i)^2}{\sum (y_i - \bar{y})^2}$$
   Đo tỷ lệ biến thiên của phí vận chuyển được giải thích bởi các biến đầu vào trong mô hình.

---

## II. MÔ TẢ VÀ NGUỒN TẬP DỮ LIỆU

### 2.1 Nguồn gốc dữ liệu
Dự án sử dụng **Brazilian E-Commerce Public Dataset by Olist** được công bố chính thức trên [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce). Tập dữ liệu bao gồm thông tin của hơn **100.000 đơn hàng** thực tế từ năm 2016 đến 2018 tại nhiều bang trên toàn Brazil.

### 2.2 Chi tiết 9 bảng dữ liệu Olist

| STT | Tên tệp CSV | Số dòng ban đầu | Mô tả nội dung chính |
|:---:|:---|:---:|:---|
| 1 | `olist_orders_dataset.csv` | 99,441 | Thông tin trạng thái đơn hàng, timestamp mua hàng, giao hàng |
| 2 | `olist_order_items_dataset.csv` | 112,650 | Chi tiết từng item: `order_id`, `product_id`, `seller_id`, `price`, `freight_value` |
| 3 | `olist_products_dataset.csv` | 32,951 | Thông số sản phẩm: danh mục, kích thước (dài x rộng x cao), cân nặng |
| 4 | `olist_customers_dataset.csv` | 99,441 | Thông tin khách hàng, mã bưu chính (`customer_zip_code_prefix`), bang |
| 5 | `olist_sellers_dataset.csv` | 3,095 | Thông tin người bán, mã bưu chính (`seller_zip_code_prefix`), bang |
| 6 | `olist_geolocation_dataset.csv` | 1,000,163 | Tọa độ địa lý (vĩ độ, kinh độ) theo mã zip prefix của Brazil |
| 7 | `olist_order_payments_dataset.csv` | 103,886 | Hình thức thanh toán (credit card, boleto, voucher...), số kỳ trả góp |
| 8 | `olist_order_reviews_dataset.csv` | 99,224 | Điểm đánh giá (review score), nội dung phản hồi từ khách hàng |
| 9 | `product_category_name_translation.csv` | 71 | Bảng từ điển dịch tên danh mục sản phẩm từ tiếng Bồ Đào Nha sang tiếng Anh |

### 2.3 Dữ liệu sạch sau tiền xử lý (`olist_freight_clean.csv`)
* **Kích thước cuối cùng:** **108,336 dòng × 28 cột** (không còn ô trống thiếu, không trùng lặp grain).
* **Đơn vị phân tích (Grain):** Cặp `(order_id, order_item_id)` — đại diện cho 1 sản phẩm cụ thể trong một đơn hàng.
* **Đặc trưng phái sinh chính:**
  - `distance_km`: Khoảng cách đường chim bay (Haversine distance) tính theo tọa độ tâm giữa `seller_zip` và `customer_zip`.
  - `volume_cm3`: Thể tích đóng gói của sản phẩm ($Dài \times Rộng \times Cao$).
  - `is_same_state`: Biến cờ đánh dấu giao nội bang ($=1$) hay giao liên bang ($=0$).
  - `purchase_dayofweek`, `purchase_month`, `purchase_year`: Các đặc trưng thời gian mua hàng.

---

## III. CÁC CÔNG CỤ VÀ THƯ VIỆN SỬ DỤNG

Dự án được xây dựng hoàn toàn trên nền tảng mã nguồn mở phổ biến trong Khoa học Dữ liệu (Data Science):

| Nhóm công cụ | Tên công nghệ / Thư viện | Phiên bản / Mục đích sử dụng |
|:---|:---|:---|
| **Ngôn ngữ lập trình** | Python 3.10+ | Ngôn ngữ phân tích dữ liệu và xây dựng mô hình chính |
| **Xử lý & Biến đổi dữ liệu** | `pandas`, `numpy` | Thao tác trên DataFrame, tính toán ma trận, tiền xử lý và làm sạch dữ liệu lớn |
| **Cơ sở dữ liệu & Truy vấn** | `sqlite3`, SQL | Lưu trữ và thực thi 10 truy vấn phân tích nghiệp vụ sâu trên cơ sở dữ liệu quan hệ |
| **Trực quan hóa dữ liệu** | `matplotlib`, `seaborn` | Vẽ biểu đồ phân phối, heatmap tương quan, scatter plot và boxplot phân tích outlier |
| **Học máy & Thống kê** | `scikit-learn` | Xây dựng Pipeline chuẩn hóa, mô hình hồi quy (Linear, Ridge, Random Forest) và K-Fold CV |
| **Môi trường phát triển** | Jupyter Notebook, Google Colab, VS Code | Môi trường tương tác ghi chép và thực thi mã nguồn kèm tài liệu markdown |
| **Quản lý phiên bản & Mã nguồn**| Git & GitHub | Quản lý lịch sử mã nguồn dự án, làm việc nhóm |

---

## IV. CẤU TRÚC THƯ MỤC DỰ ÁN

```text
ADY201M-NHOM-8-AI2107/
│
├── data/                                    # Thư mục chứa dữ liệu
│   ├── raw/                                 # 9 file CSV gốc chưa qua xử lý từ Olist
│   │   ├── olist_orders_dataset.csv
│   │   ├── olist_order_items_dataset.csv
│   │   ├── olist_products_dataset.csv
│   │   ├── olist_customers_dataset.csv
│   │   ├── olist_sellers_dataset.csv
│   │   ├── olist_geolocation_dataset.csv
│   │   ├── olist_order_payments_dataset.csv
│   │   ├── olist_order_reviews_dataset.csv
│   │   └── product_category_name_translation.csv
│   │
│   └── clean/                               # Dữ liệu sạch sau tiền xử lý
│       └── olist_freight_clean.csv          # Bảng dữ liệu cuối cùng (108,336 dòng × 28 cột)
│
├── src/                                     # Toàn bộ mã nguồn dự án
│   ├── 01_data_cleaning/                    # [ĐÃ HOÀN THÀNH] Tiền xử lý, lọc lỗi, impute và tạo đặc trưng
│   │   └── Làm sạch và Chuẩn bị dữ liệu – Dự đoán phí vận chuyển Olist.ipynb
│   │
│   ├── 02_sql_analysis/                     # [ĐÃ HOÀN THÀNH] Phân tích khám phá dữ liệu chuyên sâu bằng SQL (SQL Scripts & Notebooks)
│   │   ├── SQL_Analysis_Freight_Full.ipynb  # Notebook thực thi 10 câu truy vấn SQLite kèm biểu đồ & insight
│   │   └── freight_analysis_queries.sql     # Script SQL thuần tập hợp 10 truy vấn phân tích nghiệp vụ
│   │
│   ├── 03_python_analysis/                  # [KẾ HOẠCH TIẾP THEO] Phân tích tương quan & EDA (Python)
│   │   └── eda_correlation.ipynb
│   │
│   ├── 04_regression/                       # [KẾ HOẠCH TIẾP THEO] Xây dựng và kiểm định mô hình học máy
│   │   └── regression_model.ipynb
│   │
│   └── 05_visualization/                    # [KẾ HOẠCH TIẾP THEO] Trực quan hóa và biểu đồ
│       └── charts.ipynb
│
├── reports/                                 # Báo cáo, slide thuyết trình và tài liệu nhóm
│   └── Báo cáo Làm sạch và Chuẩn bị dữ liệu – Dự đoán phí vận chuyển (Olist).docx
│
├── .gitignore                               # Quy tắc bỏ qua file tạm, cache
└── README.md                                # Tài liệu tổng quan dự án
```

---

## V. TÓM TẮT TIẾN ĐỘ & CÔNG VIỆC ĐÃ HOÀN THÀNH

> ⏳ **Hiện trạng tiến độ:** Nhóm đã hoàn thành xuất sắc các giai đoạn từ **Nghiên cứu dữ liệu**, **Làm sạch & Tiền xử lý dữ liệu** đến **Phân tích chuyên sâu bằng SQL (10 Queries)**. Các bước phân tích tương quan bằng Python (EDA), xây dựng mô hình hồi quy (Regression) và trực quan hóa (Visualization) là nội dung của giai đoạn tiếp theo.

### 1. Chọn đề tài & Nghiên cứu dữ liệu (Đã hoàn thành)
- Khảo sát thực trạng thị trường logistics TMĐT thế giới và Việt Nam, xác định vai trò trọng yếu của chi phí vận chuyển trong tỷ lệ bỏ rơi giỏ hàng.
- Lựa chọn đề tài, xác định bài toán, xây dựng 5 câu hỏi nghiên cứu (RQ1 - RQ5) và đặt ra các chỉ số định lượng đánh giá (MAE, RMSE, MAPE, R²).
- Nghiên cứu sơ đồ quan hệ thực thể (ERD) và cấu trúc 9 bảng dữ liệu từ Olist Kaggle.

### 2. Làm sạch & Tiền xử lý dữ liệu (Data Cleaning & Feature Engineering) (Đã hoàn thành)
Thực hiện toàn diện trong notebook `01_data_cleaning`:
- **Đánh giá chất lượng dữ liệu ban đầu:** Kiểm tra kiểu dữ liệu, tỷ lệ khuyết thiếu (missing values), dữ liệu trùng lặp và các giá trị sai miền vật lý.
- **Xử lý Geolocation:** Khử trùng lặp trên 1.000.000 dòng tọa độ địa lý, tính toán tâm vị trí trung bình theo từng mã `zip_code_prefix`.
- **Audit Trail 5 bước loại trừ dòng hợp lý:**
  1. Loại bỏ các đơn hàng chưa hoàn thành giao dịch (chỉ giữ đơn có trạng thái `delivered`).
  2. Lọc bỏ các dòng thiếu thông tin kích thước, cân nặng sản phẩm không thể suy luận.
  3. Lọc bỏ các sản phẩm có cân nặng hoặc kích thước bằng 0 (lỗi logic vật lý).
  4. Suy diễn tọa độ thiếu theo trọng tâm bang (chỉ ảnh hưởng 531 dòng ~ 0.49% dữ liệu, gắn cờ `geo_imputed = 1`).
  5. Giữ lại 379 dòng `freight_value = 0` theo quy tắc nghiệp vụ (đơn hàng hỗ trợ freeship).
  *=> Tổng số dòng loại bỏ là 4,314 dòng (chỉ chiếm 3.83%), thu được bảng chuẩn 108,336 dòng.*
- **Kỹ thuật tạo đặc trưng (Feature Engineering):**
  - Tính khoảng cách Haversine giữa người bán và người mua (`distance_km`).
  - Tính thể tích sản phẩm (`volume_cm3 = length * height * width`).
  - Gắn nhãn giao hàng nội bang (`is_same_state`).
- **Đầu ra:** Xuất bảng dữ liệu sạch `olist_freight_clean.csv` (108,336 dòng × 28 cột, Grain: `(order_id, order_item_id)`).

### 3. Phân tích chuyên sâu bằng SQL (10 Queries) (Đã hoàn thành)
Thực hiện nạp cơ sở dữ liệu SQLite trong notebook `02_sql_analysis`, giải quyết các khía cạnh định lượng của phí vận chuyển:
- **Query 1:** Phí ship trung bình theo 5 nhóm khoảng cách (dưới 100km, 100-500km, 500-1000km, 1000-2000km, trên 2000km) -> Xác nhận phí ship tăng rõ rệt khi vượt qua mốc 1000km.
- **Query 2:** So sánh giao hàng cùng bang vs khác bang -> Giao hàng nội bang tiết kiệm trung bình 35 - 45% chi phí vận chuyển.
- **Query 3:** Top 10 danh mục sản phẩm có phí ship cao nhất (Nội thất cồng kềnh, thiết bị công nghiệp nặng).
- **Query 4:** Phân tích phí ship theo nhóm trọng lượng sản phẩm.
- **Query 5:** Top 10 bang người bán có cước vận chuyển trung bình cao nhất (chủ yếu tập trung ở vùng sâu phía Bắc/Đông Bắc Brazil).
- **Query 6:** Khảo sát xu hướng biến động phí vận chuyển theo tháng/mùa vụ.
- **Query 7:** Tỷ lệ phí ship trên giá trị sản phẩm theo phân khúc giá (các sản phẩm giá rẻ dưới 50 R$ chịu tỷ lệ phí ship lên tới 30-40% giá trị đơn hàng).
- **Query 8:** Top 10 tuyến đường vận chuyển đắt đỏ nhất liên bang (chủ yếu từ các bang công nghiệp phía Nam như SC, PR đến các bang vùng sâu như PB, PA, CE).
- **Query 9:** Phân tích phí vận chuyển theo số lượng mặt hàng trong đơn (chỉ ra hiệu ứng gộp đơn giúp giảm phí trung bình trên từng sản phẩm).
- **Query 10:** Đánh giá chất lượng dữ liệu: kiểm tra tỷ lệ bản ghi bị suy diễn tọa độ theo từng bang người bán.

### 4. Kế hoạch giai đoạn tiếp theo (Đang triển khai)
- **Phân tích khám phá bằng Python (`03_python_analysis`):** Trực quan hóa ma trận tương quan (Pearson/Spearman), kiểm tra đa cộng tuyến (VIF) và khảo sát kỹ hơn phân phối lệch của phí vận chuyển.
- **Xây dựng mô hình hồi quy (`04_regression`):** Huấn luyện các mô hình Baseline (Linear Regression, Ridge, Lasso) và mô hình phi tuyến (Random Forest, Gradient Boosting), kết hợp kiểm định chéo 5-Fold Cross Validation.
- **Trực quan hóa và báo cáo (`05_visualization`):** Thiết kế dashboard biểu đồ trực quan và hoàn thiện báo cáo phân tích toàn diện.

---

## VI. PHÂN CÔNG CÔNG VIỆC & MINH CHỨNG ĐÓNG GÓP

### 6.1 Danh sách thành viên
Dự án được thực hiện bởi các thành viên **Nhóm 8 - Lớp AI2107**:

| STT | Họ và Tên | Mã Sinh Viên (MSSV) |
|:---:|:---|:---:|
| 1 | **Kiều Đại Dương** | **HE201928** |
| 2 | **Trần Chí Kiên** | **HE200774** |
| 3 | **Quách Xuân Thành** | **HE204852** |

---

### 6.2 Phân công trách nhiệm
Để đảm bảo tiến độ và chất lượng theo yêu cầu học phần, các thành viên trong nhóm thống nhất phân công trách nhiệm bình đẳng như sau:

| Thành viên | Trách nhiệm đảm nhiệm chính | Sản phẩm phụ trách |
|:---|:---|:---|
| **Kiều Đại Dương** | - Điều phối tiến độ dự án, khởi tạo và quản lý kho lưu trữ GitHub Repository.<br>- Viết nội dung **Báo cáo Phần 1** (Miêu tả bài toán thực tiễn, lý do chọn đề tài, mục tiêu nghiên cứu, câu hỏi nghiên cứu RQ1 - RQ5, chỉ số đánh giá).<br>- Phụ trách **Phần code SQL** (`src/02_sql_analysis/`): Thiết kế cấu trúc cơ sở dữ liệu SQLite, viết và tối ưu 10 câu truy vấn SQL phân tích chuyên sâu, trích xuất file script `freight_analysis_queries.sql`. | - Repository GitHub: `ADY201M-NHOM-8-AI2107`<br>- Tài liệu dự án: `README.md`<br>- Notebook: `src/02_sql_analysis/SQL_Analysis_Freight_Full.ipynb`<br>- Script SQL: `src/02_sql_analysis/freight_analysis_queries.sql`<br>- Soạn thảo Báo cáo Phần 1 |
| **Trần Chí Kiên** | - Phụ trách **Phần làm sạch & tiền xử lý dữ liệu** (`src/01_data_cleaning/`): Khảo sát 9 bảng dữ liệu Olist, khử trùng lặp 1.000.000 dòng tọa độ Geolocation, thiết kế Audit Trail 5 bước loại trừ dữ liệu lỗi, tính khoảng cách Haversine (`distance_km`) và thể tích (`volume_cm3`).<br>- Viết nội dung **Báo cáo từ Phần 2** (Chi tiết quy trình làm sạch và chuẩn bị dữ liệu, đánh giá chất lượng và xuất bảng sạch). | - Notebook: `src/01_data_cleaning/Làm sạch và Chuẩn bị dữ liệu – Dự đoán phí vận chuyển Olist.ipynb`<br>- Tập dữ liệu sạch: `data/clean/olist_freight_clean.csv`<br>- Soạn thảo Báo cáo từ Phần 2 |
| **Quách Xuân Thành** | - Cùng phối hợp phụ trách **Phần làm sạch & tiền xử lý dữ liệu** (`src/01_data_cleaning/`): Thẩm định kiểu dữ liệu, xử lý giá trị khuyết thiếu (imputation) theo trọng tâm bang, kiểm tra tính nhất quán logic nghiệp vụ của các trường giá và cước phí.<br>- Viết nội dung **Báo cáo từ Phần 2** (Phân tích các bước chuyển đổi dữ liệu, xử lý outlier và tổng hợp số liệu báo cáo). | - Phối hợp phát triển notebook `01_data_cleaning`<br>- File báo cáo chính thức: `reports/Báo cáo Làm sạch và Chuẩn bị dữ liệu – Dự đoán phí vận chuyển (Olist).docx`<br>- Soạn thảo Báo cáo từ Phần 2 |

---

### 6.3 Minh chứng đóng góp cụ thể

| Thành viên | Minh chứng công việc (Deliverables / Artifacts) | Trạng thái |
|:---|:---|:---:|
| **Kiều Đại Dương** | - Khởi tạo và quản trị kho lưu trữ GitHub, thiết lập nhánh `main`, file `.gitignore`, cấu trúc thư mục modular.<br>- Xây dựng notebook `02_sql_analysis` và xuất script `freight_analysis_queries.sql` với 10 câu truy vấn SQLite giải quyết các câu hỏi RQ1 - RQ3.<br>- Soạn thảo nội dung Phần 1 trong Báo cáo (Lý do chọn đề tài, bài toán, mục tiêu, chỉ số). | **Đã hoàn thành** |
| **Trần Chí Kiên** | - Xây dựng notebook `01_data_cleaning`: Xử lý 112.650 dòng dữ liệu ban đầu, giảm xuống 108.336 dòng qua 5 bước audit trail (loại 3,83% lỗi hợp lý).<br>- Xây dựng thuật toán khử trùng lặp 1.000.000 dòng Geolocation và tính khoảng cách Haversine `distance_km`.<br>- Xuất bảng dữ liệu sạch `olist_freight_clean.csv` kích thước 108.336 dòng × 28 cột.<br>- Soạn thảo nội dung Phần 2 trong tệp Báo cáo chính thức. | **Đã hoàn thành** |
| **Quách Xuân Thành** | - Cùng hoàn thiện pipeline làm sạch dữ liệu trong notebook `01_data_cleaning`, kiểm định chất lượng các biến đặc trưng sau khi merge 9 bảng.<br>- Xử lý thống kê outlier trên các biến vật lý và xác thực tính hợp lệ của mã bưu chính / mã bang.<br>- Soạn thảo nội dung Phần 2 trong tệp Báo cáo chính thức và tổng hợp file Word hoàn chỉnh `Báo cáo Làm sạch và Chuẩn bị dữ liệu – Dự đoán phí vận chuyển (Olist).docx` (189 KB). | **Đã hoàn thành** |

---

---
*Dự án phục vụ mục đích học tập và nghiên cứu môn học ADY201M. Mọi đóng góp và phản hồi xin vui lòng tạo Issue trên kho lưu trữ GitHub này.*
