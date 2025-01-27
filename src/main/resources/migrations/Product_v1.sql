CREATE TABLE barcode (
    barcode_id INT PRIMARY KEY,
    prod_id INT NOT NULL,
    barcode_type VARCHAR(10) NOT NULL,
    barcode_data VARCHAR(50) NOT NULL,
    UNIQUE (prod_id, barcode_type, barcode_data)
);

CREATE TABLE descriptions (
    description_id INT PRIMARY KEY,
    short_desc VARCHAR(255) NOT NULL,
    long_desc TEXT NOT NULL
);

CREATE TABLE dimensions (
    dimensions_id INT PRIMARY KEY,
    weight DECIMAL(10, 2) NOT NULL,
    length DECIMAL(10, 2) NOT NULL,
    width DECIMAL(10, 2) NOT NULL,
    height DECIMAL(10, 2) NOT NULL
);

CREATE TABLE prod (
    prod_id INT PRIMARY KEY,
    mat_num VARCHAR(50) NOT NULL UNIQUE,
    ext_mat_num VARCHAR(50) NOT NULL,
    prod_type VARCHAR(100) NOT NULL,
    brand_code VARCHAR(10) NOT NULL,
    case_qty INT NOT NULL,
    dimensions_id INT,
    description_id INT,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE brand (
    brand_code VARCHAR(10) NOT NULL PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);

INSERT INTO brand (brand_code, brand_name) VALUES ('TONY', 'Tony\'s Italian Premium');
INSERT INTO brand (brand_code, brand_name) VALUES ('MAMA', 'Mama Mia\'s Finest');
INSERT INTO brand (brand_code, brand_name) VALUES ('PAPA', 'Papa\'s Pizzeria');
INSERT INTO brand (brand_code, brand_name) VALUES ('LUIGI', 'Luigi\'s Gourmet');
INSERT INTO brand (brand_code, brand_name) VALUES ('BELLA', 'Bella\'s Best');
INSERT INTO brand (brand_code, brand_name) VALUES ('VITO', 'Vito\'s Classic');
INSERT INTO brand (brand_code, brand_name) VALUES ('GIO', 'Giovanni\'s Select');
INSERT INTO brand (brand_code, brand_name) VALUES ('SICI', 'Sicilian Delights');
INSERT INTO brand (brand_code, brand_name) VALUES ('NAP', 'Napoli\'s Choice');
INSERT INTO brand (brand_code, brand_name) VALUES ('ROMA', 'Roma\'s Authentic');

INSERT INTO descriptions (description_id, short_desc, long_desc) VALUES (1, 'Pepperoni Spice', 'Spicy pepperoni slices');
INSERT INTO descriptions (description_id, short_desc, long_desc) VALUES (2, 'Pepperoni Mild', 'Mild pepperoni slices');
INSERT INTO descriptions (description_id, short_desc, long_desc) VALUES (3, 'Black Olives', 'Sliced black olives');
INSERT INTO descriptions (description_id, short_desc, long_desc) VALUES (4, 'Castelventrato Olives', 'Premium Castelventrato olives');
INSERT INTO descriptions (description_id, short_desc, long_desc) VALUES (5, 'Traditional Crust', 'Classic pizza crust');
INSERT INTO descriptions (description_id, short_desc, long_desc) VALUES (6, 'Cauliflower Crust', 'Gluten-free cauliflower crust');
INSERT INTO descriptions (description_id, short_desc, long_desc) VALUES (7, 'Thin Crust', 'Thin and crispy pizza crust');
INSERT INTO descriptions (description_id, short_desc, long_desc) VALUES (8, 'Stuffed Crust', 'Cheese stuffed pizza crust');
INSERT INTO descriptions (description_id, short_desc, long_desc) VALUES (9, 'Sharp Mozzarella', 'Sharp mozzarella cheese');
INSERT INTO descriptions (description_id, short_desc, long_desc) VALUES (10, 'Mozzarella', 'Classic mozzarella cheese');
INSERT INTO descriptions (description_id, short_desc, long_desc) VALUES (11, 'Cheddar', 'Cheddar cheese');

INSERT INTO dimensions (dimensions_id, weight, length, width, height) VALUES (1, 0.5, 10, 10, 1);
INSERT INTO dimensions (dimensions_id, weight, length, width, height) VALUES (2, 0.5, 10, 10, 1);
INSERT INTO dimensions (dimensions_id, weight, length, width, height) VALUES (3, 0.5, 10, 10, 1);
INSERT INTO dimensions (dimensions_id, weight, length, width, height) VALUES (4, 0.5, 10, 10, 1);
INSERT INTO dimensions (dimensions_id, weight, length, width, height) VALUES (5, 1.0, 12, 12, 1);
INSERT INTO dimensions (dimensions_id, weight, length, width, height) VALUES (6, 1.0, 12, 12, 1);
INSERT INTO dimensions (dimensions_id, weight, length, width, height) VALUES (7, 1.0, 12, 12, 1);
INSERT INTO dimensions (dimensions_id, weight, length, width, height) VALUES (8, 1.0, 12, 12, 1);
INSERT INTO dimensions (dimensions_id, weight, length, width, height) VALUES (9, 0.5, 10, 10, 1);
INSERT INTO dimensions (dimensions_id, weight, length, width, height) VALUES (10, 0.5, 10, 10, 1);
INSERT INTO dimensions (dimensions_id, weight, length, width, height) VALUES (11, 0.5, 10, 10, 1);

INSERT INTO prod (prod_id, mat_num, ext_mat_num, prod_type, brand_code, case_qty, dimensions_id, description_id) VALUES (1, 'P001', 'EXT001', 'TOPPING', 'TONY', 10, 1, 1);
INSERT INTO prod (prod_id, mat_num, ext_mat_num, prod_type, brand_code, case_qty, dimensions_id, description_id) VALUES (2, 'P002', 'EXT002', 'TOPPING', 'TONY', 10, 2, 2);
INSERT INTO prod (prod_id, mat_num, ext_mat_num, prod_type, brand_code, case_qty, dimensions_id, description_id) VALUES (3, 'P003', 'EXT003', 'TOPPING', 'TONY', 10, 3, 3);
INSERT INTO prod (prod_id, mat_num, ext_mat_num, prod_type, brand_code, case_qty, dimensions_id, description_id) VALUES (4, 'P004', 'EXT004', 'TOPPING', 'TONY', 10, 4, 4);
INSERT INTO prod (prod_id, mat_num, ext_mat_num, prod_type, brand_code, case_qty, dimensions_id, description_id) VALUES (5, 'P005', 'EXT005', 'CRUST', 'TONY', 10, 5, 5);
INSERT INTO prod (prod_id, mat_num, ext_mat_num, prod_type, brand_code, case_qty, dimensions_id, description_id) VALUES (6, 'P006', 'EXT006', 'CRUST', 'TONY', 10, 6, 6);
INSERT INTO prod (prod_id, mat_num, ext_mat_num, prod_type, brand_code, case_qty, dimensions_id, description_id) VALUES (7, 'P007', 'EXT007', 'CRUST', 'TONY', 10, 7, 7);
INSERT INTO prod (prod_id, mat_num, ext_mat_num, prod_type, brand_code, case_qty, dimensions_id, description_id) VALUES (8, 'P008', 'EXT008', 'CRUST', 'TONY', 10, 8, 8);
INSERT INTO prod (prod_id, mat_num, ext_mat_num, prod_type, brand_code, case_qty, dimensions_id, description_id) VALUES (9, 'P009', 'EXT009', 'CHEESE', 'TONY', 10, 9, 9);
INSERT INTO prod (prod_id, mat_num, ext_mat_num, prod_type, brand_code, case_qty, dimensions_id, description_id) VALUES (10, 'P010', 'EXT010', 'CHEESE', 'TONY', 10, 10, 10);
INSERT INTO prod (prod_id, mat_num, ext_mat_num, prod_type, brand_code, case_qty, dimensions_id, description_id) VALUES (11, 'P011', 'EXT011', 'CHEESE', 'TONY', 10, 11, 11);

INSERT INTO barcode (barcode_id, prod_id, barcode_type, barcode_data) VALUES (1, 1, 'UPC', '123456789012');
INSERT INTO barcode (barcode_id, prod_id, barcode_type, barcode_data) VALUES (2, 2, 'UPC', '123456789013');
INSERT INTO barcode (barcode_id, prod_id, barcode_type, barcode_data) VALUES (3, 3, 'UPC', '123456789014');
INSERT INTO barcode (barcode_id, prod_id, barcode_type, barcode_data) VALUES (4, 4, 'UPC', '123456789015');
INSERT INTO barcode (barcode_id, prod_id, barcode_type, barcode_data) VALUES (5, 5, 'UPC', '123456789016');
INSERT INTO barcode (barcode_id, prod_id, barcode_type, barcode_data) VALUES (6, 6, 'UPC', '123456789017');
INSERT INTO barcode (barcode_id, prod_id, barcode_type, barcode_data) VALUES (7, 7, 'UPC', '123456789018');
INSERT INTO barcode (barcode_id, prod_id, barcode_type, barcode_data) VALUES (8, 8, 'UPC', '123456789019');
INSERT INTO barcode (barcode_id, prod_id, barcode_type, barcode_data) VALUES (9, 9, 'UPC', '123456789020');
INSERT INTO barcode (barcode_id, prod_id, barcode_type, barcode_data) VALUES (10, 10, 'UPC', '123456789021');
INSERT INTO barcode (barcode_id, prod_id, barcode_type, barcode_data) VALUES (11, 11, 'UPC', '123456789022');

ALTER TABLE descriptions MODIFY description_id INT AUTO_INCREMENT;
ALTER TABLE dimensions MODIFY dimensions_id INT AUTO_INCREMENT;
ALTER TABLE prod MODIFY prod_id INT AUTO_INCREMENT;
ALTER TABLE barcode MODIFY barcode_id INT AUTO_INCREMENT;