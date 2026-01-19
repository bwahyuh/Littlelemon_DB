DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN p_BookingID INT,
    IN p_BookingDate DATE
)
BEGIN
    -- Actualizar la fecha de la reserva según el BookingID
    UPDATE Bookings
    SET BookingDate = p_BookingDate
    WHERE BookingID = p_BookingID;

    -- Confirmar la actualización
    SELECT CONCAT('Booking ID ', p_BookingID, ' updated to new date: ', p_BookingDate) AS `Update Status`;
END //

DELIMITER ;
CALL UpdateBooking(9, '2022-12-17');
