CREATE DATABASE sales_management;
USE sales_management;

CREATE TABLE customers (
    customer_id BIGINT(20) PRIMARY KEY,
    company_name VARCHAR(50),
    contact_name VARCHAR(20),
    address VARCHAR(50),
    email VARCHAR(30),
    phone VARCHAR(15),
    fax VARCHAR(15)
);

CREATE TABLE employees (
    employee_id BIGINT(20) PRIMARY KEY,
    last_name VARCHAR(40),
    first_name VARCHAR(10),
    birthday DATETIME,
    start_date DATETIME,
    address VARCHAR(60),
    phone VARCHAR(15),
    base_salary DECIMAL(10,2),
    allowance DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id BIGINT(20) PRIMARY KEY,
    customer_id BIGINT(20),
    employee_id BIGINT(20),
    order_date DATETIME,
    delivery_date DATETIME,
    shipping_date DATETIME,
    shipping_address VARCHAR(80),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE suppliers (
    company_id BIGINT(20) PRIMARY KEY,
    company_name VARCHAR(50),
    trading_name VARCHAR(20),
    address VARCHAR(50),
    phone VARCHAR(15),
    fax VARCHAR(15),
    email VARCHAR(30)
);

CREATE TABLE product_types (
    product_type_id BIGINT(20) PRIMARY KEY,
    product_type_name VARCHAR(30)
);

CREATE TABLE products (
    product_id BIGINT(20) PRIMARY KEY,
    company_id BIGINT(20),
    product_type_id BIGINT(20),
    product_name VARCHAR(30),
    quantity INT(11),
    unit VARCHAR(10),
    price DECIMAL(10,2),
    FOREIGN KEY (company_id) REFERENCES suppliers(company_id),
    FOREIGN KEY (product_type_id) REFERENCES product_types(product_type_id)
);

CREATE TABLE order_details (
    order_id BIGINT(20),
    product_id BIGINT(20),
    selling_price DECIMAL(15,2),
    quantity DOUBLE,
    discount_amount DECIMAL(15,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Insert data into customers
INSERT INTO customers VALUES
(1, 'Company A', 'John Doe', '123 Street', 'john@companya.com', '123456789', '987654321'),
(2, 'Company B', 'Jane Smith', '456 Avenue', 'jane@companyb.com', '987654321', '123456789'),
(3, 'Company C', 'Alice Brown', '789 Boulevard', 'alice@companyc.com', '111222333', '444555666'),
(4, 'Company D', 'Bob White', '101 Road', 'bob@companyd.com', '777888999', '666555444'),
(5, 'Company E', 'Charlie Green', '202 Lane', 'charlie@companye.com', '999888777', '333222111');

-- Insert data into employees
INSERT INTO employees VALUES
(1, 'Smith', 'John', '1980-01-15', '2005-06-20', 'Address 1', '111111111', 50000.00, 5000.00),
(2, 'Johnson', 'Jane', '1985-03-22', '2010-09-15', 'Address 2', '222222222', 60000.00, 6000.00),
(3, 'Williams', 'Alice', '1990-07-10', '2015-12-01', 'Address 3', '333333333', 55000.00, 5500.00),
(4, 'Brown', 'Bob', '1992-05-18', '2018-04-25', 'Address 4', '444444444', 58000.00, 5800.00),
(5, 'Jones', 'Charlie', '1995-09-30', '2020-07-15', 'Address 5', '555555555', 62000.00, 6200.00);

-- Insert data into suppliers
INSERT INTO suppliers VALUES
(1, 'Supplier A', 'Trade A', 'Supplier Address 1', '111111111', '222222222', 'supplierA@email.com'),
(2, 'Supplier B', 'Trade B', 'Supplier Address 2', '333333333', '444444444', 'supplierB@email.com'),
(3, 'Supplier C', 'Trade C', 'Supplier Address 3', '555555555', '666666666', 'supplierC@email.com'),
(4, 'Supplier D', 'Trade D', 'Supplier Address 4', '777777777', '888888888', 'supplierD@email.com'),
(5, 'Supplier E', 'Trade E', 'Supplier Address 5', '999999999', '000000000', 'supplierE@email.com');

-- Insert data into product_types
INSERT INTO product_types VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Furniture'),
(4, 'Toys'),
(5, 'Books');

-- Insert data into products
INSERT INTO products VALUES
(1, 1, 1, 'Laptop', 10, 'pcs', 1000.00),
(2, 2, 2, 'T-Shirt', 50, 'pcs', 20.00),
(3, 3, 3, 'Chair', 30, 'pcs', 150.00),
(4, 4, 4, 'Doll', 40, 'pcs', 25.00),
(5, 5, 5, 'Book', 60, 'pcs', 15.00);

INSERT INTO products VALUES
(6, 1, 1, 'Laptop A', 10, 'pcs', 1000.00),
(7, 2, 2, 'T-Shirt A', 50, 'pcs', 20.00);

-- Insert data into orders
INSERT INTO orders VALUES
(1, 1, 1, '2024-01-01', '2024-01-05', '2024-01-04', 'Customer Address 1'),
(2, 2, 2, '2024-02-01', '2024-02-06', '2024-02-05', 'Customer Address 2'),
(3, 3, 3, '2024-03-01', '2024-03-07', '2024-03-06', 'Customer Address 3'),
(4, 4, 4, '2024-04-01', '2024-04-08', '2024-04-07', 'Customer Address 4'),
(5, 5, 5, '2024-05-01', '2024-05-09', '2024-05-08', 'Customer Address 5');

-- Insert data into order_details
INSERT INTO order_details VALUES
(1, 1, 1000.00, 2, 50.00),
(2, 2, 20.00, 5, 5.00),
(3, 3, 150.00, 3, 10.00),
(4, 4, 25.00, 4, 2.00),
(5, 5, 15.00, 6, 1.00);

INSERT INTO order_details VALUES
(3, 1, 1000.00, 2, 50.00),
(3, 2, 20.00, 5, 5.00),
(3, 4, 50.00, 3, 10.00);

--Bai 1
--Cho biết danh sách các đối tác cung cấp hàng cho công ty

SELECT * FROM suppliers

--Mã hàng, tên hàng và số lượng của các mặt hàng hiện có trong công ty

SELECT product_type_id, product_name, quantity FROM products 

--Họ tên, địa chỉ và năm bắt đầu làm việc của các nhân viên trong cty

SELECT last_name, first_name, address, YEAR(start_date) AS start_year
FROM employees

--Địa chỉ, điện thoại của nhà cung cấp có tên giao dịch VINAMILK

SELECT address, phone
FROM suppliers
WHERE trading_name = 'VINAMILK';

--Mã và tên của các mặt hàng có giá trị lớn hơn 100000 và số lượng hiện có ít hơn 50

SELECT product_id, product_name
FROM products
WHERE price > 100000 AND quantity < 50

--Cho biết mỗi mặt hàng trong công ty do ai cung cấp

SELECT p.product_id, p.product_type_id, p.product_name, s.company_name
FROM products AS p INNER JOIN suppliers AS s

--Công ty Việt Tiến đã cung cấp những mặt hàng nào
SELECT p.product_id, p.product_type_id, p.product_name
FROM products AS p INNER JOIN suppliers AS s
WHERE s.company_name = 'Việt Tiến'

--Loại hàng thực phẩm do những công ty nào cung cấp, địa chỉ của công ty đó

SELECT pt.product_type_id, pt.product_type_name, s.company_name, s.address
FROM product_types AS pt INNER JOIN suppliers AS s

SELECT * FROM customers;
SELECT * FROM orders ;
SELECT * FROM order_details;
SELECT * FROM employees;
SELECT * FROM suppliers;
SELECT * FROM products;
SELECT * FROM product_types;


--Những khách hàng nào (tên giao dịch) đã đặt mua mặt hàng sữa hộp của công ty
SELECT c.contact_name
FROM customers AS c INNER JOIN orders AS o ON c.customer_id = o.customer_id
	  					  INNER JOIN order_details AS od ON o.order_id = od.order_id
	  					  INNER JOIN products AS p ON od.product_id = p.product_id
WHERE p.product_name = 'sữa hộp'

--Đơn đặt hàng số 1 do ai đặt và do nhân viên nào lập, thời gian và địa điểm giao hàng là ở đâu
SELECT e.employee_id, e.last_name, e.first_name, o.order_date, o.shipping_address
FROM orders AS o INNER JOIN employees AS e ON o.employee_id = e.employee_id
LIMIT 1

--Hãy cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu (lương = lương cơ bản + phụ cấp)
SELECT employee_id, last_name, first_name, (base_salary + allowance) AS total_salary
FROM employees 

--Trong đơn đặt hàng số 3 đặt mua những mạt hàng nào và số tiền mà khách hàng phải trả cho mỗi mặt hàng là bao nhiêu(số tiền phải trả = số lượng x giá bán – số lượng x giá bán x mức giảm giá / 100)

SELECT order_id INTO @id_order_3 FROM orders LIMIT 1 OFFSET 2;
SELECT p.product_name, o.order_id, (od.quantity * od.selling_price - od.quantity * od.selling_price * od.discount_amount / 100) AS total_price
FROM orders AS o 
INNER JOIN order_details AS od ON o.order_id = od.order_id
INNER JOIN products AS p ON od.product_id = p.product_id
WHERE o.order_id = @id_order_3;

--Hãy cho biết có những khách hàng nào lại chính là đối tác cung cấp hàng cho công ty (tức là có cùng tên giao dịch)
SELECT c.customer_id, c.company_name, c.contact_name
FROM customers AS c, suppliers AS s
WHERE c.company_name = s.company_name

--Trong công ty có những nhân viên nào có cùng ngày sinh
INSERT INTO employees VALUES
(6, 'Hoa', 'Nguyen', '1980-01-15', '2005-06-20', 'Address 1', '111111111', 50000.00, 5000.00),
(7, 'Hai', 'Do', '1985-03-22', '2010-09-15', 'Address 2', '222222222', 60000.00, 6000.00)
(8, 'Anh', 'Do', '1985-05-22', '2010-09-15', 'Address 2', '222222222', 60000.00, 6000.00);

SELECT e1.employee_id, e1.last_name, e1.first_name, e2.employee_id, e2.last_name, e2.first_name
FROM employees AS e1, employees AS e2 
WHERE DAY(e1.birthday) = DAY(e2.birthday) AND e1.employee_id < e2.employee_id

--Những đơn hàng nào yêu cầu giao hàng ngay tại công ty đặt hàng và những đơn đó là của công ty nào

SELECT o.order_id, c.company_name, o.shipping_address
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.shipping_address = c.address;

--	Cho biết tên công ty, tên giao dịch, địa chỉ và điện thoại của các khách hàng và nhà cung cấp hàng cho công ty

SELECT company_name, contact_name, address, phone
FROM customers
UNION
SELECT company_name, trading_name AS contact_name, address, phone
FROM suppliers;

--Những mặt hàng nào chưa từng được khách hàng đặt mua
SELECT *
FROM products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM order_details)

--Những nhân viên nào của công ty chưa từng lập hóa đơn đặt hàng nào

SELECT *
FROM employees
WHERE employee_id NOT IN (SELECT DISTINCT employee_id FROM orders)

--Những nhân viên nào của công ty có lương cơ bản cao nhất
SELECT *
FROM employees
WHERE base_salary = ( SELECT MAX(base_salary) FROM employees)

--Tổng số tiền mà khách hàng phải trả cho mỗi đơn đặt hàng là bao nhiêu
SELECT o.order_id, SUM((od.quantity * od.selling_price - od.quantity * od.selling_price * od.discount_amount / 100)) AS total_price
FROM customers AS c INNER JOIN  orders AS o ON c.customer_id = o.customer_id
						  INNER JOIN order_details AS od ON o.order_id = od.order_id
					     INNER JOIN products AS p ON od.product_id = p.product_id
GROUP BY o.order_id

--Trong năm 2025 những mặt hàng nào đặt mua đúng mộ lần
WITH UniqueProducts AS (
    SELECT product_id
    FROM order_details
    GROUP BY product_id
    HAVING COUNT(product_id) = 1
)

SELECT p.product_id, p.product_name
FROM products AS p
JOIN order_details AS od ON p.product_id = od.product_id
JOIN orders AS o ON od.order_id = o.order_id
WHERE YEAR(o.order_date) = 2025 
AND p.product_id IN (SELECT product_id FROM UniqueProducts);

--Mỗi khách hàng phải bỏ ra bao nhiêu tiền để đặt mua hàng của công ty
SELECT o.customer_id, SUM((od.quantity * od.selling_price - od.quantity * od.selling_price * od.discount_amount / 100)) AS total_price
FROM customers AS c INNER JOIN  orders AS o ON c.customer_id = o.customer_id
						  INNER JOIN order_details AS od ON o.order_id = od.order_id
					     INNER JOIN products AS p ON od.product_id = p.product_id
GROUP BY o.customer_id

--Mỗi nhân viên của công ty đã lập bao nhiêu đơn đặt hàng (nếu chưa hề lập hóa đơn nào thì cho kết quả là 0)
SELECT e.employee_id, e.last_name, e.first_name, 
       COUNT(o.order_id) AS total_orders
FROM employees AS e
LEFT JOIN orders AS o ON e.employee_id = o.employee_id
GROUP BY e.employee_id, e.last_name, e.first_name;

--Tổng số tiền hàng mà công ty thu được trong mỗi tháng của năm 2025 (thời gian được tính theo ngày đặt hàng)
SELECT MONTH(o.order_date) AS order_month, SUM((od.quantity * od.selling_price - od.quantity * od.selling_price * od.discount_amount / 100)) AS total_price
FROM orders AS o JOIN order_details AS od ON o.order_id = od.order_id
WHERE YEAR(o.order_date) = 2024
GROUP BY order_month

--	Tổng số tiền lời mà công ty thu được từ mỗi mặt hàng trong năm 2025
SELECT (SUM(od.quantity * od.selling_price - od.quantity * od.selling_price * od.discount_amount / 100) - SUM(p.price)) AS lai
FROM products AS p JOIN order_details AS od ON p.product_id = od.product_id

--Số lượng hàng còn lại của mỗi mặt hàng mà công ty đã có (tổng số lượng hàng hiện có và đã bán)
SELECT 
    p.product_id, 
    p.product_name, 
    p.quantity_in_stock AS initial_stock, 
    COALESCE(SUM(od.quantity), 0) AS total_sold,
    (p.quantity_in_stock - COALESCE(SUM(od.quantity), 0)) AS remaining_stock
FROM products AS p
LEFT JOIN order_details AS od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name, p.quantity_in_stock
ORDER BY remaining_stock DESC;