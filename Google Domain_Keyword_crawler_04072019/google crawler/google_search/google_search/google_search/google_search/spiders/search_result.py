# -*- coding: utf-8 -*-
import hashlib
import os
from fake_useragent import UserAgent
import scrapy
from google_search.items import GoogleSearchItem_Master,GoogleSearchItem_MainLinks,GoogleSearchItem_ReviewLinks,GoogleSearchItem_PeopleAlsoAsk,GoogleSearchItem_LocalPack,GoogleSearchItem_TopStory,GoogleSearchItem_KnowledgeCard,GoogleSearchItem_FeaturedSnippet,GooglesearchItem_TwitterResult,GoogleSearchitem_ImagePack,GoogleSearch_VideoPack
from google_search.extraction_methods import ExtractionClass
class SearchResultSpider(scrapy.Spider):
    name = 'search_result'
    allowed_domains = ['www.google.com']
    #start_urls = ['http://www.google.com/']
    def start_requests(self):
        try:
            with open('Keywords.txt','r') as f:
                keywords = f.read()
                keywords = keywords.split('\n')
                f.close()
        except Exception as e:
            print(e)

        for keyword in keywords:
            url = 'https://www.google.com/search?q=' + str(keyword.replace(' ','+')) + '&num=30'
            ua = UserAgent()
            header = {"User-Agent": ua.chrome}
            yield scrapy.FormRequest(url=str(url),callback=self.parse,headers=header,meta={'Search_term':keyword,'handle_httpstatus_list': [302],'dont_redirect':True})
    def parse(self, response):
        position = 0
        Search_term = response.meta['Search_term']
        URL = str(response.url).replace('&num=30', '')
        try:
            body = response.body
            body = body.replace(b'\\x3c',b'<').replace(b'\\x3e',b'>')
            body = body.replace(b'\\x3d',b'=')
            body = body.replace(b'\\x22',b'"')
            body = body.replace(b'\\x26amp;',b'&')

            item_master = GoogleSearchItem_Master()
            item_master['Search_term'] = Search_term.strip()
            SearchtermNumber = int(hashlib.md5(bytes(Search_term.strip(), "utf8")).hexdigest(), 16) % (10 ** 15)
            item_master['SearchtermNumber'] = SearchtermNumber
            yield item_master

            complimetry_card = response.xpath('//*[@id="rhs_block"]/h1/text()').extract_first()
            if complimetry_card:
                Result_Type = 'Knowledge Card'
                Position = 0
                CardTitle = response.xpath('//*[@data-attrid="title"]/span/text()').extract_first(default='')
                if not CardTitle:
                    CardTitle = response.xpath('//*[@class="DRolee"]/text()').extract_first(default='')
                    Title = response.xpath('//*[@class="ZV5O1c"]/text()').extract_first(default='')
                    Links = response.xpath('//*[@class="ZV5O1c"]/@href').extract_first(default='')
                    Image = '|'.join(response.xpath('//img[contains(@alt,"Image of")]/@src').extract())
                    Description = ''.join(response.xpath('//*[@data-hveid="CCEQDQ"]//text()').extract())
                else:
                    Title = response.xpath('//*[@data-attrid="title"]/span/text()').extract_first(default='')
                    Description = response.xpath('//h3[contains(text(),"Description")]/..//span/text()').extract_first(default='')
                    if response.xpath('//h3[contains(text(),"Description")]/..//span//a/text()').extract_first():
                        Links = response.xpath('//h3[contains(text(),"Description")]/..//span//a/@href').extract_first(default='')
                    else:
                        Links = response.xpath('//*[@data-attrid="visit_official_site"]/@href').extract_first(default='')
                    Image = '|'.join(response.xpath('//img[contains(@alt,"Image result for")]/@src').extract())
                    knowledgecard_number = int(hashlib.md5(bytes(Title + Search_term, "utf8")).hexdigest(), 16) % (10 ** 15)

                item = GoogleSearchItem_KnowledgeCard()
                item['SearchtermNumber'] = SearchtermNumber
                item['knowledgecard_number'] = knowledgecard_number
                item['Search_term'] = Search_term
                item['Result_Type'] = Result_Type
                item['URL'] = URL
                item['Title'] = Title
                item['Links'] = Links
                item['Description'] = Description
                item['Images'] = Image
                item['CardTitle'] = CardTitle
                item['Position'] = Position
                item['Page_Special_Data'] = "False"
                yield item


            SERPs = response.xpath('//*[@id="ires"]/div/div')
            for serp in SERPs:
                try:
                    serp_type = serp.xpath('.//h2/text()').extract_first()
                    if not serp_type:
                        serp_type = serp.xpath('.//h3/text()').extract_first()
                    if 'Web results' in serp_type:
                        links_div = serp.xpath('./div/div')
                    else:
                        links_div = serp.xpath('./div')
                    for div in links_div:
                        position += 1
                        if serp_type:
                            fun_name = serp_type.replace(' ', '_')
                            items = getattr(globals()['ExtractionClass'](), fun_name)(div,str(position),Search_term,SearchtermNumber,URL,body)
                            for item in items:
                                for i in items[item]:
                                    yield i
                        else:
                            items = getattr(globals()['ExtractionClass'](), 'ImagePack')(div,str(position),Search_term,SearchtermNumber,URL,body)
                            for item in items:
                                for i in items[item]:
                                    yield i
                except Exception as e:
                    print(e)

        except Exception as e:
            print(e)

from scrapy.cmdline import execute
execute("scrapy crawl search_result".split())