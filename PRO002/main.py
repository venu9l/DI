import requests
from bs4 import BeautifulSoup
import store

url_list = list()
response = requests.get('http://www.neemiit.com/')
html = response.text
obj = BeautifulSoup(html,'lxml')
ao = store.WebCrawler(obj)
ao.Anchor()

def CrawlUrl(o):
    ct  = o.find_all('a')
    for c in ct:
        if c.has_attr("href"):
            if c.attrs["href"] != "/" and ((c.attrs["href"].startswith('http') or c.attrs["href"].startswith('//')) and  ("www.neemiit.com" in c.attrs["href"])) or (not c.attrs["href"].startswith('#') and not c.attrs["href"].startswith('http') and not c.attrs["href"].startswith('//')):
                url_list.append(c.attrs["href"])

CrawlUrl(obj)
