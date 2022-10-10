/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, products.CategoryID
FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
WHERE categories.CategoryID = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.rating
FROM reviews
INNER JOIN products ON products.ProductID = reviews.ProductID
WHERE rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT SUM(Quantity) AS TotalSales, sales.EmployeeID, FirstName, MiddleInitial, LastName
FROM sales
INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID
GROUP BY sales.EmployeeID
ORDER BY TotalSales DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT categories.Name, departments.Name
FROM categories
INNER JOIN departments ON departments.DepartmentID = categories.DepartmentID
WHERE (categories.Name = 'Appliances' || categories.Name = 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name, SUM(sales.Quantity) AS TotalQuantity, SUM(sales.Quantity * sales.PricePerUnit) AS TotalRevenue, sales.SalesID
 FROM products
 INNER JOIN sales ON products.ProductID = sales.ProductID
 WHERE products.Name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name = 'Visio TV'
GROUP BY products.Name
ORDER BY reviews.Rating;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sales.Quantity
FROM employees
LEFT JOIN sales ON employees.EmployeeID = sales.EmployeeID
LEFT JOIN products ON sales.ProductID = products.ProductID
GROUP BY products.Name
ORDER BY employees.LastName, employees.FirstName, products.Name;