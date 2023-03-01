/* -----MARKETPLACE----- */

create schema if not exists marketplace;
use marketplace;

/* -----SCRIPT DE CREACION DE TABLAS----- */

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

/* -----SCRIPT DE INSERCION DE DATOS----- */

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

/* -----SCRIPT DE CREACION DE VISTAS----- */

/* Seller_center es una vista donde los vendedores van a poder consultar informacion sobre el estado de sus ventas, una especie de tabla de echo */
create or replace view seller_center as
select
T1. seller_id,
concat(name_,' ',surname) as sellerName,
T2. product_id,
T2. description_,
T2. category,
T3. purchGross_id,
T4. purchNet_id,
T5. gross_id,
T6. net_id
from sellers T1
inner join products T2
on T1.seller_id = T2.seller_id
left join gross_purchases T3
on T2.product_id = T3.product_id
left join net_purchases T4
on T3.purchGross_id = T4.purchGross_id
left join gross_sales T5
on T4.purchNet_id = T5.purchNet_id
left join net_sales T6
on T5.gross_id = T6.gross_id;

select * from seller_center;

/* Seller_center_01 es donde los vendedores van a poder consultar acerca de sus metricas/performance a nivel global en el marketplace */

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

/* Seller_center_02 es donde los vendedores van a poder consultar acerca de sus metricas/performance a nivel producto en el marketplace */

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

/* Buyer_center es una tabla que se va a usar para renderizar en el marketplace la informacion necesaria para el comprador sobre el estado de sus pedidos */

create or replace view buyer_center as
select
T1. buyer_id,
concat(name_,' ',surname) as buyerName,
T3. product_id,
T3. description_,
T2. purchGross_id,
T2. status_ as status01,
T4. payment_id,
T4. status_ as status02,
T5. purchNet_id,
T5. status_ as status03,
T6. gross_id,
T6. status_ as status04,
T7. shiping_id,
T7. est_date,
T8. net_id,
T8. status_ as status05,
T9. return_id,
T9. status_ as status06,
T10. refund_id,
T10. status_ as status07
from buyers T1
inner join gross_purchases T2
on T1.buyer_id = T2.buyer_id
inner join products T3
on T2.product_id = T3.product_id
left join payments T4
on T2.purchGross_id = T4.purchGross_id
left join net_purchases T5
on T2.purchGross_id = T5.purchGross_id
left join gross_sales T6
on T5.purchNet_id = T6.purchNet_id
left join logistics T7
on T6.shiping_id = T7.shiping_id
left join net_sales T8
on T6.gross_id = T8.gross_id
left join returns_ T9
on T8.net_id = T9.net_id
left join refunds T10
on T5.purchNet_id = T10.purchNet_id;


select * from buyer_center;

/* -----SCRIPT DE FUCNIONES----- */

DELIMITER //
create function revenue(n numeric(10,2), p numeric(10,2)) returns numeric(10,2)
deterministic
begin
   return n*p;
end;
//

DELIMITER //
create function ratio(g numeric(10,2), n numeric(10,2)) returns numeric(10,2)
deterministic
begin
   declare f numeric(10,2);
   IF g <> 0
   THEN
   set f = n/g;
   ELSE
   set f = null;
   END IF;
   return f;
end;
//

DELIMITER //
create function foundations(g numeric(10,2), n numeric(10,2)) returns varchar(50)
deterministic
begin
   declare f numeric(10,2);
   declare mensaje varchar(50);
   IF g <> 0
   THEN
   set f = n/g;
   ELSE
   set f = null;
   END IF;
   
   IF f >= 0.8
   THEN
   set mensaje = 'Tienes un flujo saludable';
   ELSEIF f is not null
   THEN
   set mensaje = 'Debes mejorar tu flujo de ventas';
   ELSE
   set mensaje = 'Aun no tienes ninguna venta';
   END IF;
   return mensaje;
end;
//

/* Revenue, ratio y foundations son funciones que les van a brindar visibilidad a los vendedores sobre lo que consideramos una performance saludable dentro del marketplace, una herramienta adicional del seller center */

create or replace view revenue as
select 
T1. product_id,
T1. net_sales,
T2. price,
revenue(net_sales,price) as net_revenue,
revenue(gross_sales,price) as gross_revenue,
ratio(gross_sales,net_sales) as Health_ratio,
foundations(gross_sales,net_sales) as Fundamentals
from seller_center_02 T1
left join products T2
on T1.product_id = T2.product_id;

select * from revenue;

DELIMITER //
create function purchase_status(a varchar(100), b varchar(100), c varchar(100), d varchar(100), e varchar(100), f varchar(100), g varchar(100)) returns varchar(100)
deterministic
begin
declare mensaje varchar(100);
   IF g is not null
   THEN 
   set mensaje = g;
   ELSEIF f is not null
   THEN 
   set mensaje = f;
   ELSEIF e is not null
   THEN
   set mensaje = e;
      ELSEIF d is not null
   THEN
   set mensaje = d;
      ELSEIF c is not null
   THEN
   set mensaje = c;
      ELSEIF b is not null
   THEN
   set mensaje = b;
     ELSEIF a is not null
   THEN
   set mensaje = a;   
   END IF;
   return mensaje;
end;
//

/* Purchase_status lo que busca hacer es dar visibilidad al comprador acerca del status mas actulizado del estado de su compra, es un complemento de la vista buyer_center */

create or replace view purchase_board as
select
product_id,
description_,
purchase_status(status01,status02,status03,status04,status05,status06,status07) as Purchase_status
from buyer_center;

select * from purchase_board;

/* -----SCRIPT DE STORED PROCEDURES----- */

DELIMITER //
create procedure pack_off (IN dato int, IN status varchar(100) )
begin
  update net_purchases
  set status_=status
  where purchNet_id=dato;
end;
//

/* El comprador realiza la compra del producto con id=4 */

insert into gross_purchases (product_id,buyer_id,date_,status_,payment_method) values
(4,1,"2023-02-05","pago aprobado","tarjeta de credito");

select * from gross_purchases;

/* Se procede a revisar el pago de la compra con id=12 */

insert into payments (purchGross_id,status_) values
(12,"pago con tarjeta de credito visa: APROBADO");

select * from payments;

/* Una vez que el pago con id=10 fue aprobado se genera el registro en net_purchases, la compra se realizo con exito, el reigstro se create
con el estado "el vendedor esta preparando tu pedido" */

insert into net_purchases (purchGross_id,payment_id,date_,status_) values
(12,10,"2023-02-05","el vendedor esta preparando tu pedido");

select * from net_purchases;
select * from logistics;

/* Veamos que en la tabla de net_purchases se creo el registro con el id=13, pero como el paquete esta pendiente de ser despachado, todavia
no se genero el registro en la tabla de logistics*/

/* Una vez despachado el paquete el vendedor comunicara con un boton a traves del marketplace que el paquete se encuentra en manos del operador logistico,
esto hara uso del stored procedure pack_off*/

call pack_off(13,"el vendedor ya despacho tu pedido"); /* veamos que pack_off dispara la ejecuccion del trigger logistics_insert_01 */

select * from logistics;

/* Si observamos la tabla de logistics ahora podemos observar que se genero el registro con el id=7 */

/* El sotred procedure shiping lo que hace es asignarle al paquete un operador logistico y un costo de envio, esto queda del lado del operador logistico,
que luego de recoger el paquete por el correo cargara los datos correspondientes a traves del marketplace */

DELIMITER //
create procedure shiping (IN dato01 int, IN dato02 int, IN price decimal(6,2))
begin
   update logistics
   set id_3PL=dato02,
   shiping_price=price
   where shiping_id=dato01; 
end;
//

call shiping(7,1,325.50);

/* -----SCRIPT DE TRIGGERS----- */

/* Los triggers van a generar el registro del envio una vez que el vendedor haya despachado el paquete con el operador logistico */

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

/* El trigger se activa cuando se inserta o se modifica un registro de la tabla de net_purchases, lo que hace es generar el registro en la tabla de logistics, es decir, cada vez que 
se aprueba un pago y el vendedor despacha el pedido, se genera un registro en la tabla de envios  */

DELIMITER //
create trigger logistics_insert
after insert on net_purchases
for each row
begin
  IF (new.status_ = "el vendedor ya despacho tu pedido")
  THEN
    insert into logistics(purchNet_id,id_3PL,shiping_price,est_date,status_) values (new.purchNet_id,id_3PL,shiping_price,date_add(now(), interval 4 day),'el paquete esta en camino');
  END IF;
end;
//

DELIMITER //
create trigger logistics_insert_01
after update on net_purchases
for each row
begin
  IF (new.status_ = "el vendedor ya despacho tu pedido")
  THEN
    insert into logistics(purchNet_id,id_3PL,shiping_price,est_date,status_) values (new.purchNet_id,id_3PL,shiping_price,date_add(now(), interval 4 day),'el paquete esta en camino');
  END IF;
end;
//

/* ---------- */

/* Los triggers van a registrar la operacion de los registros de la tabla productos, creacion, modificacion y eliminacion de productos del marketplace */

create table bitacora (
id int auto_increment not null primary key,
action varchar(24),
date datetime,
product_id int,
new_value varchar(60),
old_value varchar(60),
user varchar(24)
);

DELIMITER //
create trigger bitacora_insert
after insert on products
for each row
begin
  insert into bitacora(action,date,product_id,new_value,old_value,user) values ('create',now(),new.product_id,new.description_,null,system_user());
end;
//

DELIMITER //
create trigger bitacora_update
before update on products
for each row
begin
  insert into bitacora(action,date,product_id,new_value,old_value,user) values ('edit',now(),new.product_id,new.description_,old.description_,system_user());
end;
//

DELIMITER //
create trigger bitacora_delete
before delete on products
for each row
begin
  insert into bitacora(action,date,product_id,new_value,old_value,user) values ('delete',now(),old.product_id,null,old.description_,system_user());
end;
//

insert into products (SKU,category,description_,price,quantity,seller_id) values
(0007,"Electrodomesticos y aires ac.","Aire acondicionado slam split 100000 frigorias 220v",500000,20,1);

update products
set description_='Aire samsung 50000 frigorias 220v usado'
where product_id=7;

delete from products where product_id=7;

select * from products;

select * from bitacora;









