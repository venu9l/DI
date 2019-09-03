# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html

import sys
import hashlib
from scrapy.exceptions import DropItem
from scrapy.http import Request
import pymysql;

class GooglespiderPipeline(object):
    def process_item(self, item, spider):
        con = pymysql.connect('10.0.75.1','root','','test')
        con.commit()
        qry = """INSERT INTO searchresults (keyword, domain, link, position) values (%s, %s, %s, %s);"""
        con.cursor().execute(qry,(item['keyword'],item['domain'],item['link'],item['position']))
        con.commit()
        return item