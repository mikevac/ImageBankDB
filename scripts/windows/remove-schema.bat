@ECHO OFF

SET PGPASSWORD=redrover

psql -U postgres -f schema\remove-image-bank.sql 
rem psql -U postgres -c 'DROP ROLE ibankuser;' -c 'DROP ROLE ibankadmin;'