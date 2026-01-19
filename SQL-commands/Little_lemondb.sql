CREATE DATABASE Little_lemondb
use Little_lemondb;

CREATE TABLE Customers
(
    CustomerID VARCHAR(20) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    Country VARCHAR(50),
    PostalCode VARCHAR(20),
    CountryCode VARCHAR(5)
);

CREATE TABLE Orders
(
    OrderID VARCHAR(20) PRIMARY KEY,
    OrderDate DATE NOT NULL,
    DeliveryDate DATE,
    CustomerID VARCHAR(20),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(10,2),
    DeliveryCost DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Cuisines
(
    CuisineID INT
    AUTO_INCREMENT PRIMARY KEY,
    CuisineName VARCHAR
    (50) NOT NULL
);

    CREATE TABLE Courses
    (
        CourseID INT
        AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR
        (100) NOT NULL,
    CuisineID INT,
    FOREIGN KEY
        (CuisineID) REFERENCES Cuisines
        (CuisineID)
);

        CREATE TABLE Starters
        (
            StarterID INT
            AUTO_INCREMENT PRIMARY KEY,
    StarterName VARCHAR
            (100) NOT NULL
);

            CREATE TABLE Desserts
            (
                DessertID INT
                AUTO_INCREMENT PRIMARY KEY,
    DessertName VARCHAR
                (100) NOT NULL
);

                CREATE TABLE Drinks
                (
                    DrinkID INT
                    AUTO_INCREMENT PRIMARY KEY,
    DrinkName VARCHAR
                    (100) NOT NULL
);

                    CREATE TABLE Sides
                    (
                        SideID INT
                        AUTO_INCREMENT PRIMARY KEY,
    SideName VARCHAR
                        (100) NOT NULL
);

                        CREATE TABLE OrderDetails
                        (
                            OrderDetailID INT
                            AUTO_INCREMENT PRIMARY KEY,
    OrderID VARCHAR
                            (20),
    CourseID INT,
    StarterID INT,
    DessertID INT,
    DrinkID INT,
    SideID INT,
    FOREIGN KEY
                            (OrderID) REFERENCES Orders
                            (OrderID),
    FOREIGN KEY
                            (CourseID) REFERENCES Courses
                            (CourseID),
    FOREIGN KEY
                            (StarterID) REFERENCES Starters
                            (StarterID),
    FOREIGN KEY
                            (DessertID) REFERENCES Desserts
                            (DessertID),
    FOREIGN KEY
                            (DrinkID) REFERENCES Drinks
                            (DrinkID),
    FOREIGN KEY
                            (SideID) REFERENCES Sides
                            (SideID)
);

