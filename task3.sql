SELECT Name AS MenuName
FROM Menu
WHERE idMenu = ANY (
    SELECT MenuID
    FROM Orders
    WHERE Quantity > 2
);
