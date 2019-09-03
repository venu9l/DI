# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class LinkExtractorItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()

    parent_unique_id = scrapy.Field()
    link_unique_id = scrapy.Field()
    request_url = scrapy.Field()
    response_url = scrapy.Field()
    status_code = scrapy.Field()
    html_content = scrapy.Field()


    pass
