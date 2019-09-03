host = "localhost"
user = "root"
passwd = ""
database = "rdb"

main_table = "main_table"
link_table = "link_table"

main_table_fields = """CREATE TABLE IF NOT EXISTS  %s (
    unique_id varchar(50) NOT NULL,
    url TEXT NOT NULL,
    timestamp varchar(50) NOT NULL,
    status varchar(10) NOT NULL DEFAULT 'Pending',
    PRIMARY KEY (unique_id)
);
""" % main_table

link_table_fileds = """CREATE TABLE IF NOT EXISTS  %s (
    parent_unique_id varchar(50) NOT NULL,
    link_unique_id varchar(50) NOT NULL,
    request_url TEXT NOT NULL,
    response_url TEXT NOT NULL,
    status_code varchar(10) NOT NULL,
    html_content longtext NOT NULL,
    timestamp varchar(50) NOT NULL,
    status varchar(10) DEFAULT 'pending',
    PRIMARY KEY (link_unique_id)
);""" % link_table

alt_tbale = "ALTER TABLE link_table ADD CONSTRAINT link_table_fk0 FOREIGN KEY (parent_unique_id) REFERENCES main_table(unique_id);"