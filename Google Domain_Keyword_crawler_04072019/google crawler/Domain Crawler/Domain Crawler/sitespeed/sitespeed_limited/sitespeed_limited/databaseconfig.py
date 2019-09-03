host = "192.168.1.17"
user = "root"
passwd = "xbyte"
database = "domaincrawler"

link_table = "link_table"

site_speed_limited_table = "site_speed_limited_data"

site_speed_table_fileds = """CREATE TABLE IF NOT EXISTS  %s (
    link_unique_id varchar(50) NOT NULL,
    backEndTime varchar(50),
    firstPaint varchar(50),
    firstVisualChange varchar(50),
    DOMContentLoaded varchar(50),
    _Load varchar(50),
    speedIndex varchar(50),
    visualComplete85 varchar(50),
    lastVisualChange varchar(50),
    rumSpeedIndex varchar(50),
    timestamp varchar(50) NOT NULL,
    PRIMARY KEY (link_unique_id)
);""" % site_speed_limited_table