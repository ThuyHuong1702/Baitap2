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


-- 30
SELECT 
    o.order_id AS `Mã đơn hàng`,
    GROUP_CONCAT(p.product_name SEPARATOR ', ') AS `Danh sách mặt hàng`,
    SUM(od.quantity * od.selling_price - od.discount_amount*od.quantity) AS `Tổng số tiền`
FROM 
    orders o
JOIN 
    order_details od ON o.order_id = od.order_id
JOIN 
    products p ON od.product_id = p.product_id
GROUP BY 
    o.order_id
ORDER BY 
    o.order_id;

-- 31
SELECT 
    pt.product_type_id AS `Mã loại hàng`,
    pt.product_type_name AS `Tên loại hàng`,
    GROUP_CONCAT(p.product_name SEPARATOR ', ') AS `Danh sách mặt hàng`,
    SUM(p.quantity) AS `Tổng số lượng của loại hàng`,
    (SELECT SUM(quantity) FROM products) AS `Tổng số lượng của tất cả các mặt hàng`
FROM 
    product_types pt
JOIN 
    products p ON pt.product_type_id = p.product_type_id
GROUP BY 
    pt.product_type_id, pt.product_type_name
ORDER BY 
    pt.product_type_id;
-- 32

SELECT 
    p.product_id AS `Mã hàng`,
    p.product_name AS `Tên hàng`,
    SUM(CASE WHEN MONTH(o.order_date) = 1 THEN od.quantity ELSE 0 END) AS `Tháng 1`,
    SUM(CASE WHEN MONTH(o.order_date) = 2 THEN od.quantity ELSE 0 END) AS `Tháng 2`,
    SUM(CASE WHEN MONTH(o.order_date) = 3 THEN od.quantity ELSE 0 END) AS `Tháng 3`,
    SUM(CASE WHEN MONTH(o.order_date) = 4 THEN od.quantity ELSE 0 END) AS `Tháng 4`,
    SUM(CASE WHEN MONTH(o.order_date) = 5 THEN od.quantity ELSE 0 END) AS `Tháng 5`,
    SUM(CASE WHEN MONTH(o.order_date) = 6 THEN od.quantity ELSE 0 END) AS `Tháng 6`,
    SUM(CASE WHEN MONTH(o.order_date) = 7 THEN od.quantity ELSE 0 END) AS `Tháng 7`,
    SUM(CASE WHEN MONTH(o.order_date) = 8 THEN od.quantity ELSE 0 END) AS `Tháng 8`,
    SUM(CASE WHEN MONTH(o.order_date) = 9 THEN od.quantity ELSE 0 END) AS `Tháng 9`,
    SUM(CASE WHEN MONTH(o.order_date) = 10 THEN od.quantity ELSE 0 END) AS `Tháng 10`,
    SUM(CASE WHEN MONTH(o.order_date) = 11 THEN od.quantity ELSE 0 END) AS `Tháng 11`,
    SUM(CASE WHEN MONTH(o.order_date) = 12 THEN od.quantity ELSE 0 END) AS `Tháng 12`,
    SUM(od.quantity) AS `Tổng cả năm`
FROM 
    order_details od
JOIN 
    orders o ON od.order_id = o.order_id
JOIN 
    products p ON od.product_id = p.product_id
WHERE 
    YEAR(o.order_date) = 2025
GROUP BY 
    p.product_id, p.product_name
ORDER BY 
    p.product_id;


-- proc
-- 1. Tạo thủ tục lưu trữ để thông qua thủ tục này có thể bổ sung thêm một bản ghi mới cho bảng `products` (thủ tục phải thực hiện kiểm tra tính hợp lệ của dữ liệu cần bổ úng: không trùng khoá chính v đa bảo toàn vẹn tham chiếu)
DELIMITER //
CREATE PROCEDURE add_product(
							IN `p_product_id` BIGINT,
							IN `p_company_id` BIGINT,
							IN `p_product_type_id` BIGINT,
							IN `p_product_name` VARCHAR(30),
							IN `p_quantity` INT,
							IN `p_unit` VARCHAR(10),
							IN `p_price` NUMERIC(10, 2)
						)
BEGIN
	IF EXISTS ( SELECT 1 FROM products AS p WHERE p.product_id = p_product_id) THEN
		SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Lỗi: product_id đã tồn tại!';
   END IF;
   
   IF NOT EXISTS ( SELECT 1 FROM suppliers AS s WHERE s.company_id = p_company_id ) THEN 
		SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Lỗi: company_id không tồn tại tron bảng suppliers!';
   END IF;
   
   IF NOT EXISTS ( SELECT 1 FROM product_types AS pt WHERE pt.product_type_id = p_product_type_id ) THEN
   	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Lỗi: product_type_id không tồn tại tron bảng product_types!';
   END IF;
   
	INSERT INTO products(product_id, company_id, product_type_id, product_name, quantity, unit, price)
	VALUES (p_product_id, p_company_id, p_product_type_id, p_product_name, p_quantity, p_unit, p_price);
END //
DELIMITER ;

CALL add_product(24, 11, 1, 'Sửa hộp XYZ', 10, 'Hộp', 4000);

-- 2. Tạo thủ tục lưu trữ có chức năng thông kế tổng số lượng hàng bán được của một mặt hàng có mã bất kỳ (mã hàng cần thống kê là tham số)
DELIMITER //
CREATE PROCEDURE report_product(
								IN `r_product_id` BIGINT
							)
BEGIN 
	SELECT product_id, SUM(quantity)
	FROM order_details 
	WHERE product_id = r_product_id
	GROUP BY product_id;
END //
DELIMITER;

DROP PROCEDURE IF EXISTS report_product;

CALL report_product(3)

-- 3. Viết hàm trả về một bảng trong đó cho biết tôgnr số lượng hàng bán của mỗi mặt hàng. Sử dụng ha này thống kê xem tổng số lượng hàng (hiện có và đang bán) của mỗi mặt hàng là bao nhiêu

DELIMITER //
CREATE PROCEDURE report_product_sale()
BEGIN
	SELECT p.product_id, p.product_name, COALESCE(SUM(od.quantity), 0) AS total_sold, (p.quantity - COALESCE(SUM(od.quantity), 0)) AS remaining_product
	FROM products AS p LEFT JOIN order_details AS od ON p.product_id = od.product_id
	GROUP BY p.product_id, p.product_name;
END //
DELIMITER;

CALL report_product_sale();


-- trigger 1. Vết trigger cho bảng `order_details` theo yêu cầu sau:
-- - Khi một bản ghi mới được bổ sung vào bảng này thì giảm số lượng hàng hiện tại có nếu số lượng hàng hiện có lớn hơn hoặc bằng số lượng hàng được bán ra. Ngược lại thì huỷ bỏ thao tác bổ sung.
-- - Khi cập nhật số lượng hàng được bán, kiểm tra số lượng hàng được cập nhật lại có phù hợp hay không (số lượng hàng bán ra không được vượt qu số lượng hàng hiện có và không được nhỏ hơn 1). Nếu dữ liệu hợp lệ thì giảm (hoặc tăng) số lượng hiện có trong công ty, ngược lại thì huỷ bỏ thao tác cập nhật.

DELIMITER //
CREATE TRIGGER insert_order_detail
BEFORE INSERT ON order_details
FOR EACH ROW
BEGIN
	DECLARE available_quantity INT;
	SELECT quantity INTO available_quantity
	FROM products
	WHERE product_id = NEW.product_id;
	
	IF NEW.quantity > available_quantity THEN
		SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Lỗi: số lượng vượt quá số lượng sản phẩm hiện có!';
   ELSE
   	UPDATE products
   	SET quantity = quantity - NEW.quantity
   	WHERE product_id = NEW.product_id;
   END IF;
END //
DELIMITER;

INSERT INTO order_details (order_id, product_id, selling_price, quantity, discount_amount)
VALUES (9, 2, 1000, 2, 0);

-- - Khi cập nhật số lượng hàng được bán, kiểm tra số lượng hàng được cập nhật lại có phù hợp hay không (số lượng hàng bán ra không được vượt qu số lượng hàng hiện có và không được nhỏ hơn 1). Nếu dữ liệu hợp lệ thì giảm (hoặc tăng) số lượng hiện có trong công ty, ngược lại thì huỷ bỏ thao tác cập nhật.

DELIMITER //
CREATE TRIGGER check_quantity_sales 
BEFORE UPDATE ON order_details
FOR EACH ROW
BEGIN
	DECLARE available_quantity BIGINT;
	DECLARE deference_quantity BIGINT;
	
	SELECT quantity INTO available_quantity
	FROM products
	WHERE product_id = OLD.product_id;
	
	IF NEW.quantity > available_quantity + OLD.quantity THEN
		SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Lỗi: số lượng vượt quá số lượng sản phẩm hiện có!';
   ELSEIF NEW.quantity < 1 THEN
   	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Lỗi: số lượng sản phẩm phải lớn hơn 1!';
   ELSE
   	SET deference_quantity = NEW.quantity - OLD.quantity;
   	UPDATE products
   	SET quantity = quantity - deference_quantity
   	WHERE product_id = OLD.product_id;
   END IF;
END //
DELIMITER;

DROP TRIGGER IF EXISTS check_quantity_sales;

UPDATE order_details 
SET quantity = 3
WHERE order_id = 1 AND product_id = 1;

UPDATE order_details 
SET quantity = 20
WHERE order_id = 1 AND product_id = 1;

UPDATE order_details 
SET quantity = 0
WHERE order_id = 1 AND product_id = 1;

-- Viết trigger cho bảng `order_details` sao cho chỉ chấp nhận giá hàng bán ra phải nhỏ hơn hoặc bằng giá gốc (giá của mặt hàng trong bảng `products`)

DELIMITER //
CREATE TRIGGER check_price_sales_insert
BEFORE INSERT ON order_details
FOR EACH ROW
BEGIN
	DECLARE price_origin DECIMAL(10,2);
	
	SELECT price INTO price_origin
	FROM products
	WHERE product_id = NEW.product_id;
	
	IF NEW.selling_price > price_origin THEN
		SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Lỗi: giá hàng bán ra phải nhỏ hơn hoặc bằng giá gốc!';
   END IF;
END //
DELIMITER

DROP TRIGGER IF EXISTS check_price_sales;


INSERT INTO order_details(order_id, product_id, selling_price, quantity, discount_amount)
VALUES (8, 3, 66600000.0, 2, 0);



DELIMITER //
CREATE TRIGGER check_price_sales_update
BEFORE UPDATE ON order_details
FOR EACH ROW
BEGIN
    DECLARE price_origin DECIMAL(10,2);

    SELECT price INTO price_origin
    FROM products
    WHERE product_id = NEW.product_id;

    IF NEW.selling_price > price_origin THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Giá hàng bán ra phải nhỏ hơn hoặc bằng giá gốc!';
    END IF;
END //

DELIMITER ;

UPDATE order_details 
SET selling_price = 50000.0
WHERE order_id = 1 AND product_id = 1;


-- UPDATE 
-- 1. Cập nhật lại giá thị trường NGAYCHUYENHANG của những bản ghi có NGAYCHUYENHANG chưa xác định (NULL) trong bảng DONDATHANG bằng với giá trị của trường NGAYDATHANG
UPDATE orders 
SET delivery_date = order_date
WHERE delivery_date IS NULL;

-- 3. Cập nhật giá trị của trường NOIGIAOHANG trong bảng DONDATHANG bằng địa chỉ của khách hàng đối với những đơn đặt hàng chưa xác định được nơi giao hàng (giá trị trường NOIGIAOHANG bằng NULL).
UPDATE orders 
JOIN customers ON orders.customer_id = customers.customer_id
SET orders.shipping_address = customers.address
WHERE orders.shipping_address IS NULL;

-- 4. Cập nhật lại dữ liệu trong bảng KHACHHANG sao cho nếu tên công ty và tên giao dịch của khách hàng trùng với tên công ty và tên giao dịch của một nhà cung cấp nào đó thì địa chỉ, điện thoại, fax và e-mail phải giống nhau.
UPDATE customers c
JOIN suppliers s ON c.company_name = s.company_name 
                AND c.trading_name = s.trading_name
SET c.address = s.address,
    c.phone = s.phone,
    c.fax = s.fax,
    c.email = s.email;
-- 5. Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 100 trong năm 2003.
UPDATE employees e
SET e.base_salary = e.base_salary * 1.5
WHERE e.employee_id IN (
    SELECT od.order_id
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    WHERE YEAR(o.order_date) = 2003
    GROUP BY o.employee_id
    HAVING SUM(od.quantity) > 100
);

-- 6. Tăng phụ cấp lên bằng 50% lương cho những nhân viên bán được hàng nhiều nhất.
UPDATE employees e
SET e.allowance = e.base_salary * 0.5
WHERE e.employee_id IN (
    SELECT s.employee_id
    FROM (
        SELECT o.employee_id, SUM(od.quantity) AS total_quantity
        FROM orders o JOIN order_details od ON o.order_id = od.order_id
        GROUP BY o.employee_id
        HAVING SUM(od.quantity) = (
            SELECT MAX(t.total_quantity)
            FROM (
                SELECT SUM(od.quantity) AS total_quantity
                FROM orders o
                JOIN order_details od ON o.order_id = od.order_id
                GROUP BY o.employee_id
            ) AS t
        )
    ) AS s
);

-- 7. Giảm 25% lương của những nhân viên trong năm 2003 không lập được bất kỳ đơn đặt hàng nào.
UPDATE employees e
SET e.base_salary = e.base_salary * 0.75
WHERE e.employee_id NOT IN (
    SELECT DISTINCT o.employee_id
    FROM orders o
    WHERE YEAR(o.order_date) = 2003
);

-- 8. Giả sử trong bảng DONDATHANG có thêm trường SOTIEN cho biết số tiền mà khách hàng phải trả trong mỗi đơn đặt hàng. Hãy tính giá trị cho trường này.

UPDATE orders o
SET SOTIEN = (
    SELECT SUM(od.selling_price * od.quantity - od.discount_amount * od.quantity)
    FROM order_details od
    WHERE od.order_id = o.order_id
);

-- DELETE

-- 1. Xoá khỏi bảng NHANVIEN những nhân viên đã làm việc trong công ty quá 40 năm.
DELETE FROM employees
WHERE TIMESTAMPDIFF(YEAR, start_date, CURDATE()) > 40;

-- 2. Xoá những đơn đặt hàng trước năm 2000 ra khỏi cơ sở dữ liệu.

DELETE FROM orders
WHERE YEAR(order_date) < 2000;

-- 3. Xoá khỏi bảng LOAIHANG những loại hàng hiện không có mặt hàng.

DELETE FROM product_types
WHERE product_type_id NOT IN (SELECT DISTINCT product_type_id FROM products);

-- 4 Xoá khỏi bảng KHACHHANG những khách hàng hiện không có bất kỳ đơn đặt hàng nào cho công ty.

DELETE FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

SELECT * FROM orders

-- 5. Xoá khỏi bảng MATHANG những mặt hàng có số lượng bằng 0 và không được đặt mua trong bất kỳ đơn đặt hàng nào.

DELETE FROM products
WHERE quantity = 0
AND product_id NOT IN (SELECT DISTINCT product_id FROM order_details);
