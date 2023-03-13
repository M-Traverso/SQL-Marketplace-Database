/* Usamos el schema mysql */
use mysql;
/* Vemos que usuarios existen en la tabla users */
select * from user;
/* Creamos los usuarios nuevos */
create user 'Manuel-reader' identified by 'm4nuel-re4der';
create user 'Manuel-all' identified by 'm4nuel-4ll';
/* Sentencias GRANT */
grant select on marketplace.* to 'Manuel-reader';
grant select,insert,update on marketplace.* to 'Manuel-all';

