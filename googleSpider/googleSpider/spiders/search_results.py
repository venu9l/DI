import hashlib
import os
from fake_useragent import UserAgent
import scrapy
from urllib.parse import urlparse
from googleSpider.items import GooglespiderItem

class SearchResultSpider(scrapy.Spider):
    name = 'search_results'
    allowed_domains = ['www.google.com']

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
    	items = {}
    	position=1
    	Search_term = response.meta['Search_term']
    	res = response.css("div.srg .rc .r>a::attr(href)").extract()
    	for link in res:
    		link = link.replace(u"\u203a","/")
    		items['keyword'] = Search_term
    		items['position'] = position
    		items['link'] = link
    		parsed_uri = urlparse(link)
    		result = '{uri.scheme}://{uri.netloc}/'.format(uri=parsed_uri)
    		position = position + 1
    		items['domain'] = result
    		yield GooglespiderItem(items)
