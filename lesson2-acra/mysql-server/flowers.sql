-- Database: flowers_shop
CREATE DATABASE IF NOT EXISTS `flowers_shop`;
USE `flowers_shop`;

-- Table structure for table `customers`
CREATE TABLE `customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARBINARY(200),
  `last_name` VARBINARY(200),
  `email` VARBINARY(200),
  `phone` VARBINARY(200),
  `address` VARBINARY(400),
  PRIMARY KEY (`customer_id`)
);


INSERT INTO `customers` (`first_name`, `last_name`, `email`, `phone`, `address`) VALUES
(BINARY 'John', BINARY 'Doe', BINARY 'johndoe@example.com', BINARY '123-456-7890', BINARY '123 Elm St'),
(BINARY 'Jane', BINARY 'Smith', BINARY 'janesmith@example.com', BINARY '123-456-7891', BINARY '456 Oak St'),
(BINARY 'Alice', BINARY 'Johnson', BINARY 'alicej@example.com', BINARY '123-456-7892', BINARY '789 Maple St'),
(BINARY 'Bob', BINARY 'Brown', BINARY 'bobb@example.com', BINARY '123-456-7893', BINARY '321 Pine St'),
(BINARY 'Charlie', BINARY 'Davis', BINARY 'charlied@example.com', BINARY '123-456-7894', BINARY '654 Cedar St'),
(BINARY 'Eve', BINARY 'Miller', BINARY 'evem@example.com', BINARY '123-456-7895', BINARY '987 Birch St'),
(BINARY 'Frank', BINARY 'Wilson', BINARY 'frankw@example.com', BINARY '123-456-7896', BINARY '135 Spruce St'),
(BINARY 'Grace', BINARY 'Taylor', BINARY 'gracet@example.com', BINARY '123-456-7897', BINARY '246 Poplar St'),
(BINARY 'Hank', BINARY 'Anderson', BINARY 'hanka@example.com', BINARY '123-456-7898', BINARY '357 Aspen St'),
(BINARY 'Ivy', BINARY 'Thomas', BINARY 'ivyt@example.com', BINARY '123-456-7899', BINARY '468 Redwood St');


INSERT INTO `customers` (`first_name`, `last_name`, `email`, `phone`, `address`) VALUES
(BINARY 'John', BINARY 'Doe', BINARY 'johndoe@example.com', BINARY '123-456-7890', BINARY '123 Elm St');


INSERT INTO `customers` (`first_name`, `last_name`, `email`, `phone`, `address`) VALUES
(CAST('John' AS VARBINARY(255)), CAST('Doe' AS VARBINARY(255)), CAST('johndoe@example.com' AS VARBINARY(255))), CSAT('123-456-7890' AS VARBINARY(255)), CAST('123 Elm St' AS VARBINARY(255)));


CAST('example string' AS VARBINARY(255))
-- Data for table `customers`
INSERT INTO `customers` (`first_name`, `last_name`, `email`, `phone`, `address`) VALUES
('John', 'Doe', 'johndoe@example.com', '123-456-7890', '123 Elm St'),
('Jane', 'Smith', 'janesmith@example.com', '123-456-7891', '456 Oak St'),
('Alice', 'Johnson', 'alicej@example.com', '123-456-7892', '789 Maple St'),
('Bob', 'Brown', 'bobb@example.com', '123-456-7893', '321 Pine St'),
('Charlie', 'Davis', 'charlied@example.com', '123-456-7894', '654 Cedar St'),
('Eve', 'Miller', 'evem@example.com', '123-456-7895', '987 Birch St'),
('Frank', 'Wilson', 'frankw@example.com', '123-456-7896', '135 Spruce St'),
('Grace', 'Taylor', 'gracet@example.com', '123-456-7897', '246 Poplar St'),
('Hank', 'Anderson', 'hanka@example.com', '123-456-7898', '357 Aspen St'),
('Ivy', 'Thomas', 'ivyt@example.com', '123-456-7899', '468 Redwood St');

-- Table structure for table `flower_categories`
CREATE TABLE `flower_categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(100),
  PRIMARY KEY (`category_id`)
);

-- Data for table `flower_categories`
INSERT INTO `flower_categories` (`category_name`) VALUES
('Roses'),
('Tulips'),
('Lilies'),
('Daisies'),
('Orchids'),
('Sunflowers'),
('Carnations'),
('Peonies'),
('Daffodils'),
('Chrysanthemums');

-- Table structure for table `flowers`
CREATE TABLE `flowers` (
  `flower_id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT,
  `flower_name` VARCHAR(100),
  `price` DECIMAL(10, 2),
  `stock_quantity` INT,
  PRIMARY KEY (`flower_id`),
  FOREIGN KEY (`category_id`) REFERENCES `flower_categories`(`category_id`)
);

-- Data for table `flowers`
INSERT INTO `flowers` (`category_id`, `flower_name`, `price`, `stock_quantity`) VALUES
(1, 'Red Rose Bouquet', 19.99, 100),
(1, 'White Rose Bouquet', 24.99, 50),
(2, 'Pink Tulip Bunch', 15.99, 200),
(2, 'Yellow Tulip Bunch', 17.99, 150),
(3, 'Easter Lilies', 25.99, 75),
(3, 'White Lilies', 29.99, 60),
(4, 'Mixed Daisies', 10.99, 180),
(4, 'White Daisies', 12.99, 90),
(5, 'Purple Orchids', 34.99, 40),
(6, 'Sunflower Stalk', 5.99, 300);

-- Table structure for table `orders`
CREATE TABLE `orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT,
  `order_date` DATE,
  `total_amount` DECIMAL(10, 2),
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`)
);

-- Data for table `orders`
INSERT INTO `orders` (`customer_id`, `order_date`, `total_amount`) VALUES
(1, '2024-09-01', 45.97),
(2, '2024-09-02', 89.95),
(3, '2024-09-03', 30.99),
(4, '2024-09-04', 25.99),
(5, '2024-09-05', 59.98),
(6, '2024-09-06', 12.99),
(7, '2024-09-07', 49.99),
(8, '2024-09-08', 19.99),
(9, '2024-09-09', 29.99),
(10, '2024-09-10', 100.00);

-- Table structure for table `transactions`
CREATE TABLE `transactions` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT,
  `transaction_date` DATE,
  `amount` DECIMAL(10, 2),
  `payment_method` VARCHAR(50),
  PRIMARY KEY (`transaction_id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`)
);

-- Data for table `transactions`
INSERT INTO `transactions` (`order_id`, `transaction_date`, `amount`, `payment_method`) VALUES
(1, '2024-09-01', 45.97, 'Credit Card'),
(2, '2024-09-02', 89.95, 'PayPal'),
(3, '2024-09-03', 30.99, 'Debit Card'),
(4, '2024-09-04', 25.99, 'Credit Card'),
(5, '2024-09-05', 59.98, 'PayPal'),
(6, '2024-09-06', 12.99, 'Cash'),
(7, '2024-09-07', 49.99, 'Credit Card'),
(8, '2024-09-08', 19.99, 'Debit Card'),
(9, '2024-09-09', 29.99, 'PayPal'),
(10, '2024-09-10', 100.00, 'Credit Card');