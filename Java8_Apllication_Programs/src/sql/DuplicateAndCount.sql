OrderID 	Name 	Email
10248
10249
10250
10251
10251
10252
10276
10276
10443

SELECT OrderID, COUNT(OrderID)
FROM Orders
GROUP BY OrderID
HAVING COUNT(OrderID) > 1

Result
======
OrderID	COUNT(OrderID)
10251	2
10276	2


SELECT
    name, email, COUNT(*)
FROM
    users
GROUP BY
    name, email
HAVING 
    COUNT(*) > 1
