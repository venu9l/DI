Hello,

This script is going to visit the website you input and get save the HTML in the database.

Follow the below steps to run this scripts:

1> goto the "link_extractor/link_extractor" directory, and find the "databaseconfig.py"

2> update your MySQL database credentials in that file.

3> goto the "link_extractor/link_extractor/spiders" directory and open terminal over there.

4> enter the following command to run the script.
    "scrapy crawl link_spider -a input=WEBSITE_URL"

5> This will start crawling the website. You can check the result into the database.
