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
type FLOAT(5)
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
status ENUM('pending', 'processed', 'completed', 'delivered') DEFAULT 'pending',
CONSTRAINT fk3 FOREIGN KEY (quality_id) REFERENCES Quality(Qid),
CONSTRAINT fk4 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
CONSTRAINT fk5 FOREIGN KEY (seat_cover_id) REFERENCES Seat_Covers(seat_cover_id)
);

/*views to search in orders*/

CREATE VIEW search_by_most_recent AS
SELECT Customers.Name, Orders.order_id, Orders.status, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Orders LEFT JOIN Customers
ON Orders.customer_id = Customers.customer_id
WHERE Orders.Date IN ( SELECT MAX( Date ) FROM Orders) ORDER BY Orders.order_id ASC , Orders.Date DESC;

CREATE VIEW search_by_packing AS
SELECT *
FROM Orders
WHERE Packing_Type = '';

CREATE VIEW search_by_name AS
SELECT Customers.Name, Orders.order_id, Orders.status, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Orders LEFT JOIN Customers
ON Orders.customer_id = Customers.customer_id
WHERE Comments = '';

CREATE VIEW search_by_name AS
SELECT Customers.Name, Orders.order_id, Orders.status, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Orders LEFT JOIN Customers
ON Orders.customer_id = Customers.customer_id
WHERE Customers.Name = '';


CREATE VIEW search_by_pending AS
SELECT Customers.Name, Orders.order_id, Orders.status, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
WHERE Orders.status = 'pending';
  
CREATE VIEW search_by_processed AS
SELECT Customers.Name, Orders.order_id, Orders.status, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
WHERE Orders.status = 'processed';
  
CREATE VIEW search_by_completed AS
SELECT Customers.Name, Orders.order_id, Orders.status, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
WHERE Orders.status = 'completed';

  
CREATE VIEW search_by_delivered AS
SELECT Customers.Name, Orders.order_id, Orders.status, Orders.quantity, Orders.Label, Orders.Packing_Type, Orders.comments, Orders.Date
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
WHERE Orders.status = 'delivered';
  
  /* Views to search in customers*/
  
  CREATE VIEW  search_in_customers AS 
  SELECT *
  FROM Customers
  WHERE Name = '' OR customer_id = ''  OR Address='' OR Mobile_Number = '' OR Company_Name = '' OR GST_No = '' ;
  
  /* Insert query to place an order */
  
  INSERT INTO Customers(Name, Address, Mobile_Number, Company_Name, GST_No) VALUES (  '','','','','' );
  INSERT INTO Quality(type) VALUES ('');
  INSERT INTO Seat_Covers(Vehicle_Model) VALUES( '' );
  INSERT INTO Orders(customer_id, Label, Comments, status, Packing_Type, seat_cover_id, quality, quantity) VALUES ( '','','','','','','','',''  ); 
  
  /*Triggers*/
  
  
  delimiter #
  
  CREATE TRIGGER update_inv_completed
  AFTER UPDATE 
  ON Orders
  FOR EACH ROW
  BEGIN
  IF new.status = 'completed' THEN 
	IF new.seat_cover_id IN (SELECT seat_cover_id FROM Inventory) THEN
		UPDATE Inventory SET quantity = quantity + new.quantity WHERE seat_cover_id = new.seat_cover_id;
  ELSE 
		INSERT INTO Inventory(seat_cover_id, quantity, quality_id) VALUES (new.seat_cover_id, new.quantity, new.quality_id);
        END IF; 
  END IF;      
  end#
  
  delimiter ;
  
  
  delimiter #
  
  CREATE TRIGGER update_inv_delivered
  AFTER UPDATE 
  ON Orders
  FOR EACH ROW
  BEGIN
  IF new.status = 'delivered' THEN 
		UPDATE Inventory SET quantity = quantity - new.quantity WHERE seat_cover_id = new.seat_cover_id;
  END IF;      
  end#
  
  delimiter ;
  
  
  
  
  
  /*fillTable Case 5*/
CREATE VIEW inventory_details AS
SELECT Inventory.seat_cover_id, Seat_Covers.Vehicle_Model, Inventory.quantity, Inventory.quality_id, type 
FROM Seat_Covers JOIN Inventory
ON Seat_Covers.seat_cover_id = Inventory.seat_cover_id
JOIN Quality
ON Inventory.quality_id = Quality.Qid;
  
  /*fillTable Case 6*/
CREATE VIEW quality_table AS
SELECT * FROM Quality;
  
  /*fillTable Case 4*/
CREATE VIEW seat_cover_table AS
SELECT * FROM Seat_Covers;

/*fillTable Case 2*/
CREATE VIEW order_details AS
SELECT Orders.order_id, Customers.customer_id, Customers.Name, Seat_Covers.seat_cover_id, Orders.quality_id, Orders.quantity, Orders.Packing_Type, Orders.Label, Orders.Comments, Orders.Date, Orders.status, Seat_Covers.Vehicle_Model, Quality.type 
FROM Quality,Customers JOIN Orders
ON Customers.customer_id = Orders.customer_id 
JOIN Seat_Covers  
ON Orders.seat_cover_id = Seat_Covers.seat_cover_id
WHERE Orders.quality_id = Quality.Qid;
  
