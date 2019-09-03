Hello,

Once you finished with the link_extractor. You can run this script.
This script will get data from the sitespeed.io API

Follow the below steps to run this scripts:

1> goto the "sitespeed/sitespeed_full/sitespeed_full" directory, and find the "databaseconfig.py"

2> update your MySQL database credentials in that file.

3> goto the "sitespeed/sitespeed_full/sitespeed_full/spiders" directory and open terminal over there.

4> enter the following command to run the script.
    "scrapy crawl get_details"

5> This will fetch the links form the result table of link_extractor and start processing it for the speedtest API

6> Result of this script you can find in the database

Note: Same steps goes for the sitespeed_limited file.
