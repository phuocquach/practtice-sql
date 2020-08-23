-- MSSQL Server
CREATE TABLE Customers (
    Id INT NOT NULL IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDay TIMESTAMP,
    PRIMARY Key (Id)
);

CREATE TABLE CustomerAddresses (
    Id INT NOT NULL IDENTITY(1,1),
    StreetName VARCHAR(50),
    StreetNo VARCHAR(10),
    DistrictName VARCHAR(50),
    CityName VARCHAR(50),
    PostalCode VARCHAR(50),
    CustomerId INT FOREIGN KEY REFERENCES Customers(Id),
    Selecting BOOLEAN
);

CREATE TABLE Products (
    Id INT NOT Null IDENTITY(1,1),
    Name VARCHAR (50),
    Price FLOAT (50,25),
    Status INT,
);

CREATE TABLE Orders (
    Id INT NOT Null IDENTITY(1,1),
    Total FLOAT (50,25),
    CustomerId INT FOREIGN Key REFERENCES Customers(Id),
    PaymentMethod INT,
    Paid BOOLEAN,
    DeliveryMethod INT,
    Processed BOOLEAN
);

CREATE TABLE OrderDetails (
    Id INT NOT Null IDENTITY(1,1),
    OrderId INT FOREIGN KEY REFERENCES Orders(Id),
    ProductId INT FOREIGN KEY REFERENCES Products(Id),
    ProductPrice FLOAT (50,25),
    Quantity TINYINT,
    Total FLOAT (50,25)
);

CREATE TABLE ProcessOrders (
    Id INT NOT NUll IDENTITY(1,1),
    OrderId INT FOREIGN KEY REFERENCES Orders(Id),
    ShipperId INT FOREIGN KEY REFERENCES Shippers (Id),
    ShippingAddress VARCHAR (MAX),
    Status INT NOT NULL,
);

CREATE TABLE Shippers (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDay TIMESTAMP
);

CREATE TABLE Transports(
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Brand VARCHAR(50),
    OriginalPrice FLOAT(50,50),
    Status INT,
    ShipperId INT FOREIGN KEY REFERENCES Shippers(Id)
);

CREATE TABLE Audits (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TableName VARCHAR(50),
    RecordId INT,
    Action INT NOT NULL, --Create, Update, Delete, Read
    ActionTime TIMESTAMP,
    Status INT,
    CONSTRAINT UC_UniqueRecordInTable UNIQUE (TableName, RecordId)
);