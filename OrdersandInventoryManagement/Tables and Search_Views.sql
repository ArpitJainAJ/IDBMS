CREATE TABLE Customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT ,
Name VARCHAR(50),
Address VARCHAR(100),
Mobile_Number VARCHAR(55),
Company_Name VARCHAR(50),
GST_No VARCHAR(15)
);

CREATE TABLE Seat_Covers(
seat_cover_id INT PRIMARY KEY AUTO_INCREMENT,
Vehicle_Model VARCHAR(25) NOT NULL
);

CREATE TABLE Quality(
Qid INT PRIMARY KEY AUTO_INCREMENT,
type VARCHAR(15)
);


CREATE TABLE Status(
status_id INT PRIMARY KEY AUTO_INCREMENT,
status ENUM('pending', 'processed', 'completed', 'delivered')
);

CREATE TABLE Inventory(
seat_cover_id INT,
quantity INT,
quality_id INT,
CONSTRAINT fk1 FOREIGN KEY (seat_cover_id) REFERENCES Seat_Covers(seat_cover_id),
CONSTRAINT fk2 FOREIGN KEY (quality_id) REFERENCES Quality(Qid)
);

CREATE TABLE Orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
seat_cover_id INT,
quality_id INT,
quantity INT,
Packing_Type VARCHAR(50),
Label VARCHAR(50),
Comments VARCHAR(100),
Date DATETIME DEFAULT CURRENT_TIMESTAMP,
status_id INT,
CONSTRAINT fk3 FOREIGN KEY (quality_id) REFERENCES Quality(Qid),
CONSTRAINT fk4 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
CONSTRAINT fk5 FOREIGN KEY (seat_cover_id) REFERENCES Seat_Covers(seat_cover_id),
CONSTRAINT fk6 FOREIGN KEY (status_id) REFERENCES Status(status_id)
);



CREATE VIEW search_by_most_recent AS
SELECT Customers.Name, Orders.order_id, Orders.status_id, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Orders LEFT JOIN Customers
ON Orders.customer_id = Customers.customer_id
WHERE Orders.Date IN ( SELECT MAX( Date ) FROM Orders) ORDER BY Orders.order_id ASC , Orders.Date DESC;

CREATE VIEW search_by_packing AS
SELECT *
FROM Orders
WHERE Packing_Type = '';

CREATE VIEW search_by_name AS
SELECT Customers.Name, Orders.order_id, Orders.status_id, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Orders LEFT JOIN Customers
ON Orders.customer_id = Customers.customer_id
WHERE Comments = '';

CREATE VIEW search_by_name AS
SELECT Customers.Name, Orders.order_id, Orders.status_id, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Orders LEFT JOIN Customers
ON Orders.customer_id = Customers.customer_id
WHERE Customers.Name = '';


CREATE VIEW search_by_pending AS
SELECT Customers.Name, Orders.order_id, Status.status, Orders.status_id, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Customers
JOIN Orders
  ON Customers.customer_id = Orders.customer_id
JOIN Status
  ON Orders.status_id = Status.status_id
  WHERE Status.status = 'pending';
  
CREATE VIEW search_by_processed AS
SELECT Customers.Name, Orders.order_id, Status.status, Orders.status_id, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Customers
JOIN Orders
  ON Customers.customer_id = Orders.customer_id
JOIN Status
  ON Orders.status_id = Status.status_id
  WHERE Status.status = 'processed';
  
CREATE VIEW search_by_completed AS
SELECT Customers.Name, Orders.order_id, Status.status, Orders.status_id, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Customers
JOIN Orders
  ON Customers.customer_id = Orders.customer_id
JOIN Status
  ON Orders.status_id = Status.status_id
  WHERE Status.status = 'completed';
  
CREATE VIEW search_by_delivered AS
SELECT Customers.Name, Orders.order_id, Status.status, Orders.status_id, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Customers
JOIN Orders
  ON Customers.customer_id = Orders.customer_id
JOIN Status
  ON Orders.status_id = Status.status_id
  WHERE Status.status = 'delivered';
