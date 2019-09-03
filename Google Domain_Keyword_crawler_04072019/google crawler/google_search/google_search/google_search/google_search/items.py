# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class GoogleSearchItem_Master(scrapy.Item):
    SearchtermNumber = scrapy.Field()
    Search_term = scrapy.Field()

class GoogleSearchItem_MainLinks(scrapy.Item):
    SearchtermNumber = scrapy.Field()
    MainlinkNumber = scrapy.Field()
    Search_term = scrapy.Field()
    Result_Type = scrapy.Field()
    URL = scrapy.Field()
    Title = scrapy.Field()
    Links = scrapy.Field()
    Description = scrapy.Field()
    Tags = scrapy.Field()
    Position = scrapy.Field()
    Page_Special_Data = scrapy.Field()

class GoogleSearchItem_ReviewLinks(scrapy.Item):
    SearchtermNumber = scrapy.Field()
    ReviewNumber = scrapy.Field()
    MainlinkNumber = scrapy.Field()
    Search_term = scrapy.Field()
    Result_Type = scrapy.Field()
    URL = scrapy.Field()
    Title = scrapy.Field()
    Links = scrapy.Field()
    Rating = scrapy.Field()
    Review_Count = scrapy.Field()
    Page_Special_Data = scrapy.Field()

class GoogleSearchItem_PeopleAlsoAsk(scrapy.Item):
    SearchtermNumber = scrapy.Field()
    QuestionNumber = scrapy.Field()
    Search_term = scrapy.Field()
    Result_Type = scrapy.Field()
    URL = scrapy.Field()
    Title = scrapy.Field()
    Links = scrapy.Field()
    Special_Title = scrapy.Field()
    Page_Description = scrapy.Field()
    Position = scrapy.Field()
    Page_Special_Data = scrapy.Field()

class GoogleSearchItem_LocalPack(scrapy.Item):
    SearchtermNumber = scrapy.Field()
    LocalPackNumber = scrapy.Field()
    Search_term = scrapy.Field()
    Result_Type = scrapy.Field()
    URL = scrapy.Field()
    Images = scrapy.Field()
    Name = scrapy.Field()
    Website = scrapy.Field()
    Category = scrapy.Field()
    Rating = scrapy.Field()
    Review_Count = scrapy.Field()
    Address = scrapy.Field()
    Phone_Number = scrapy.Field()
    Position = scrapy.Field()
    Page_Special_Data = scrapy.Field()

class GoogleSearchItem_TopStory(scrapy.Item):
    SearchtermNumber = scrapy.Field()
    StoryNumber = scrapy.Field()
    Search_term = scrapy.Field()
    Result_Type = scrapy.Field()
    URL = scrapy.Field()
    Images = scrapy.Field()
    Title = scrapy.Field()
    Links = scrapy.Field()
    Category = scrapy.Field()
    PostedTime = scrapy.Field()
    Position = scrapy.Field()
    Page_Special_Data = scrapy.Field()

class GoogleSearchItem_KnowledgeCard(scrapy.Item):
    SearchtermNumber = scrapy.Field()
    knowledgecard_number = scrapy.Field()
    Search_term = scrapy.Field()
    Result_Type = scrapy.Field()
    URL = scrapy.Field()
    Title = scrapy.Field()
    Links = scrapy.Field()
    Description = scrapy.Field()
    Images = scrapy.Field()
    CardTitle = scrapy.Field()
    Position = scrapy.Field()
    Page_Special_Data = scrapy.Field()

class GoogleSearchItem_FeaturedSnippet(scrapy.Item):
    SearchtermNumber = scrapy.Field()
    featuredsnippet_Number = scrapy.Field()
    Search_term = scrapy.Field()
    Result_Type = scrapy.Field()
    URL = scrapy.Field()
    Title = scrapy.Field()
    Links = scrapy.Field()
    Description = scrapy.Field()
    Images = scrapy.Field()
    CardTitle = scrapy.Field()
    Position = scrapy.Field()
    Page_Special_Data = scrapy.Field()

class GooglesearchItem_TwitterResult(scrapy.Item):
    SearchtermNumber = scrapy.Field()
    TwitNumber = scrapy.Field()
    Search_term = scrapy.Field()
    Result_Type = scrapy.Field()
    URL = scrapy.Field()
    Title = scrapy.Field()
    Links = scrapy.Field()
    Twits = scrapy.Field()
    PostedTime = scrapy.Field()
    Position = scrapy.Field()
    Page_Special_Data = scrapy.Field()

class GoogleSearchitem_ImagePack(scrapy.Item):
    SearchtermNumber = scrapy.Field()
    Search_term = scrapy.Field()
    Result_Type = scrapy.Field()
    URL = scrapy.Field()
    Images = scrapy.Field()
    Position = scrapy.Field()
    Page_Special_Data = scrapy.Field()

class GoogleSearch_VideoPack(scrapy.Item):
    SearchtermNumber = scrapy.Field()
    VideoNumber = scrapy.Field()
    Search_term = scrapy.Field()
    Result_Type = scrapy.Field()
    URL = scrapy.Field()
    Title = scrapy.Field()
    Links = scrapy.Field()
    WebsiteName = scrapy.Field()
    CompnayName = scrapy.Field()
    PostedTime = scrapy.Field()
    Position = scrapy.Field()
    Page_Special_Data = scrapy.Field()


