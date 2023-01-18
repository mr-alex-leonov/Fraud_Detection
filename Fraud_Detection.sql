CREATE TABLE Transactions (
    transaction_id int   NOT NULL,
    date timestamp   NOT NULL,
    amount varchar(50)   NOT NULL,
    card_number varchar(20)   NOT NULL,
    merchant_id int   NOT NULL,
    CONSTRAINT pk_Transactions PRIMARY KEY (
        transaction_id
     )
);

CREATE TABLE Merchant (
    merchant_id int   NOT NULL,
    merchant_name varchar(50)   NOT NULL,
    merchant_category_id int   NOT NULL,
    CONSTRAINT pk_Merchant PRIMARY KEY (
        merchant_id
     )
);

CREATE TABLE Card_holder (
    cardholder_id int   NOT NULL,
    cardholder_name varchar(50)   NOT NULL,
    CONSTRAINT pk_Card_holder PRIMARY KEY (
        cardholder_id
     )
);

CREATE TABLE Merchant_Category (
    merchant_category_id int   NOT NULL,
    category_name varchar(50)   NOT NULL,
    CONSTRAINT pk_Merchant_Category PRIMARY KEY (
        merchant_category_id
     )
);

CREATE TABLE Credit_Card (
    card_number varchar(20)   NOT NULL,
    cardholder_id int   NOT NULL,
    CONSTRAINT pk_Credit_Card PRIMARY KEY (
        card_number
     )
);

ALTER TABLE Transactions ADD CONSTRAINT fk_Transactions_card_number FOREIGN KEY(card_number)
REFERENCES Credit_Card (card_number);

ALTER TABLE Transactions ADD CONSTRAINT fk_Transactions_merchant_id FOREIGN KEY(merchant_id)
REFERENCES Merchant (merchant_id);

ALTER TABLE Merchant ADD CONSTRAINT fk_Merchant_merchant_category_id FOREIGN KEY(merchant_category_id)
REFERENCES Merchant_Category (merchant_category_id);

ALTER TABLE Credit_Card ADD CONSTRAINT fk_Credit_Card_cardholder_id FOREIGN KEY(cardholder_id)
REFERENCES Card_holder (cardholder_id);