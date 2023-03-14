use marketplace;

select * from products;
select * from sellers;


set autocommit=0;
start transaction;
insert into sellers (name_,surname,DNI,email,phone) values
("Juan","Gonzales",42560688,"juan.gonzales6@gmail.com","1130313358"),
("Gonzalo","Ferrecio",38780199,"gonzalo.ferrecio@gmail.com","1130312671");
savepoint ins2a3;
insert into products (SKU,category,description_,price,quantity,seller_id) values
(0008,"Electronica,audio y video","Headphones inalambricos",10149,100,2),
(0009,"Autos, motos y otros","Volkswagen golf 2018",3650000,0,2),
(0010,"Celulares y telefonos","Samsung Galaxy M23 5G 36 GB",88999,40,2),
(0011,"Ropa y accesosrios","Camisa manga corta Ripcurl",12453,10,2),
(0012,"Hogar, muebles y jardin","Mesa comedor 140",36999,100,2),
(0013,"Electrodomesticos y aires ac.","Aire acondicionado slam split 6000 frigorias 220v",212999,20,2);
savepoint ins9a14;
insert into products (SKU,category,description_,price,quantity,seller_id) values
(0014,"Electronica,audio y video","Auriculares in-ear inalambricos xiaomi",10149,100,3),
(0015,"Autos, motos y otros","Renault 12 2012",3650000,0,3),
(0016,"Celulares y telefonos","Samsung Galaxy S23 5G 128 GB",88999,40,3),
(0017,"Ropa y accesosrios","Bermudas Quiksilver",12453,10,3),
(0018,"Hogar, muebles y jardin","Mesa comedor 200 + 10 Sillas",36999,100,3),
(0019,"Electrodomesticos y aires ac.","Aire acondicionado slam split 10000 frigorias 220v",212999,20,3);
savepoint ins15a20;

delete from sellers where id =3;

rollback to ins9a14;

commit;
