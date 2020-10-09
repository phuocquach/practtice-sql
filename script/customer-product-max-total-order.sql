SELECT Customer, Product, Max(TotalOrder) as Total 
FROM (
    SELECT Customers.Name as Customer,
           Products.Name as Product,
           Count(Customers.Name) as TotalOrder
    FROM Products
        JOIN OrderDetails ON Products.Id = OrderDetail.ProductId
        JOIN Orders ON Orders.Id = OrderDetail.SaleOrderId
        JOIN Customers ON Customer.Id = Orders.CustomerId
    Group by Customers.Name
 ) as result
WHERE Product = 'Pegasus'
Group by Customer
Having TotalOrder >= Total
