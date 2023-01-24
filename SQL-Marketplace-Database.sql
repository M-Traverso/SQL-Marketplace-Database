/* Marketplace */

create schema if not exists marketplace;
use marketplace;

/* SELLERS */

create table sellers(
seller_id int primary key not null auto_increment,
name_ varchar(25),
surname varchar(25),
DNI int not null unique,
email varchar(45),
phone varchar(15)
);

/* NUYERS*/

create table buyers(
buyer_id int primary key not null auto_increment,
name_ varchar(25),
surname varchar(25),
DNI int not null unique,
email varchar(45),
phone varchar(15),
adress varchar(60) not null
);

/* 3PL´s */

create table _3PL´s(
id_3PL int primary key not null auto_increment,
company_name varchar(45),
PIC_email varchar(45),
PIC_phone varchar(15)
);

/* PRODUCTS */

create table products(
product_id int primary key not null auto_increment,
SKU int,
category varchar(25),
description_ varchar(60),
price decimal(2) not null,
quantity int,
seller_id int,
foreign key (seller_id) references sellers(seller_id) on delete cascade on update cascade
);

/* Purchases */

create table gross_purchases(
purchGross_id int primary key not null auto_increment,
product_id int,
buyer_id int,
date_ date,
status_ varchar(60),
payment_method varchar (10),
foreign key (product_id) references products(product_id) on update cascade,
foreign key (buyer_id) references buyers(buyer_id) on update cascade
);

/* PAYMENTS */

create table payments(
payment_id int primary key not null auto_increment,
purchGross_id int,
status_ varchar(60),
foreign key (purchGross_id) references gross_purchases(purchGross_id) on update cascade
);

/* NET PURCHASES */

create table net_purchases(
purchNet_id int primary key not null auto_increment,
purchGross_id int,
payment_id int,
date_ date,
status_ varchar(60),
foreign key (purchGross_id) references gross_purchases(purchGross_id) on update cascade,
foreign key (payment_id) references payments(payment_id) on update cascade
);


/* LOGISTICS */

create table logistics(
shiping_id int primary key not null auto_increment,
purchNet_id int,
id_3PL int,
shiping_price decimal(2) not null,
est_date date not null,
status_ varchar(60),
foreign key (purchNet_id) references net_purchases(purchNet_id) on update cascade,
foreign key (id_3PL) references _3PL´s(id_3PL) on update cascade
);

/* GROSS SALES */

create table gross_sales(
gross_id int primary key not null auto_increment,
purchNet_id int,
shiping_id int,
status_ varchar(60),
foreign key (purchNet_id) references net_purchases(purchNet_id) on update cascade,
foreign key (shiping_id) references logistics(shiping_id) on update cascade
);

/* NET SALES */

create table net_sales(
net_id int primary key not null auto_increment,
gross_id int,
shiping_id int,
status_ varchar(60),
foreign key (gross_id) references gross_sales(gross_id) on update cascade,
foreign key (shiping_id) references logistics(shiping_id) on update cascade
);

create table inverse_log(
inv_ship_id int primary key not null auto_increment,
net_id int not null,
id_3PL int not null,
shiping_price decimal(2) not null,
est_date date not null,
status_ varchar(60) not null,
foreign key (net_id) references net_sales(net_id) on update cascade,
foreign key (id_3PL) references _3PL´s(id_3PL) on update cascade
);

create table returns_(
return_id int primary key not null auto_increment,
net_id int not null,
inv_ship_id int not null,
status_ varchar(60) not null,
foreign key (net_id) references net_sales(net_id) on update cascade,
foreign key (inv_ship_id) references inverse_log(inv_ship_id) on update cascade
);

create table refunds(
refund_id int primary key not null auto_increment,
purchNet_id int,
return_id int,
status_ varchar(60) not null,
foreign key (purchNet_id) references net_purchases(purchNet_id) on update cascade,
foreign key (return_id) references returns_(return_id) on update cascade
);

describe sellers;
describe buyers;
describe _3pl´s;
describe products;
describe gross_purchases;
describe payments;
describe net_purchases;
describe logistics;
describe gross_sales;
describe net_sales;


