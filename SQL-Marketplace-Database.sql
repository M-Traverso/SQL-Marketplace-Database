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

/* BUYERS*/

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
category varchar(80),
description_ varchar(60),
price decimal(10,2) not null,
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
status_ varchar(100),
payment_method varchar (50),
foreign key (product_id) references products(product_id) on update cascade,
foreign key (buyer_id) references buyers(buyer_id) on update cascade
);

/* PAYMENTS */

create table payments(
payment_id int primary key not null auto_increment,
purchGross_id int,
status_ varchar(100),
foreign key (purchGross_id) references gross_purchases(purchGross_id) on update cascade
);

/* NET PURCHASES */

create table net_purchases(
purchNet_id int primary key not null auto_increment,
purchGross_id int,
payment_id int,
date_ date,
status_ varchar(100),
foreign key (purchGross_id) references gross_purchases(purchGross_id) on update cascade,
foreign key (payment_id) references payments(payment_id) on update cascade
);

/* LOGISTICS */

create table logistics(
shiping_id int primary key not null auto_increment,
purchNet_id int,
id_3PL int,
shiping_price decimal(10,2) not null,
est_date date not null,
status_ varchar(100),
foreign key (purchNet_id) references net_purchases(purchNet_id) on update cascade,
foreign key (id_3PL) references _3PL´s(id_3PL) on update cascade
);

/* GROSS SALES */

create table gross_sales(
gross_id int primary key not null auto_increment,
purchNet_id int,
shiping_id int,
status_ varchar(100),
foreign key (purchNet_id) references net_purchases(purchNet_id) on update cascade,
foreign key (shiping_id) references logistics(shiping_id) on update cascade
);

/* NET SALES */

create table net_sales(
net_id int primary key not null auto_increment,
gross_id int,
shiping_id int,
status_ varchar(100),
foreign key (gross_id) references gross_sales(gross_id) on update cascade,
foreign key (shiping_id) references logistics(shiping_id) on update cascade
);

/* INVERSE LOGISTICS */

create table inverse_log(
inv_ship_id int primary key not null auto_increment,
net_id int not null,
id_3PL int not null,
shiping_price decimal(10,2) not null,
est_date date not null,
status_ varchar(100) not null,
foreign key (net_id) references net_sales(net_id) on update cascade,
foreign key (id_3PL) references _3PL´s(id_3PL) on update cascade
);

/* RETURNS */

create table returns_(
return_id int primary key not null auto_increment,
net_id int not null,
inv_ship_id int not null,
status_ varchar(100) not null,
foreign key (net_id) references net_sales(net_id) on update cascade,
foreign key (inv_ship_id) references inverse_log(inv_ship_id) on update cascade
);

/* REFUNDS */

create table refunds(
refund_id int primary key not null auto_increment,
purchNet_id int,
return_id int,
status_ varchar(100) not null,
foreign key (purchNet_id) references net_purchases(purchNet_id) on update cascade,
foreign key (return_id) references returns_(return_id) on update cascade
);

/* SELLERS */
insert into sellers (name_,surname,DNI,email,phone) values
("Manuel","Traverso",39760688,"m.traverso96@gmail.com","1130310056");
/* BUYERS*/
insert into buyers (name_,surname,DNI,email,phone,adress) values
("Julian","Cabrera",40760578,"j.cabrera@gmail.com","1140421022","Echeverria 850");
/* 3PL´s */
insert into _3PL´s (company_name,PIC_email,PIC_phone) values
("Correo Argentino","mariano.paz@correoargentino.com","1145260059");
/* PRODUCTS */
insert into products (SKU,category,description_,price,quantity,seller_id) values
(0001,"Electronica,audio y video","Auriculares in-ear inalambricos",10149,100,1),
(0002,"Autos, motos y otros","Ford Focus lii 2.0 Se Plus At6",3650000,0,1),
(0003,"Celulares y telefonos","Samsung Galaxy M23 5G 128 GB",88999,40,1),
(0004,"Ropa y accesosrios","Camisa manga corta Quiksilver",12453,10,1),
(0005,"Hogar, muebles y jardin","Mesa comedor 140 + 6 Sillas",36999,100,1),
(0006,"Electrodomesticos y aires ac.","Aire acondicionado slam split 4472 frigorias 220v",212999,20,1);

insert into products (SKU,category,description_,price,quantity,seller_id) values
(0007,"Electrodomesticos y aires ac.","Aire acondicionado slam split 100000 frigorias 220v",500000,20,1);

/* PURCHASES */
insert into gross_purchases (product_id,buyer_id,date_,status_,payment_method) values
(1,1,"2023-02-05","pago aprobado","tarjeta de credito"),
(2,1,"2023-02-05","pago rechazado, elige otro medio de pago","tarjeta de credito"),
(3,1,"2023-02-05","pago pendiente",null),
(4,1,"2023-02-05","pago aprobado","tarjeta de credito"),
(5,1,"2023-02-05","pago aprobado","tarjeta de credito"),
(6,1,"2023-02-05","pago aprobado","tarjeta de credito");
/* PAYMENTS */
insert into payments (purchGross_id,status_) values
(1,"pago con tarjeta de credito visa: APROBADO"),
(2,"pago con tarjeta de credito visa: RECHAZADO"),
(4,"pago con tarjeta de credito visa: APROBADO"),
(5,"pago con tarjeta de credito visa: APROBADO"),
(6,"pago con tarjeta de credito visa: APROBADO");
/* NET PURCHASES */
insert into net_purchases (purchGross_id,payment_id,date_,status_) values
(1,1,"2023-02-05","el vendedor esta preparando tu pedido"),
(4,3,"2023-02-05","el vendedor cancelo la compra, te devolveremos tu dinero"),
(5,4,"2023-02-05","el vendedor ya despacho tu pedido"),
(6,5,"2023-02-05","el vendedor ya despacho tu pedido");
/* LOGISTICS */
insert into logistics (purchNet_id,id_3PL,shiping_price,est_date,status_) values
(3,1,300,"2023-02-10","el paquete fue entregado"),
(4,1,300,"2023-02-10","el paquete esta en camino");
/* GROSS SALES */
insert into gross_sales (purchNet_id,shiping_id,status_) values
(3,1,"el paquete fue entregado"),
(4,2,"el paquete esta en camino");
/* NET SALES */
insert into net_sales (gross_id,shiping_id,status_) values
(1,1,"el paquete ya fue entregado");
/* INVERSE LOGISTICS */
insert into inverse_log (net_id,id_3PL,shiping_price,est_date,status_) values
(1,1,300.50,"2023-02-15","recogido");
/* RETURNS */
insert into returns_ (net_id,inv_ship_id,status_) values
(1,1,"el pedido ya ha sido recogido");
/* REFUNDS */
insert into refunds (purchNet_id,return_id,status_) values
(2,null,"tu dinero ha sido depositado en tu billetera virtual"),
(3,1,"estamos esperando que el vendedor reciba el producto para devolver tu dinero");

/* Script de creacion de vistas */

create or replace view seller_center as
select
T1. seller_id,
T1. sellerName,
T1. product_id,
T1. description_,
T1. category,
T1. purchGross_id,
T1. purchNet_id,
T1. gross_id,
T2. net_id
from (
select
T1. seller_id,
T1. sellerName,
T1. product_id,
T1. description_,
T1. category,
T1. purchGross_id,
T1. purchNet_id,
T2. gross_id
from (
select
T1. seller_id,
T1. sellerName,
T1. product_id,
T1. description_,
T1. category,
T1. purchGross_id,
T2. purchNet_id
from (
select
T2. seller_id,
concat(name_,' ',surname) as sellerName,
T1. product_id,
T1. description_,
T1. category,
T3. purchGross_id
from products T1
inner join sellers T2
on T1.seller_id = T2.seller_id
left join gross_purchases T3
on T1.product_id = T3.product_id) T1
left join net_purchases T2
on T1.purchGross_id = T2.purchGross_id) T1
left join gross_sales T2
on T1.purchNet_id = T2.purchNet_id) T1
left join net_sales T2
on T1.gross_id = T2.gross_id;

select * from seller_center;

create or replace view seller_center_01 as
select
seller_id,
sellerName,
count(product_id) Products,
count(purchGross_id) Gross_purchases,
count(purchNet_id) Net_purchases,
count(gross_id) Gross_sales,
count(net_id) Net_sales
from seller_centre
group by seller_id;

select * from seller_center_01;

create or replace view seller_center_02 as
select
product_id,
description_,
category,
seller_id,
sellerName,
count(product_id) Products,
count(purchGross_id) Gross_purchases,
count(purchNet_id) Net_purchases,
count(gross_id) Gross_sales,
count(net_id) Net_sales
from seller_centre
group by product_id;

select * from seller_center_02;

create or replace view buyer_center as
select
T1. buyer_id,
buyerName,
T1. product_id,
T1. description_,
T1. purchGross_id,
T1. status01,
T1. payment_id,
T1. status02,
T1. purchNet_id,
T1. status03,
T1. gross_id,
T1. status04,
T1. shiping_id,
T1. est_date,
T1. net_id,
T1. status05,
T1. return_id,
T1. status06,
T2. refund_id,
T2. status_ as status07
from(
select
T1. buyer_id,
buyerName,
T1. product_id,
T1. description_,
T1. purchGross_id,
T1. status01,
T1. payment_id,
T1. status02,
T1. purchNet_id,
T1. status03,
T1. gross_id,
T1. status04,
T1. shiping_id,
T1. est_date,
T1. net_id,
T1. status05,
T2. return_id,
T2. status_ as status06
from(
select
T1. buyer_id,
buyerName,
T1. product_id,
T1. description_,
T1. purchGross_id,
T1. status01,
T1. payment_id,
T1. status02,
T1. purchNet_id,
T1. status03,
T1. gross_id,
T1. status04,
T1. shiping_id,
T1. est_date,
T2. net_id,
T2. status_ as status05
from(
select
T1. buyer_id,
buyerName,
T1. product_id,
T1. description_,
T1. purchGross_id,
T1. status01,
T1. payment_id,
T1. status02,
T1. purchNet_id,
T1. status03,
T1. gross_id,
T1. status04,
T1. shiping_id,
T2. est_date
from (
select
T1. buyer_id,
buyerName,
T1. product_id,
T1. description_,
T1. purchGross_id,
T1. status01,
T1. payment_id,
T1. status02,
T1. purchNet_id,
T1. status03,
T2. gross_id,
T2. shiping_id,
T2. status_ as status04
from (
select
T1. buyer_id,
buyerName,
T1. product_id,
T1. description_,
T1. purchGross_id,
T1. status01,
T1. payment_id,
T1. status02,
T2. purchNet_id,
T2. status_ as status03
from (
select
T2. buyer_id,
concat(name_,' ',surname) as buyerName,
T3. product_id,
T3. description_,
T1. purchGross_id,
T1. status_ as status01,
T4. payment_id,
T4. status_ as status02
from gross_purchases T1
inner join buyers T2
on T1.buyer_id = T2.buyer_id
inner join products T3
on T1.product_id = T3.product_id
left join payments T4
on T1.purchGross_id = T4.purchGross_id) T1
left join net_purchases T2
on T1.purchGross_id = T2.purchGross_id) T1
left join gross_sales T2
on T1.purchNet_id = T2.purchNet_id) T1
left join logistics T2
on T1.shiping_id = T2.shiping_id) T1
left join net_sales T2
on T1.gross_id = T2.gross_id) T1
left join returns_ T2
on T1.net_id = T2.net_id) T1
left join refunds T2
on T1.purchNet_id = T2.purchNet_id;


select * from buyer_center;













