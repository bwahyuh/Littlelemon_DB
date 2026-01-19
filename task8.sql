DELIMITER //

CREATE PROCEDURE CheckBooking(
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    DECLARE v_Status VARCHAR(50);

    -- Verificar si ya existe una reserva para esa fecha y mesa
    IF EXISTS (
        SELECT 1 
        FROM Bookings
        WHERE BookingDate = p_BookingDate
          AND TableNumber = p_TableNumber
    ) THEN
        SET v_Status = CONCAT('Table ', p_TableNumber, ' is already booked');
    ELSE
        SET v_Status = CONCAT('Table ', p_TableNumber, ' is available');
    END IF;

    -- Devolver el resultado en formato tabla
    SELECT v_Status AS `Booking Status`;
END //

DELIMITER ;
CALL CheckBooking('2022-11-12', 3);