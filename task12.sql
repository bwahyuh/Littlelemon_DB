DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN p_BookingID INT
)
BEGIN
    -- Eliminar la reserva según el BookingID
    DELETE FROM Bookings
    WHERE BookingID = p_BookingID;

    -- Confirmar la cancelación
    SELECT CONCAT('Booking ID ', p_BookingID, ' has been cancelled') AS `Cancellation Status`;
END //

DELIMITER ;
CALL CancelBooking(9);