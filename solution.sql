CREATE TABLE CUSTOMER (
    Customer_ID NUMBER PRIMARY KEY,
    Customer_Name VARCHAR2(50) NOT NULL,
    Customer_Tel VARCHAR2(20)
);

CREATE TABLE PRODUCT (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(50) NOT NULL,
    Price NUMBER(10,2) CHECK (Price > 0)
);

CREATE TABLE ORDERS (
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES CUSTOMER(Customer_ID)
        ON DELETE CASCADE
);

CREATE TABLE ORDER_LINE (
    Order_ID NUMBER,
    Product_ID NUMBER,
    Quantity NUMBER CHECK (Quantity > 0),
    PRIMARY KEY (Order_ID, Product_ID),
    CONSTRAINT fk_orderline_order
        FOREIGN KEY (Order_ID)
        REFERENCES ORDERS(Order_ID)
        ON DELETE CASCADE,
    CONSTRAINT fk_orderline_product
        FOREIGN KEY (Product_ID)
        REFERENCES PRODUCT(Product_ID)
        ON DELETE CASCADE
);


-- Code to alter table as required

ALTER TABLE PRODUCT
ADD Category VARCHAR2(20);

-- Add OrderDate column to ORDERS with default SYSDATE
ALTER TABLE ORDERS
ADD OrderDate DATE DEFAULT SYSDATE; 