@ECHO OFF

SET PGPASSWORD=redrover

psql -U postgres -f schema\remove-image-bank.sql 
