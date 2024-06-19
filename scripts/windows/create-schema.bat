@ECHO OFF

SET PGPASSWORD=redrover

psql -U postgres -f schema\remove-image-bank.sql 
psql -U postgres -f schema\create-database.sql

SET PGPASSWORD=ibankadmin
psql -U ibankadmin -f schema\ibank-ddl.sql  image_bank