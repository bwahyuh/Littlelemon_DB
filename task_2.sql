SELECT
    c.idCustomers,
    c.Name,
    o.OrderID,
    o.TotalCost,
    m.Name AS MenuName,
    mi.CourseName AS ItemName
FROM Customers c
INNER JOIN Orders o
    ON c.idCustomers = o.CustomerID
INNER JOIN Menu m
    ON o.MenuID = m.idMenu
INNER JOIN MenuItems mi
    ON m.MenuItemsID = mi.idmenuitems
WHERE o.TotalCost > 50
ORDER BY TotalCost Asc;
