-- Table 1: Users
CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Table 2: Products
CREATE TABLE Products (
    ProductId INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(150) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT DEFAULT 0
);

-- Table 3: Orders
CREATE TABLE Orders (
    OrderId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
