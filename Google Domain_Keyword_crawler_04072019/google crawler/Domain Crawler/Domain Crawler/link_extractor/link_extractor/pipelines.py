# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
from datetime import datetime

import pymysql
from link_extractor import databaseconfig as dbc


class LinkExtractorPipeline(object):


    def __init__(self) -> None:
        super().__init__()

        print("in pipline ...")

        self.con = pymysql.connect(dbc.host, dbc.user, dbc.passwd, dbc.database, charset='utf8', init_command='SET NAMES UTF8')
        self.crsr = self.con.cursor()

    def process_item(self, item, spider):

        try:
            self.crsr.execute(
                "INSERT INTO "+dbc.link_table+" (parent_unique_id, link_unique_id, request_url, response_url, status_code, html_content, timestamp) values (%s, %s, %s, %s, %s, %s, %s)",
                (
                    spider.unique_id,
                    item['link_unique_id'],
                    item['request_url'],
                    item['response_url'],
                    item['status_code'],
                    item['html_content'],
                    datetime.now().strftime("%Y%m%d_%I%M %p")
                )
            )
            self.con.commit()
        except Exception as e:
            print(e)
        return item
