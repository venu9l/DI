# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import pymysql
from sitespeed_limited import databaseconfig as dbc
from datetime import datetime


class SitespeedLimitedPipeline(object):


    def __init__(self) -> None:
        super().__init__()

        try:
            self.con = pymysql.connect(dbc.host, dbc.user, dbc.passwd, dbc.database)
            self.crsr = self.con.cursor()
            self.crsr.execute(dbc.site_speed_table_fileds)
        except Exception as e:
            print(e)

    def process_item(self, item, spider):

        try:

            link_unique_id = item['link_unique_id']
            timestemp = datetime.now().strftime("%Y%m%d_%I%M %p")
            qry = "INSERT INTO "+dbc.site_speed_limited_table+" (backEndTime, firstPaint, firstVisualChange, DOMContentLoaded, _Load, speedIndex, visualComplete85, lastVisualChange, rumSpeedIndex, link_unique_id, timestamp) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            self.crsr.execute(
                qry,
                (item['backEndTime'],
                item['firstPaint'],
                item['firstVisualChange'],
                item['DOMContentLoaded'],
                item['_Load'],
                item['speedIndex'],
                item['visualComplete85'],
                item['lastVisualChange'],
                item['rumSpeedIndex'],
                link_unique_id,
                timestemp)
            )
            self.con.commit()
        except Exception as e:
            print(e)
        return item
