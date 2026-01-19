DELIMITER //

CREATE PROCEDURE GetMaxOrderQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxOrderedQuantity
    FROM Orders;
END //

DELIMITER ;
CALL GetMaxOrderQuantity();
