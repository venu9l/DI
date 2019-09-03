# -*- coding: utf-8 -*-
import re
import subprocess
import scrapy
import pymysql
from pprint import pprint
from w3lib.http import basic_auth_header
from sitespeed_limited import databaseconfig as dbc
from scrapy.http import HtmlResponse


class GetDetailsSpider(scrapy.Spider):

    name = 'get_details'
    allowed_domains = []
    start_urls = []
    proxy = False
    proxy_address = ""
    proxy_username = ""
    proxy_password = ""


    def start_requests(self):
        self.con = pymysql.connect(dbc.host, dbc.user, dbc.passwd, dbc.database)
        self.crsr = self.con.cursor()
        self.crsr.execute("SELECT link_unique_id, request_url from %s" % dbc.link_table)
        info = self.crsr.fetchall()

        for data in info:

            if self.proxy == True:

                yield scrapy.FormRequest(
                    url=data[1],
                    meta={
                        'link_id': data[0],
                        'proxy': self.proxy_address
                    },
                    headers={
                        "Proxy-Authorization": basic_auth_header(self.proxy_username, self.proxy_password)
                    }
                )
            else:
                yield scrapy.FormRequest(
                    url=data[1],
                    meta={
                        'link_id': data[0]
                    },
                )

    def parse(self, response):

        try:

            item = dict()
            item['link_unique_id'] = response.meta['link_id']

            proxy = "http://%s:%s@%s" % (self.proxy_username, self.proxy_password, self.proxy_address.replace("http://", ""))

            if self.proxy == True:
                cmd = 'docker run --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io:9.4.0 %s -n 1 --video false --proxy.http %s' % (response.url, proxy)
            else:
                cmd = 'docker run --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io:9.4.0 %s -n 1 --video false' % (response.url)

            proc = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

            all_data = proc.stdout.readlines()
            data = all_data[-2]

            item['backEndTime'] = re.findall(b"backEndTime:(.*?),", data)[0].strip()
            item['firstPaint'] = re.findall(b"firstPaint:(.*?),", data)[0].strip()
            item['firstVisualChange'] = re.findall(b"firstVisualChange:(.*?),", data)[0].strip()
            item['DOMContentLoaded'] = re.findall(b"DOMContentLoaded:(.*?),", data)[0].strip()
            item['_Load'] = re.findall(b"Load:(.*?),", data)[0].strip()
            item['speedIndex'] = re.findall(b"speedIndex:(.*?),", data)[0].strip()
            item['visualComplete85'] = re.findall(b"visualComplete85:(.*?),", data)[0].strip()
            item['lastVisualChange'] = re.findall(b"lastVisualChange:(.*?),", data)[0].strip()
            item['rumSpeedIndex'] = re.findall(b"rumSpeedIndex:(.*?)\n", data)[0].strip()
            yield item

        except Exception as e:
            print(e)

from scrapy.cmdline import execute
execute("scrapy crawl get_details".split())
