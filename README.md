## Trabajo Practico Especial OLAP-Espacial

- Luciana Reznik
- Matias Domingues

========

### Instalacion:

Linux:
- Instalar PostrgreSQL 9.1
- Instalar PostGIS
- Instalar PL/JAVA : apt-get install `postgresql-9.1-pljava-gcj`
- Setear el Path del archivo scripts.jar en la primera linea de scripts.sql
- Correr el script de instalacion de pljava en la base de datos `psql -d {DB NAME} -f /usr/share/postgresql-9.1-pljava/install.sql`
- Correr los scripts en scripts.sql

Windows:
- Instalar PostrgreSQL via Wizzard agregando como opcion de instalacion PostGIS y PL/Java
- Correr `CREATE LANGUAGE java;`
- Correr los scripts en scripts.sql

### Correr:

Una vez Instalado todo ya es posible utilizar los metodos ST_Intersects y ST_NearCentroid