# 🏍️ Motorbike Repair Shop Management System
> **Hệ thống Quản lý Cửa hàng Sửa chữa Xe máy**  
> Dự án môn **PRJ301** (Java Web Application) | Kỳ **SP26** - FPT University

[![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.oracle.com/java/)
[![Servlet/JSP](https://img.shields.io/badge/Servlet%2FJSP-007396?style=for-the-badge&logo=java&logoColor=white)](https://jakarta.ee/)
[![Microsoft SQL Server](https://img.shields.io/badge/MS_SQL_Server-CC292B?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/en-us/sql-server/)
[![Apache Tomcat](https://img.shields.io/badge/Apache_Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black)](https://tomcat.apache.org/)
[![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)]()

---

## 📌 1. Giới thiệu dự án (Overview)

**Motorbike Repair Shop Management System** là một ứng dụng web được thiết kế và phát triển nhằm tối ưu hóa quy trình quản lý hoạt động kinh doanh và dịch vụ tại các cửa hàng sửa chữa xe máy. Hệ thống giải quyết các bài toán về đặt lịch hẹn trực tuyến của khách hàng, tạo và theo dõi đơn sửa chữa, quản lý kho phụ tùng, danh mục dịch vụ, xuất hóa đơn thanh toán và quản lý nhân sự.

Ứng dụng được xây dựng theo kiến trúc **MVC (Model - View - Controller)** chuẩn với backend sử dụng **Java Servlet & JSP**, thao tác dữ liệu qua **JDBC**, cơ sở dữ liệu **Microsoft SQL Server**, mang lại sự ổn định, an toàn và phân quyền bảo mật chặt chẽ giữa Quản trị viên (Admin) và Nhân viên (Staff).

---

## ✨ 2. Tính năng chính (Key Features)

### 👤 2.1 Khách hàng (Customer / Guest)
- **Đặt lịch hẹn trực tuyến (Online Booking Form):** Cho phép khách hàng gửi thông tin cá nhân, thông tin xe và mô tả sự cố cần sửa chữa mà không cần đăng nhập.
- **Trang chủ (Home Page):** Giới thiệu về cửa hàng và điều hướng nhanh đến biểu mẫu đặt lịch.

### 👨‍🔧 2.2 Nhân viên (Staff)
- **Tổng quan (Staff Dashboard):** Xem thống kê tổng quan về trạng thái các đơn sửa chữa.
- **Quản lý lịch hẹn (Booking List):** Tiếp nhận, xác nhận thông tin đặt lịch của khách hàng và tự động tạo đơn sửa chữa (Repair Order).
- **Quản lý đơn sửa chữa (Repair Order Management):** 
  - Tạo đơn sửa chữa trực tiếp hoặc từ lịch hẹn.
  - Cập nhật linh kiện/phụ tùng sử dụng và các dịch vụ sửa chữa thực hiện.
  - Theo dõi trạng thái đơn (`PENDING`, `PROCESSING`, `COMPLETED`).
- **Xuất hóa đơn (Invoice):** Xem và tạo hóa đơn chi tiết (bao gồm tổng tiền phụ tùng + dịch vụ) để bàn giao cho khách hàng.
- **Tra cứu:** Tra cứu danh sách linh kiện, phụ tùng và bảng giá dịch vụ của cửa hàng.

### 👑 2.3 Quản trị viên (Admin)
Sở hữu toàn bộ quyền hạn của Nhân viên, kết hợp thêm các chức năng quản trị nâng cao:
- **Dashboard Quản trị nâng cao (Admin Dashboard):**
  - Thống kê chi tiết đơn hàng (Booking, Pending, Processing, Completed, Total).
  - Báo cáo doanh thu tài chính (Financial Report VND) theo **Ngày**, **Tháng** và **Năm**.
  - Xếp hạng hiệu suất kỹ thuật viên xuất sắc trong tháng (Monthly Technician Performance).
  - Thống kê top khách hàng sửa chữa nhiều nhất.
- **Quản lý nhân sự (Staff Management):** Thêm mới, chỉnh sửa thông tin, tìm kiếm, xem chi tiết và xóa tài khoản nhân viên/admin.
- **Quản lý kho phụ tùng (Parts Management):** Thêm mới, cập nhật giá, số lượng tồn kho, mô tả và xóa phụ tùng.
- **Quản lý dịch vụ (Services Management):** Quản lý danh mục dịch vụ sửa chữa và điều chỉnh bảng giá niêm yết.
- **Quản lý đơn hàng & Hóa đơn nâng cao:** Quyền chỉnh sửa, xóa hoặc hủy đơn sửa chữa.

---

## 🔐 3. Bảng phân quyền hệ thống (Authorization Matrix)

| Chức năng / Màn hình | Admin | Staff | Guest / Customer |
| :--- | :---: ]---: | :---: |
| **Đăng nhập (Login)** | ✅ | ✅ | ❌ |
| **Trang chủ (Home Page)** | ✅ | ✅ | ✅ |
| **Biểu mẫu đặt lịch (Booking Form)** | ✅ | ✅ | ✅ |
| **Admin Dashboard (Doanh thu & Hiệu suất)** | ✅ | ❌ | ❌ |
| **Staff Dashboard (Tổng quan đơn hàng)** | ✅ | ✅ | ❌ |
| **Xem & Xác nhận Lịch hẹn (Booking List)** | ✅ | ✅ | ❌ |
| **Tạo & Quản lý Đơn sửa chữa (Repair Orders)** | ✅ | ✅ | ❌ |
| **Xuất & Xem Hóa đơn (Invoices)** | ✅ | ✅ | ❌ |
| **Xem danh sách Phụ tùng & Dịch vụ** | ✅ | ✅ | ❌ |
| **Quản lý Kho Phụ tùng (Thêm/Sửa/Xóa)** | ✅ | ❌ | ❌ |
| **Quản lý Dịch vụ (Thêm/Sửa/Xóa)** | ✅ | ❌ | ❌ |
| **Quản lý Tài khoản Nhân viên (Thêm/Sửa/Xóa)** | ✅ | ❌ | ❌ |

---

## 🛠️ 4. Công nghệ sử dụng (Tech Stack)

- **Ngôn ngữ lập trình:** Java (JDK 8 / JDK 17+)
- **Nền tảng Web Backend:** Java Servlet (Jakarta/Java EE), JSP (JavaServer Pages), JSTL
- **Truy xuất dữ liệu:** JDBC (Java Database Connectivity) với Kiến trúc DAO (Data Access Object)
- **Cơ sở dữ liệu:** Microsoft SQL Server
- **Frontend UI:** HTML5, CSS3, JavaScript, Custom Responsive Styling
- **Công cụ phát triển (IDE) & Server:** NetBeans IDE / Eclipse / IntelliJ IDEA, Apache Tomcat 9.0+, Apache Ant (`build.xml`)

---

## 📁 5. Cấu trúc thư mục dự án (Project Structure)

```text
motobikerepairshop/
├── db/
│   └── MotorbikeRepairDB.sql       # Script khởi tạo Database & Bảng & Dữ liệu mẫu
├── src/java/
│   ├── controllers/                # Servlets xử lý Request/Response & Điều hướng
│   ├── dal/                        # Data Access Layer (DBContext & các DAO)
│   │   ├── DBContext.java          # Lớp kết nối SQL Server qua JDBC
│   │   ├── UserDAO.java
│   │   ├── RepairOrderDAO.java
│   │   ├── CustomerBookingDAO.java
│   │   ├── PartDAO.java
│   │   ├── ServicesDAO.java
│   │   └── ...
│   └── models/                     # JavaBean / Model Entities (User, RepairOrder, Part,...)
├── web/                            # Giao diện Web (JSP, CSS, JS, Images)
│   ├── META-INF/
│   ├── WEB-INF/
│   │   ├── web.xml                 # Cấu hình Servlet & Mapping
│   │   └── ConnectDB.properties    # Thông tin kết nối SQL Server (User, Password, URL)
│   ├── css/
│   ├── js/
│   └── *.jsp                       # Các màn hình JSP (login, dashboard, order,...)
├── build.xml                       # File cấu hình Build Apache Ant
├── nbproject/                      # Cấu hình dự án NetBeans
└── README.md                       # File tài liệu hướng dẫn dự án
```

---

## 🗄️ 6. Mô hình Cơ sở Dữ liệu (Database Schema)

Dự án sử dụng cơ sở dữ liệu **`MotorbikeRepairDB`** gồm 12 bảng được thiết kế chuẩn hóa:

1. **`Roles`**: Danh mục phân quyền (`ADMIN`, `STAFF`).
2. **`Users`**: Tài khoản người dùng đăng nhập hệ thống.
3. **`UserProfiles`**: Thông tin chi tiết của người dùng (Email, SĐT, Địa chỉ, Ngày sinh,...).
4. **`Customers`**: Thông tin khách hàng.
5. **`Motorbikes`**: Thông tin xe máy (Biển số `MotoID`, Hãng xe `Brand`, Dòng xe `Model`).
6. **`CustomerBookings`**: Thông tin yêu cầu đặt lịch hẹn sửa chữa từ khách hàng.
7. **`RepairOrders`**: Đơn sửa chữa trung tâm (mô tả lỗi, trạng thái, kỹ thuật viên phụ trách).
8. **`Parts`**: Danh mục phụ tùng/linh kiện trong kho và đơn giá.
9. **`OrderParts`**: Phụ tùng và số lượng sử dụng cho từng đơn sửa chữa.
10. **`Services`**: Danh mục các gói/dịch vụ sửa chữa và tiền công.
11. **`OrderServices`**: Dịch vụ thực hiện cho từng đơn sửa chữa.
12. **`Invoices`**: Hóa đơn thanh toán hoàn tất đơn sửa chữa.

---

## 🚀 7. Hướng dẫn Cài đặt & Chạy Dự án (Setup Guide)

### 📋 7.1 Yêu cầu môi trường (Prerequisites)
- **Java Development Kit (JDK):** JDK 8 trở lên (khuyên dùng JDK 17).
- **Web Server:** Apache Tomcat 9.0 (hoặc Tomcat 10+ tương thích).
- **Database Server:** Microsoft SQL Server & SQL Server Management Studio (SSMS).
- **IDE:** NetBeans IDE 12+ (hoặc Eclipse/IntelliJ IDEA đã tích hợp Apache Ant).

---

### 🗂️ 7.2 Các bước thực hiện (Step-by-Step)

#### **Bước 1: Clone dự án về máy**
```bash
git clone https://github.com/your-username/motobikerepairshop.git
cd motobikerepairshop
```

#### **Bước 2: Cấu hình Cơ sở dữ liệu (SQL Server)**
1. Mở ứng dụng **SQL Server Management Studio (SSMS)**.
2. Mở file script SQL tại đường dẫn: [`db/MotorbikeRepairDB.sql`](file:///C:/Users/ADMIN/Desktop/motobikerepairshop%20-%20Copy/db/MotorbikeRepairDB.sql).
3. Thực thi (Execute) toàn bộ script để tự động tạo Database `MotorbikeRepairDB`, các bảng và dữ liệu mẫu mặc định.

#### **Bước 3: Cấu hình Chuỗi kết nối DB (ConnectDB.properties)**
Mở file `ConnectDB.properties` trong thư mục `web/WEB-INF/` hoặc `src/java/` và cập nhật tài khoản kết nối SQL Server của bạn:
```properties
userID=sa
password=your_password
url=jdbc:sqlserver://localhost:1433;databaseName=MotorbikeRepairDB;encrypt=false;trustServerCertificate=true
```

#### **Bước 4: Mở và Chạy dự án trên NetBeans IDE**
1. Mở **NetBeans IDE**, chọn `File` -> `Open Project...` và chọn thư mục dự án `motobikerepairshop`.
2. Chuột phải vào tên Project -> chọn `Properties` -> mục `Run`, kiểm tra Server đã được gán là **Apache Tomcat**.
3. Thêm file thư viện JDBC Driver (`mssql-jdbc-xxx.jar`) vào thư mục `Libraries` nếu chưa có.
4. Chuột phải vào Project -> chọn **Clean and Build**.
5. Nhấn **Run** (F6) để chạy dự án. Ứng dụng sẽ tự động mở trên trình duyệt tại địa chỉ mặc định:
   `http://localhost:8080/motobikerepairshop/`

---

## 🔑 8. Tài khoản dùng thử (Default Test Accounts)

Hệ thống được khởi tạo sẵn các tài khoản mặc định sau trong Database để phục vụ kiểm thử:

| Vai trò (Role) | Username | Password | Quyền truy cập |
| :--- | :--- | :--- | :--- |
| **Admin** | `admin` | `admin1234` | Toàn bộ quyền quản trị hệ thống, nhân sự, doanh thu |
| **Staff** | `staff1` | `staff1234` | Quản lý đơn hàng, đặt lịch, linh kiện, xuất hóa đơn |

---

## 👥 9. Thành viên thực hiện (Group 3 - PRJ301 SP26)

| MSSV | Họ và tên | Vai trò & Đóng góp | Tỷ lệ (%) |
| :---: | :--- | :--- | :---: |
| **HE191348** | **Nguyễn Bá Kiên** | Thiết kế Database, phát triển module Quản lý Nhân sự, Phụ tùng, Dịch vụ & Đặt lịch | **33.3%** |
| **HE194702** | **Đinh Quang Minh** | Phát triển module Dashboard báo cáo, Đơn sửa chữa (Repair Order) & Đặt lịch | **33.3%** |
| **HE195106** | **Đinh Tuấn Anh** | Xử lý Validation dữ liệu, Kiểm thử & phát triển tính năng Đặt lịch | **33.3%** |

---

## 📜 10. Giấy phép & Lưu ý (License & Disclaimer)

Dự án này được phát triển phục vụ mục đích học tập và đánh giá cho môn học **PRJ301 (Java Web Application)** tại Trường Đại học FPT. Mọi hành vi sao chép hoặc thương mại hóa vui lòng ghi rõ nguồn tác giả.