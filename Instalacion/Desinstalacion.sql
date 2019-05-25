drop user "EV_ADMIN" CASCADE;
Drop user "EV_INVITADO" CASCADE;

drop public synonym SyEv_AEROPUERTO;
drop public synonym SyEv_TRAYECTO;
drop public synonym SyEv_TRABAJADOR;
drop public synonym SyEv_FIJO;
drop public synonym SyEv_BECARIO;
drop public synonym SyEv_TRAYECTOSFIJADOS;
drop public synonym SyEv_AVION;
drop public synonym SyEv_VENTA;
drop public synonym SyEv_USUARIO;
drop public synonym SyEv_NOTICIAS;

DROP TABLESPACE "EMPRESAVUELOS" INCLUDING CONTENTS AND DATAFILES    CASCADE CONSTRAINTS;
DROP TABLESPACE "INDICEEMPRESAVUELOS" INCLUDING CONTENTS AND DATAFILES    CASCADE CONSTRAINTS;

exit