DELIMITER //

CREATE PROCEDURE AddValidBooking_2(
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    DECLARE v_AlreadyBooked INT;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Verificar si la mesa ya está reservada para la fecha dada
    SELECT COUNT(*) INTO v_AlreadyBooked
    FROM Bookings
    WHERE BookingDate = p_BookingDate
      AND TableNumber = p_TableNumber;

    -- Si la mesa ya está reservada, hacemos rollback
    IF v_AlreadyBooked > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Booking declined: Table ', p_TableNumber, ' is already booked on ', p_BookingDate) AS `Booking Status`;
    ELSE
        -- Si la mesa está disponible, insertamos la reserva
        INSERT INTO Bookings (BookingDate, TableNumber)
        VALUES (p_BookingDate, p_TableNumber);

        -- Confirmar la transacción
        COMMIT;
        SELECT CONCAT('Booking confirmed: Table ', p_TableNumber, ' reserved on ', p_BookingDate) AS `Booking Status`;
    END IF;
END //

DELIMITER ;
CALL AddValidBooking_2('2022-12-17', 6);
