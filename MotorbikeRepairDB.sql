IF DB_ID('MotorbikeRepairDB') IS NOT NULL
BEGIN
    ALTER DATABASE MotorbikeRepairDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE MotorbikeRepairDB;
END
GO

CREATE DATABASE MotorbikeRepairDB;
GO

USE MotorbikeRepairDB;
GO

/* ============================= */
/* 1. ROLES */
/* ============================= */
CREATE TABLE Roles (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(20) NOT NULL UNIQUE
);
GO

/* ============================= */
/* 2. USERS */
/* ============================= */
CREATE TABLE Users (
    Username NVARCHAR(20) PRIMARY KEY,
    Password NVARCHAR(255) NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    RoleID INT NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Users_Roles FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);
GO

CREATE TABLE UserProfiles (
    Username NVARCHAR(20) PRIMARY KEY,
    FullName NVARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(10),
    Address NVARCHAR(200),
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    CONSTRAINT FK_UserProfiles_Users FOREIGN KEY (Username) REFERENCES Users(Username)
);
GO

/* ============================= */
/* 3. CUSTOMERS */
/* ============================= */
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Phone VARCHAR(10) NOT NULL,
    Address NVARCHAR(200) NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    IsActive BIT NOT NULL DEFAULT 1
);
GO

/* ============================= */
/* 4. MOTORBIKES */
/* ============================= */
CREATE TABLE Motorbikes (
    MotoID NVARCHAR(20) PRIMARY KEY,
    CustomerID INT NOT NULL,
    Brand NVARCHAR(50) NOT NULL,
    Model NVARCHAR(50) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Motorbikes_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

/* ============================= */
/* 5. SERVICES */
/* ============================= */
CREATE TABLE Services (
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceName NVARCHAR(100) NOT NULL,
    Price DECIMAL(18,2) NOT NULL CHECK (Price >= 0),
    IsActive BIT NOT NULL DEFAULT 1
);
GO

/* ============================= */
/* 6. PARTS */
/* ============================= */
CREATE TABLE Parts (
    PartID INT IDENTITY(1,1) PRIMARY KEY,
    PartName NVARCHAR(100) NOT NULL,
    Price DECIMAL(18,2) NOT NULL CHECK (Price >= 0),
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    Description NVARCHAR(255),
    IsActive BIT NOT NULL DEFAULT 1
);
GO

/* ============================= */
/* 7. REPAIR ORDERS */
/* ============================= */
CREATE TABLE RepairOrders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    MotoID NVARCHAR(20) NOT NULL,
    CreatedBy NVARCHAR(20) NOT NULL,
    TechnicianUsername NVARCHAR(20) NULL,
    Description NVARCHAR(255),
    Status NVARCHAR(20) NOT NULL DEFAULT 'PENDING'
        CHECK (Status IN ('PENDING', 'PROCESSING', 'COMPLETED')),
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_RepairOrders_Motorbikes FOREIGN KEY (MotoID) REFERENCES Motorbikes(MotoID),
    CONSTRAINT FK_RepairOrders_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES Users(Username),
    CONSTRAINT FK_RepairOrders_Technician FOREIGN KEY (TechnicianUsername) REFERENCES Users(Username)
);
GO

/* ============================= */
/* 8. ORDER SERVICES */
/* ============================= */
CREATE TABLE OrderServices (
    OrderServiceID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ServiceID INT NOT NULL,
    CONSTRAINT FK_OrderServices_RepairOrders FOREIGN KEY (OrderID) REFERENCES RepairOrders(OrderID) ON DELETE CASCADE,
    CONSTRAINT FK_OrderServices_Services FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
GO

/* ============================= */
/* 9. ORDER PARTS */
/* ============================= */
CREATE TABLE OrderParts (
    OrderPartID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    PartID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    CONSTRAINT FK_OrderParts_RepairOrders FOREIGN KEY (OrderID) REFERENCES RepairOrders(OrderID) ON DELETE CASCADE,
    CONSTRAINT FK_OrderParts_Parts FOREIGN KEY (PartID) REFERENCES Parts(PartID)
);
GO

/* ============================= */
/* 10. INVOICES */
/* ============================= */
CREATE TABLE Invoices (
    InvoiceID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL UNIQUE,
    TotalAmount DECIMAL(18,2) NOT NULL CHECK (TotalAmount >= 0),
    PaymentDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Invoices_RepairOrders FOREIGN KEY (OrderID) REFERENCES RepairOrders(OrderID)
);
GO

/* ============================= */
/* 11. CUSTOMER BOOKINGS */
/* ============================= */
CREATE TABLE CustomerBookings (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NULL,
    FullName NVARCHAR(100) NOT NULL,
    Phone VARCHAR(10) NOT NULL,
    Motorbike NVARCHAR(100) NOT NULL DEFAULT N'Chua cap nhat',
    Problem NVARCHAR(255) NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'WAITING'
        CHECK (Status IN ('WAITING', 'CONFIRMED', 'CANCELLED')),
    GeneratedMotoID NVARCHAR(20) NULL,
    ConfirmedOrderID INT NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    ConfirmedDate DATETIME NULL,
    CONSTRAINT FK_CustomerBookings_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_CustomerBookings_RepairOrders FOREIGN KEY (ConfirmedOrderID) REFERENCES RepairOrders(OrderID)
);
GO

/* ============================= */
/* INSERT ROLES */
/* ============================= */
INSERT INTO Roles (RoleName)
VALUES (N'ADMIN'), (N'STAFF');
GO

/* ============================= */
/* INSERT USERS */
/* ============================= */
INSERT INTO Users (Username, Password, FullName, RoleID)
VALUES
    (N'admin', N'admin1234', N'Nguyen Van Admin', 1),
    (N'staff1', N'staff1234', N'Tran Van Nhan Vien 1', 2),
    (N'staff2', N'staff1234', N'Le Thi Nhan Vien 2', 2);
GO

/* ============================= */
/* INSERT USER PROFILES */
/* ============================= */
INSERT INTO UserProfiles (Username, FullName, Email, Phone, Address, DateOfBirth, Gender)
VALUES
    (N'admin', N'Nguyen Van Admin', 'admin@gmail.com', '0912567231', N'Ha Noi', '1995-05-10', N'Male'),
    (N'staff1', N'Tran Van Nhan Vien 1', 'staff1@gmail.com', '0900000002', N'Ha Noi', '1998-03-12', N'Male'),
    (N'staff2', N'Le Thi Nhan Vien 2', 'staff2@gmail.com', '0900000003', N'Ha Noi', '1999-07-20', N'Female');
GO

/* ============================= */
/* INSERT CUSTOMERS */
/* ============================= */
INSERT INTO Customers (FullName, Phone, Address)
VALUES
    (N'Pham Minh Tuan', '0901111111', N'Ha Noi'),
    (N'Nguyen Thi Lan', '0902222222', N'Ha Noi'),
    (N'Le Van Hoang', '0903333333', N'Da Nang'),
    (N'Nguyen Van A', '0904444444', N'Ha Noi'),
    (N'Tran Thi B', '0905555555', N'Hai Phong'),
    (N'Khach Moi 1', '0906666666', N'Ha Noi'),
    (N'Khach Moi 2', '0907777777', N'Ha Noi');
GO

/* ============================= */
/* INSERT MOTORBIKES */
/* ============================= */
INSERT INTO Motorbikes (MotoID, CustomerID, Brand, Model)
VALUES
    (N'30F112345', 1, N'Honda', N'Wave Alpha'),
    (N'29G167890', 2, N'Yamaha', N'Exciter 150'),
    (N'43H111111', 3, N'Suzuki', N'Raider'),
    (N'30K122222', 4, N'Honda', N'Vision'),
    (N'31M133333', 5, N'Yamaha', N'Janus');
GO

/* ============================= */
/* INSERT SERVICES */
/* ============================= */
INSERT INTO Services (ServiceName, Price)
VALUES
    (N'Thay nhot', 80000),
    (N'Rua xe', 30000),
    (N'Ve sinh bugi', 50000),
    (N'Thay lop', 250000),
    (N'Kiem tra tong quat', 100000);
GO

/* ============================= */
/* INSERT PARTS */
/* ============================= */
INSERT INTO Parts (PartName, Price, Quantity, Description)
VALUES
    (N'Nhot Castrol 1L', 120000, 50, N'Nhot tong hop'),
    (N'Bugi NGK', 70000, 40, N'Bugi chinh hang'),
    (N'Lop Michelin', 450000, 20, N'Lop khong ruot'),
    (N'Ac quy GS', 350000, 15, N'Ac quy 12V'),
    (N'Loc gio Honda', 90000, 30, N'Loc gio chinh hang');
GO

/* ============================= */
/* INSERT REPAIR ORDERS */
/* ============================= */
INSERT INTO RepairOrders (MotoID, CreatedBy, TechnicianUsername, Description, Status)
VALUES
    (N'30F112345', N'staff1', N'staff2', N'Xe kho no buoi sang', N'PROCESSING'),
    (N'29G167890', N'staff1', N'staff1', N'Thay nhot dinh ky', N'PENDING'),
    (N'43H111111', N'admin', N'staff2', N'Thay lop va ve sinh bugi', N'COMPLETED'),
    (N'30K122222', N'staff2', N'staff1', N'Xe bi hao xang', N'PROCESSING'),
    (N'31M133333', N'staff1', N'staff2', N'Xe rung manh khi chay', N'PENDING');
GO

/* ============================= */
/* INSERT ORDER SERVICES */
/* ============================= */
INSERT INTO OrderServices (OrderID, ServiceID)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 4),
    (3, 3),
    (4, 5),
    (5, 5);
GO

/* ============================= */
/* INSERT ORDER PARTS */
/* ============================= */
INSERT INTO OrderParts (OrderID, PartID, Quantity)
VALUES
    (1, 1, 1),
    (1, 2, 1),
    (3, 3, 2),
    (4, 5, 1);
GO

/* ============================= */
/* INSERT INVOICES */
/* ============================= */
INSERT INTO Invoices (OrderID, TotalAmount, PaymentDate)
VALUES
    (3, 1150000, GETDATE());
GO

/* ============================= */
/* INSERT CUSTOMER BOOKINGS */
/* ============================= */
INSERT INTO CustomerBookings (CustomerID, FullName, Phone, Motorbike, Problem, Status)
VALUES
    (6, N'Khach Moi 1', '0906666666', N'Chua cap nhat', N'Vision 2022 bi kho de, can dat lich xem xe', 'WAITING'),
    (7, N'Khach Moi 2', '0907777777', N'Chua cap nhat', N'Air Blade bi keu phanh, muon dat lich truoc', 'WAITING');
GO
