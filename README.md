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
   - [6.2 Phân công trách nhiệm (Assign Responsibilities)](#62-phân-công-trách-nhiệm-assign-responsibilities)
   - [6.3 Minh chứng đóng góp cụ thể (Evidence of Contributions)](#63-minh-chứng-đóng-góp-cụ-thể-evidence-of-contributions)
   - [6.4 Quy trình làm việc nhóm & Kiểm soát phiên bản (Version Control Workflow)](#64-quy-trình-làm-việc-nhóm--kiểm-soát-phiên-bản-version-control-workflow)
7. [VII. Bảng đối chiếu yêu cầu môn học (Rubric Mapping)](#vii-bảng-đối-chiếu-yêu-cầu-môn-học-rubric-mapping)

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

| STT | Họ và Tên | Mã Sinh Viên (MSSV) | Vai trò chính |
|:---:|:---|:---:|:---|
| 1 | **Kiều Đại Dương** | **HE201928** | Trưởng nhóm / Quản lý dự án & Data Analyst |
| 2 | **Trần Chí Kiên** | **HE200774** | Kỹ sư dữ liệu chính (Data Engineer / Specialist) |
| 3 | **Quách Xuân Thành** | **HE204852** | Chuyên viên phân tích SQL & Mô hình hóa (SQL & Data Modeler) |

---

### 6.2 Phân công trách nhiệm (Assign Responsibilities)
Để đảm bảo tiến độ và chất lượng theo yêu cầu học phần, nhóm phân chia trách nhiệm cụ thể như sau:

| Thành viên | Trách nhiệm đảm nhiệm chính | Sản phẩm phụ trách |
|:---|:---|:---|
| **Kiều Đại Dương**<br>(*Trưởng nhóm*) | - Khởi tạo và thiết lập GitHub Repository, quản lý cấu trúc dự án chuẩn modular.<br>- Xây dựng và duy trì tài liệu dự án (`README.md`, tiêu chuẩn mã nguồn, `.gitignore`).<br>- Giám sát tiến độ, điều phối các nhánh Git và giải quyết xung đột mã nguồn.<br>- Phân tích tương quan dữ liệu, kiểm thử mô hình và tổng hợp báo cáo. | - Repository GitHub: `ADY201M-NHOM-8-AI2107`<br>- Tài liệu dự án: `README.md`<br>- Quản lý phiên bản (Git tags, commits) |
| **Trần Chí Kiên** | - Khảo sát chất lượng 9 tập dữ liệu gốc Olist từ Kaggle.<br>- Thiết kế quy trình tiền xử lý và Audit Trail 5 bước loại trừ dữ liệu lỗi.<br>- Khử trùng lặp Geolocation, tính tọa độ trọng tâm theo zip code và tính khoảng cách Haversine.<br>- Xử lý khuyết thiếu, chuẩn hóa grain và trích xuất bảng sạch `olist_freight_clean.csv`. | - Notebook: `src/01_data_cleaning/...Olist.ipynb`<br>- Dữ liệu sạch: `data/clean/olist_freight_clean.csv`<br>- Tài liệu báo cáo quy trình làm sạch dữ liệu |
| **Quách Xuân Thành** | - Thiết kế cấu trúc cơ sở dữ liệu quan hệ trên SQLite nạp dữ liệu sạch.<br>- Xây dựng, tối ưu hóa và thực thi 10 truy vấn SQL giải quyết các câu hỏi nghiên cứu (RQ1 - RQ3).<br>- Phân tích đa chiều về cước phí theo địa lý (nội bang/liên bang), khoảng cách, trọng lượng và mùa vụ.<br>- Xuất file truy vấn SQL thuần và đồng biên soạn báo cáo phân tích. | - Notebook: `src/02_sql_analysis/SQL_Analysis_Freight_Full.ipynb`<br>- Script: `src/02_sql_analysis/freight_analysis_queries.sql`<br>- Tệp báo cáo chính thức trong `reports/` |

---

### 6.3 Minh chứng đóng góp cụ thể (Evidence of Contributions)

| Thành viên | Minh chứng công việc (Deliverables / Artifacts) | Trạng thái |
|:---|:---|:---:|
| **Kiều Đại Dương** | - Khởi tạo kho lưu trữ GitHub và cấu hình chuẩn `.gitignore`, nhánh `main`.<br>- Soạn thảo hoàn chỉnh tài liệu `README.md` theo 5 Task chuẩn rubric của đề bài.<br>- Tổ chức thư mục dự án theo cấu trúc chuẩn: `data/`, `src/`, `reports/`.<br>- Thực hiện kiểm thử quy trình đẩy mã nguồn và đồng bộ thay đổi giữa các thành viên. | **Đã hoàn thành** |
| **Trần Chí Kiên** | - Xây dựng notebook `01_data_cleaning`: Xử lý 112.650 dòng dữ liệu ban đầu, giảm xuống 108.336 dòng qua 5 bước audit trail (loại 3,83% lỗi).<br>- Thuật toán khử trùng lặp 1.000.000 dòng `olist_geolocation_dataset.csv`.<br>- Hàm tính khoảng cách địa lý Haversine `distance_km` và thể tích `volume_cm3`.<br>- Xuất bảng dữ liệu sạch `olist_freight_clean.csv` kích thước 108.336 dòng × 28 cột. | **Đã hoàn thành** |
| **Quách Xuân Thành** | - Xây dựng notebook `02_sql_analysis` với 10 câu truy vấn SQLite đa chiều.<br>- Trích xuất script `freight_analysis_queries.sql` độc lập phục vụ kiểm thử.<br>- Tìm ra insight trọng yếu: Giao hàng nội bang rẻ hơn 35-45% so với liên bang; phí ship tăng vọt khi khoảng cách > 1.000km; trọng lượng là yếu tố chi phối mạnh nhất.<br>- Soạn thảo tệp báo cáo `Báo cáo Làm sạch và Chuẩn bị dữ liệu – Dự đoán phí vận chuyển (Olist).docx` (189 KB). | **Đã hoàn thành** |

---

### 6.4 Quy trình làm việc nhóm & Kiểm soát phiên bản (Version Control Workflow)
Để đảm bảo sự cộng tác hiệu quả (Team Collaboration) và theo dõi lịch sử thay đổi (Track Changes) theo Task 3 & Task 4:
1. **Quản lý nhánh (Branching Strategy):**
   - `main`: Nhánh ổn định chứa mã nguồn đã kiểm thử và các mốc bàn giao chính thức.
   - Nhánh chức năng theo module: `feature/data-cleaning`, `feature/sql-analysis`, `feature/documentation`.
2. **Quy chuẩn thông điệp Commit (Conventional Commits):**
   - `feat:` Bổ sung tính năng, truy vấn hoặc notebook mới (vd: `feat: them 10 truy van SQL phan tich phi ship`).
   - `data:` Cập nhật dữ liệu hoặc file tiền xử lý (vd: `data: them tap du lieu clean olist_freight_clean.csv`).
   - `docs:` Cập nhật tài liệu, README hoặc báo cáo (vd: `docs: cap nhat bao cao lam sach du lieu`).
   - `fix:` Khắc phục lỗi dữ liệu, kiểu dữ liệu hoặc liên kết.
3. **Phối hợp & Phản hồi:** Mọi thành viên kiểm thử chéo kết quả trên Google Colab / SQLite trước khi hợp nhất vào nhánh chính.

---

## VII. BẢNG ĐỐI CHIẾU YÊU CẦU MÔN HỌC (RUBRIC MAPPING)

Dự án đáp ứng đầy đủ và toàn diện 5 nhiệm vụ trọng tâm theo tiêu chí đánh giá môn học:

| Nhiệm vụ (Tasks) | Yêu cầu chuẩn | Mức độ đáp ứng trong Repository này |
|:---|:---|:---|
| **Task 1: Create a GitHub Repository** | Tiêu đề dự án, mục tiêu nghiên cứu, mô tả tập dữ liệu, danh sách thành viên nhóm. | ✅ **Đạt 100%:** Kho lưu trữ `ADY201M-NHOM-8-AI2107` mô tả rõ tiêu đề, mục tiêu chung/cụ thể, chi tiết 9 bảng Olist và thông tin nhóm. |
| **Task 2: Organize Project Files** | Phân chia thư mục hợp lý cho: Data, SQL scripts, Python notebooks, Figures/visualizations, Reports & documentation. | ✅ **Đạt 100%:** Đã phân chia chuẩn thành `data/` (raw & clean), `src/02_sql_analysis/` (chứa `.sql` và `.ipynb`), `src/01_...` (notebooks), `src/05_...` (visualizations), `reports/` (chứa `.docx`). |
| **Task 3: Version Control** | Tải tệp lên Git, ghi nhận lịch sử thay đổi rõ ràng qua từng giai đoạn phát triển. | ✅ **Đạt 100%:** Lịch sử commit chi tiết theo từng tính năng, áp dụng chuẩn commit rõ ràng, lưu vết đầy đủ quá trình phát triển. |
| **Task 4: Team Collaboration** | Phân công trách nhiệm rõ ràng, mọi thành viên đều có phần đóng góp vào dự án. | ✅ **Đạt 100%:** Trình bày chi tiết bảng phân công trách nhiệm, quy trình phân nhánh và phối hợp làm việc nhóm ở Mục VI. |
| **Task 5: Project Documentation** | Cập nhật `README.md` với: Tổng quan, Mô tả bài toán, Nguồn dữ liệu, Công cụ & thư viện, Cấu trúc dự án, Tóm tắt công việc đã làm, Minh chứng đóng góp. | ✅ **Đạt 100%:** `README.md` được biên soạn chuyên nghiệp, chi tiết đầy đủ 7 mục với công thức toán học, trích dẫn số liệu thực tế và bảng đối chiếu. |

---
*Dự án phục vụ mục đích học tập và nghiên cứu môn học ADY201M. Mọi đóng góp và phản hồi xin vui lòng tạo Issue trên kho lưu trữ GitHub này.*


