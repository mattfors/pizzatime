CREATE TABLE addr (
    addr_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    suite_number VARCHAR(50),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    residence_flag BOOLEAN NOT NULL,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE cust (
    cust_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    addr_id INT,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (addr_id) REFERENCES addr(addr_id)
);

CREATE TABLE ord (
    ord_id INT AUTO_INCREMENT PRIMARY KEY,
    cust_id INT NOT NULL,
    ord_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ord_status VARCHAR(50) NOT NULL,
    ship_to_addr_id INT,
    ship_from_addr_id INT,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cust_id) REFERENCES cust(cust_id),
    FOREIGN KEY (ship_to_addr_id) REFERENCES addr(addr_id),
    FOREIGN KEY (ship_from_addr_id) REFERENCES addr(addr_id)
);

CREATE TABLE ord_line (
    ord_line_id INT AUTO_INCREMENT PRIMARY KEY,
    ord_id INT NOT NULL,
    prod_id INT NOT NULL,
    qty INT NOT NULL,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ord_id) REFERENCES ord(ord_id),
    FOREIGN KEY (prod_id) REFERENCES prod(prod_id)
);

CREATE TABLE ord_line_detail (
    ord_line_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    ord_line_id INT NOT NULL,
    detail_key VARCHAR(255) NOT NULL,
    detail_value VARCHAR(255) NOT NULL,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mod_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ord_line_id) REFERENCES ord_line(ord_line_id)
);

CREATE TABLE ord_status (
    ord_status_id INT AUTO_INCREMENT PRIMARY KEY,
    ord_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ord_id) REFERENCES ord(ord_id)
);