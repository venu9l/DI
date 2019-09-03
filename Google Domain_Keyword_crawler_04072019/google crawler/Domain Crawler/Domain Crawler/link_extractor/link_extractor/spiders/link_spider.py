# -*- coding: utf-8 -*-
import hashlib
from datetime import datetime
from pprint import pprint
from link_extractor import databaseconfig as dbc
from scrapy.cmdline import execute
import pymysql
import scrapy
import tldextract
from link_extractor.items import LinkExtractorItem


class LinkSpiderSpider(scrapy.Spider):
    name = 'link_spider'
    allowed_domains = []
    start_urls = ['http://www.neemiit.com']
    page_visited = 0
    uniquelinks = set()

    def __init__(self, name=None, input="", **kwargs):
        super().__init__(name, **kwargs)
        self.start_urls.append(input)
        domain = tldextract.extract(self.start_urls[0])
        self.allowed_domains.append(str(domain.domain)+"."+str(domain.suffix))
        self.unique_id = int(hashlib.md5(bytes(input,"utf8")).hexdigest(), 16) % (10 ** 30)
        
        try:
            con = pymysql.connect(dbc.host, dbc.user, dbc.passwd)
            crsr = con.cursor().execute("CREATE DATABASE IF NOT EXISTS %s;" % dbc.database)
            con.close()
        except Exception as e:
            print(e)
            exit(0)

        try:
            self.con = pymysql.connect(dbc.host, dbc.user, dbc.passwd, dbc.database)
            self.crsr = self.con.cursor()
            self.crsr.execute(dbc.main_table_fields)
            self.crsr.execute(dbc.link_table_fileds)
        except Exception as e:
            print(e)
            exit(0)
        
        try:
            self.crsr.execute(dbc.alt_tbale)
        except Exception as e:
            pass

        try:
            self.crsr.execute("INSERT INTO " + dbc.main_table+" (unique_id, url, timestamp) values (%s, %s, %s)", (self.unique_id, input, datetime.now().strftime("%Y%m%d_%I%M %p")))
            self.con.commit()
        except Exception as e:
            print(e)

    def start_requests(self):
        yield scrapy.FormRequest(
            url=self.start_urls[0],
            callback=self.parse,
            meta={
                "unique_id": self.unique_id,
                "url": self.start_urls[0],
            }
        )

    def parse(self, response):

        self.page_visited = self.page_visited + 1
        self.uniquelinks.add(response.url)

        links = [response.urljoin(i) for i in response.xpath("//a/@href").extract()]
        for link in links:
            if self.allowed_domains[0] in link:
                unique_id = int(hashlib.md5(bytes(link, "utf8")).hexdigest(), 16) % (10 ** 30)
                yield scrapy.FormRequest(
                    url=link,
                    callback=self.parse,
                    meta={
                        "unique_id": unique_id,
                        "url": link,
                    }
                )

        item = LinkExtractorItem()
        item['link_unique_id'] = response.meta['unique_id']
        item['request_url'] = response.meta['url']
        item['response_url'] = response.url
        item['status_code'] = response.status
        item['html_content'] = response.body
        yield item

    def close(spider, reason):
        pprint(spider.uniquelinks)
        pprint("page Visited: %s" % spider.page_visited)

# execute("scrapy crawl link_spider -a input=https://www.valuepenguin.com".split())