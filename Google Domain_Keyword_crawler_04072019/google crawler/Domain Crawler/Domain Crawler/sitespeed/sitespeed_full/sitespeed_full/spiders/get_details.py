# -*- coding: utf-8 -*-
import subprocess
import scrapy
import pymysql
from pprint import pprint
from w3lib.http import basic_auth_header
from sitespeed_full import databaseconfig as dbc
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
            break

    def parse(self, response):

        item = dict()
        item['link_unique_id'] = response.meta['link_id']

        proxy = "http://%s:%s@%s" % (self.proxy_username, self.proxy_password, self.proxy_address.replace("http://", ""))

        if self.proxy == True:
            cmd = 'docker run --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io:9.4.0 %s -n 1 --video false --proxy.http %s' % (response.url, proxy)
        else:
            cmd = 'docker run --rm -v ${pwd}:/sitespeed.io sitespeedio/sitespeed.io:9.4.0 %s -n 1 --video false' % (response.url)
        print(cmd)
        proc = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        all_data = proc.stdout.readlines()
        print(all_data)
        data = all_data[-1]
        filepath = data.split(b"HTML stored in ")[1].replace(b"\n", b"").replace(b"/sitespeed.io/", b"")
        f = open(b'%s/index.html' % filepath, "rb")
        response = HtmlResponse(url=response.url, body=f.read().replace(b"&nbsp;", b""))
        f.close()

        item['overall_score'] = response.xpath('//*[contains(text(), "Overall score")]/div/text()').extract_first(default="")
        item['performance_score'] = response.xpath('//*[contains(text(), "Performance score")]/div/text()').extract_first(default="")
        item['accessibility_score'] = response.xpath('//*[contains(text(), "Accessibility score")]/div/text()').extract_first(default="")
        item['best_practice_score'] = response.xpath('//*[contains(text(), "Best Practice score")]/div/text()').extract_first(default="")
        item['fast_render_advice'] = response.xpath('//*[contains(text(), "Fast Render advice")]/div/text()').extract_first(default="")
        item['avoid_scaling_images_advice'] = response.xpath('//*[contains(text(), "Avoid scaling images advice")]/div/text()').extract_first(default="")
        item['compress_assets_advice'] = response.xpath('//*[contains(text(), "Compress assets advice")]/div/text()').extract_first(default="")
        item['optimal_css_size_advice'] = response.xpath('//*[contains(text(), "Optimal CSS size advice")]/div/text()').extract_first(default="")
        item['total_size__transfer'] = response.xpath('//*[contains(text(), "Total size (transfer)")]/div/text()').extract_first(default="")
        item['image_size__transfer'] = response.xpath('//*[contains(text(), "Image size (transfer)")]/div/text()').extract_first(default="")
        item['javascript_size__transfer'] = response.xpath('//*[contains(text(), "Javascript size (transfer)")]/div/text()').extract_first(default="")
        item['css_size__transfer'] = response.xpath('//*[contains(text(), "CSS size (transfer)")]/div/text()').extract_first(default="")
        item['total_requests'] = response.xpath('//*[contains(text(), "Total requests")]/div/text()').extract_first(default="")
        item['image_requests'] = response.xpath('//*[contains(text(), "Image requests")]/div/text()').extract_first(default="")
        item['css_requests'] = response.xpath('//*[contains(text(), "CSS requests")]/div/text()').extract_first(default="")
        item['javascript_requests'] = response.xpath('//*[contains(text(), "Javascript requests")]/div/text()').extract_first(default="")
        item['font_requests'] = response.xpath('//*[contains(text(), "Font requests")]/div/text()').extract_first(default="")
        item['_200_responses'] = response.xpath('//*[contains(text(), "200 responses")]/div/text()').extract_first(default="")
        item['domains_per_page'] = response.xpath('//*[contains(text(), "Domains per page")]/div/text()').extract_first(default="")
        item['cache_time'] = response.xpath('//*[contains(text(), "Cache time")]/div/text()').extract_first(default="")
        item['time_since_last_modification'] = response.xpath('//*[contains(text(), "Time since last modification")]/div/text()').extract_first(default="")
        item['party_requests_1st'] = response.xpath('//*[contains(text(), "1st party requests")]/div/text()').extract_first(default="")
        item['party_size_1st'] = response.xpath('//*[contains(text(), "1st party size")]/div/text()').extract_first(default="")
        item['rum_speed_index'] = response.xpath('//*[contains(text(), "RUM Speed Index")]/div/text()').extract_first(default="")
        item['first_paint'] = response.xpath('//*[contains(text(), "First Paint")]/div/text()').extract_first(default="")
        item['backend_time'] = response.xpath('//*[contains(text(), "Backend Time")]/div/text()').extract_first(default="")
        item['frontend_time'] = response.xpath('//*[contains(text(), "Frontend Time")]/div/text()').extract_first(default="")
        item['page_load_time'] = response.xpath('//*[contains(text(), "Page Load Time")]/div/text()').extract_first(default="")
        item['first_visual_change'] = response.xpath('//*[contains(text(), "First Visual Change")]/div/text()').extract_first(default="")
        item['speed_index'] = response.xpath('//*[contains(text(), "Speed Index")]/div/text()').extract_first(default="")
        item['perceptual_speed_index'] = response.xpath('//*[contains(text(), "Perceptual Speed Index")]/div/text()').extract_first(default="")
        item['visual_complete_85'] = response.xpath('//*[contains(text(), "Visual Complete 85%")]/div/text()').extract_first(default="")
        item['visual_complete_95'] = response.xpath('//*[contains(text(), "Visual Complete 95%")]/div/text()').extract_first(default="")
        item['visual_complete_99'] = response.xpath('//*[contains(text(), "Visual Complete 99%")]/div/text()').extract_first(default="")
        item['last_visual_change'] = response.xpath('//*[contains(text(), "Last Visual Change")]/div/text()').extract_first(default="")

        yield item

from scrapy.cmdline import execute
execute("scrapy crawl get_details".split())
