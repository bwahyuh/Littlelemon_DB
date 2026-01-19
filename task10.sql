DELIMITER //

CREATE PROCEDURE AddBooking2(
    IN p_BookingID INT,
    IN p_CustomerID INT,
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    -- Insertar un nuevo registro en la tabla Bookings
    INSERT INTO Bookings (BookingID, CustID, BookingDate, TableNumber)
    VALUES (p_BookingID, p_CustomerID, p_BookingDate, p_TableNumber);

    -- Confirmar que la reserva fue agregada
    SELECT CONCAT('Booking added: Table ', p_TableNumber, ' for Customer ID ', p_CustomerID, ' on ', p_BookingDate) AS `Booking Status`;
END //

DELIMITER ;
CALL AddBooking2(9, 3, '2022-12-30', 4);