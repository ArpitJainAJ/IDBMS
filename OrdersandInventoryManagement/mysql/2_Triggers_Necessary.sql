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
