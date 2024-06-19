CREATE ROLE ibankadmin LOGIN PASSWORD 'ibankadmin' VALID UNTIL 'infinity';
CREATE ROLE ibankuser LOGIN PASSWORD 'ibankuser' VALID UNTIL 'infinity';

CREATE DATABASE image_bank
    WITH ENCODING = 'UTF8'
        OWNER = ibankadmin
        CONNECTION LIMIT = -1;