import datetime
import hashlib
import re
from scrapy.http import HtmlResponse
from google_search.items import GoogleSearchItem_Master,GoogleSearchItem_MainLinks,GoogleSearchItem_ReviewLinks,GoogleSearchItem_PeopleAlsoAsk,GoogleSearchItem_LocalPack,GoogleSearchItem_TopStory,GoogleSearchItem_KnowledgeCard,GoogleSearchItem_FeaturedSnippet,GooglesearchItem_TwitterResult,GoogleSearchitem_ImagePack,GoogleSearch_VideoPack
class ExtractionClass():
    def Web_results(self, div, Position, Search_term, SearchtermNumber, URL, body):
        try:
            return_item = {}
            list_item = []
            Result_Type = 'Organic Listing'
            Title = div.xpath('normalize-space(.//*[@class="LC20lb"]/text())').extract_first()
            Links = div.xpath('.//a/@href').extract_first()
            MainlinkNumber = int(hashlib.md5(bytes(Title + Links + Search_term, "utf8")).hexdigest(), 16) % (10 ** 15)
            description = ' '.join(div.xpath('.//*[@class="st"]//text()').extract())
            Tags = ''
            if 'class="osl"' in div.extract():
                Tags = ''
                tags = div.xpath('.//*[@class="osl"]/a')
                for tag in tags:
                    tag_name = tag.xpath('.//text()').extract_first()
                    tag_link = tag.xpath('.//@href').extract_first()
                    Tags += tag_name + ':' + tag_link + '|'
                while Tags.startswith('|'):
                    Tags = Tags[1:]
                while Tags.endswith('|'):
                    Tags = Tags[:-1]
                while Tags.startswith(':'):
                    Tags = Tags[1:]
                while Tags.endswith(':'):
                    Tags = Tags[:-1]
            item = GoogleSearchItem_MainLinks()
            item['SearchtermNumber'] = SearchtermNumber
            item['MainlinkNumber'] = MainlinkNumber
            item['Search_term'] = Search_term
            item['Result_Type'] = Result_Type
            item['URL'] = URL
            item['Title'] = Title
            item['Links'] = Links
            item['Description'] = description
            item['Tags'] = Tags
            item['Position'] = Position
            item['Page_Special_Data'] = "False"
            list_item.append(item)
            return_item['item'] = list_item

            if 'class="slp f"' in div.extract():
                review_list = []
                Result_Type = 'Organic Listing'
                rating_data = div.xpath('.//*[@class="slp f"]//text()').extract()
                for data in rating_data:
                    if 'Rating:' in data:
                        Rating = data.split('-')[0].strip().split(':')[-1].strip().split('/')[0]
                        Review_Count = data.split('-')[-1].strip().replace(',', '')
                        if re.search(r'(\d+)', Review_Count):
                            Review_Count = re.findall(r'(\d+)', Review_Count)[0]
                        else:
                            Review_Count = ''

                ReviewNumber = int(hashlib.md5(bytes(Title + Rating + Review_Count, "utf8")).hexdigest(), 16) % (
                            10 ** 15)
                item2 = GoogleSearchItem_ReviewLinks()
                item2['SearchtermNumber'] = SearchtermNumber
                item2['ReviewNumber'] = ReviewNumber
                item2['MainlinkNumber'] = MainlinkNumber
                item2['Search_term'] = Search_term
                item2['Title'] = Title
                item2['Links'] = Links
                item2['Rating'] = Rating
                item2['Review_Count'] = Review_Count
                item2['Page_Special_Data'] = "True"
                item2['Result_Type'] = Result_Type
                item2['URL'] = URL
                review_list.append(item2)
                return_item['item2'] = review_list

            return return_item
        except Exception as e:
            print('web Result:', e)

    # def Web_Result_with_Site_Links(self, div, Position, Search_term, SearchtermNumber, URL, body):
    #     return_item = {}
    #     list_item = []
    #     Result_Type = 'Organic Listing'
    #     Title = div.xpath('normalize-space(.//*[@class="LC20lb"]/text())').extract_first()
    #     Links = div.xpath('.//a/@href').extract_first()
    #     MainlinkNumber = int(hashlib.md5(bytes(Title + Links + Search_term, "utf8")).hexdigest(), 16) % (10 ** 15)
    #     description = ' '.join(div.xpath('.//*[@class="st"]//text()').extract())
    #     site_links =
    #     item = GoogleSearchItem_MainLinks()
    #     item['SearchtermNumber'] = SearchtermNumber
    #     item['MainlinkNumber'] = MainlinkNumber
    #     item['Search_term'] = Search_term
    #     item['Result_Type'] = Result_Type
    #     item['URL'] = URL
    #     item['Title'] = Title
    #     item['Links'] = Links
    #     item['Description'] = description
    #     item['Tags'] = Tags
    #     item['Position'] = Position
    #     item['Page_Special_Data'] = "False"
    #     list_item.append(item)
    #     return_item['item'] = list_item


    def Twitter_Results(self, div, Position, Search_term, SearchtermNumber, URL, body):
        try:
            return_item = {}
            Result_Type = 'Twitter Results'
            list_item = []
            index = 'A'
            Title = div.xpath('normalize-space(.//g-link/a/text())').extract_first(default='')
            Links = div.xpath('normalize-space(.//g-link/a/@href)').extract_first(default='')
            Twit_list = div.xpath('//*[@class="vwfsqc"]/div')
            for twit in Twit_list:
                position = Position + '-' + str(index)
                Twits = ''.join(twit.xpath('.//*[@class="xcQxib eadHV NdbWE YBEXSb"]//text()').extract())
                Twits = Twits.encode('ascii', 'ignore')
                if Twits:
                    Time = twit.xpath('.//*[@class="rmxqbe"]//text()').extract_first().split(' ')
                    if Time[1] == 'hours':
                        PostedTime = datetime.datetime.now() - datetime.timedelta(hours=int(Time[0]))
                    elif Time[1] == 'mins':
                        PostedTime = datetime.datetime.now() - datetime.timedelta(minutes=int(Time[0]))
                    else:
                        PostedTime = datetime.datetime.now() - datetime.timedelta(days=int(Time[0]))

                    TwitNumber = int(hashlib.md5(bytes(Title + str(Twits) + Search_term, "utf8")).hexdigest(), 16) % (
                                10 ** 15)
                    item7 = GooglesearchItem_TwitterResult()
                    item7['SearchtermNumber'] = SearchtermNumber
                    item7['TwitNumber'] = TwitNumber
                    item7['Search_term'] = Search_term
                    item7['Result_Type'] = Result_Type
                    item7['URL'] = URL
                    item7['Title'] = Title
                    item7['Links'] = Links
                    item7['Twits'] = Twits
                    item7['PostedTime'] = str(PostedTime)
                    item7['Position'] = position
                    item7['Page_Special_Data'] = "False"
                    index = chr(ord(index) + 1)
                    list_item.append(item7)
            return_item = {'item7': list_item}
            return return_item
        except Exception as e:
            print('Twitter Result:', e)

    def People_also_ask(self, div, Position, Search_term, SearchtermNumber, URL, body):
        try:
            return_item = {}
            data = re.findall(b'\(function\(\)\{window\.jsl\.dh\(\'(.*?)\'\)\;\}\)\(\)\;', body)
            del data[0]
            del data[0]
            list_item = []
            index = 'A'
            for d in data:
                position = str(Position) + '-' + str(index)
                d = re.sub(b'^(.*?)\'\,\'', b'', d)
                response = HtmlResponse(url='', body=d)
                Result_Type = 'People Also Ask'
                Questions = response.xpath('//*[@class="match-mod-horizontal-padding kcHZBe"]/a/text()').extract_first()
                if Questions:
                    QuestionNumber = int(hashlib.md5(bytes(Questions + Search_term, "utf8")).hexdigest(), 16) % (
                                10 ** 15)
                    Links = response.xpath('//cite/text()').extract_first()
                    Special_Title = response.xpath('//h3/text()').extract_first()
                    Page_Description = ''.join(response.xpath('//*[@class="e24Kjd"]//text()').extract())

                    item3 = GoogleSearchItem_PeopleAlsoAsk()
                    item3['SearchtermNumber'] = SearchtermNumber
                    item3['Search_term'] = Search_term
                    item3['Result_Type'] = Result_Type
                    item3['URL'] = URL
                    item3['Title'] = Questions
                    item3['QuestionNumber'] = QuestionNumber
                    item3['Links'] = Links
                    item3['Special_Title'] = Special_Title
                    item3['Page_Description'] = Page_Description
                    item3['Position'] = position
                    item3['Page_Special_Data'] = "False"
                    index = chr(ord(index) + 1)
                    list_item.append(item3)
            return_item = {'item3': list_item}
            return return_item
        except Exception as e:
            print('People_also_ask:', e)

    def Local_Results(self, div, Position, Search_term, SearchtermNumber, URL, body):
        try:
            return_item = {}
            Result_Type = 'Local Pack'
            map_image = div.xpath('//*[@id="lu_map"]/@src').extract_first(default='')
            if map_image:
                map_image = 'www.google.com/' + map_image
            company_data = div.xpath('//*[@class="ccBEnf"]/div')
            list_item = []
            index = 'A'
            for data in company_data:
                position = Position + '-' + str(index)
                item4 = GoogleSearchItem_LocalPack()
                name = data.xpath('.//*[@class="dbg0pd"]/span/text()').extract_first()
                website = data.xpath('.//*[@class="yYlJEf L48Cpd"]/@href').extract_first()
                category = \
                ''.join(data.xpath('.//*[@class="rllt__details lqhpac"]/div[1]/text()').extract()).split('·')[
                    -1].strip()
                rating = data.xpath('.//*[@class="rllt__details lqhpac"]/div[1]/span/text()').extract_first(default='')
                Review_Count = ''
                if rating:
                    Review_Count = \
                    ''.join(data.xpath('.//*[@class="rllt__details lqhpac"]/div[1]/text()').extract()).split('·')[
                        0].strip()
                    Review_Count = re.findall(r'(\d+)', Review_Count)[0]
                if not rating:
                    rating = 'No reviews'
                    Review_Count = ''

                Phone_number = data.xpath('.//*[@class="rllt__details lqhpac"]/div[2]/text()').extract_first()
                if not Phone_number:
                    Phone_number = data.xpath('.//*[@class="rllt__details lqhpac"]/div[2]/span/text()').extract_first(
                        default='')
                    Address = ''
                else:
                    Phone_number = Phone_number.split('·')[-1].strip()
                    Address = data.xpath('.//*[@class="rllt__details lqhpac"]/div[2]/span/text()').extract_first(
                        default='')

                LocalPackNumber = int(hashlib.md5(bytes(Address + Search_term, "utf8")).hexdigest(), 16) % (10 ** 15)

                item4['SearchtermNumber'] = SearchtermNumber
                item4['LocalPackNumber'] = LocalPackNumber
                item4['Search_term'] = Search_term
                item4['Result_Type'] = Result_Type
                item4['URL'] = URL
                item4['Images'] = map_image
                item4['Name'] = name
                item4['Website'] = website
                item4['Category'] = category
                item4['Rating'] = rating
                item4['Review_Count'] = Review_Count
                item4['Address'] = Address
                item4['Phone_Number'] = Phone_number
                item4['Position'] = position
                item4['Page_Special_Data'] = "False"
                index = chr(ord(index) + 1)
                list_item.append(item4)
            return_item = {'item4': list_item}
            return return_item
        except Exception as e:
            print('Local_Results:', e)

    def Top_stories(self, div, Position, Search_term, SearchtermNumber, URL, body):
        try:
            return_item = {}
            Result_Type = 'Top Stories'
            list_item = []
            index = 'A'
            stories = div.xpath('//*[@class="rSr7Wd"]/div')
            if len(stories) == 0:
                stories = div.xpath('//*[@class="qmv19b"]/div')
            for story in stories:
                position = Position + '-' + str(index)
                Image = story.xpath('.//g-img/img/@src|.//g-img/img/@data-src').extract_first(default='')
                if Image:
                    Title = story.xpath('.//*[@class="mRnBbe QgUve nDgy9d"]/text()|.//*[@class="nDgy9d"]/text()').extract_first(default='')
                    Links = story.xpath('.//a/@href').extract_first(default='')
                    Category = story.xpath('.//cite/text()|.//*[@class="wqg8ad"]/text()').extract_first(default='')
                    Time = story.xpath('.//*[@class="Z25Gce GJhQm"]/span//text()|.//*[@class="FGlSad"]/span//text()').extract_first(default='').split(' ')
                    if Time[1] == 'hours':
                        PostedTime = datetime.datetime.now() - datetime.timedelta(hours=int(Time[0]))
                    elif Time[1] == 'mins':
                        PostedTime = datetime.datetime.now() - datetime.timedelta(minutes=int(Time[0]))
                    else:
                        PostedTime = datetime.datetime.now() - datetime.timedelta(days=int(Time[0]))

                    StoryNumber = int(hashlib.md5(bytes(Title + Search_term, "utf8")).hexdigest(), 16) % (10 ** 15)

                    item5 = GoogleSearchItem_TopStory()
                    item5['SearchtermNumber'] = SearchtermNumber
                    item5['StoryNumber'] = StoryNumber
                    item5['Search_term'] = Search_term
                    item5['Result_Type'] = Result_Type
                    item5['URL'] = URL
                    item5['Images'] = Image
                    item5['Title'] = Title
                    item5['Links'] = Links
                    item5['Category'] = Category
                    item5['PostedTime'] = str(PostedTime)
                    item5['Position'] = position
                    item5['Page_Special_Data'] = "False"
                    index = chr(ord(index) + 1)
                    list_item.append(item5)
                return_item = {'item5': list_item}
            return return_item
        except Exception as e:
            print('Top_stories:', e)

    def Featured_snippet_from_the_web(self, div, Position, Search_term, SearchtermNumber, URL, body):
        try:
            return_item = {}
            Result_Type = 'Featured Snippet'
            list_item = []
            CardTitle = ''.join(div.xpath('.//*[@role="heading"]/b//text()').extract())
            Title = div.xpath('//*[@role="heading"]/text()').extract_first()
            if not Title:
                Title = div.xpath('normalize-space(.//*[@class="LC20lb"]/text())').extract_first()
            Links = div.xpath('.//cite/text()').extract_first()
            Description = ''.join(div.xpath('.//*[@class="X5LH0c"]//text()').extract())
            if not Description:
                Description = ''.join(div.xpath('.//*[@class="e24Kjd"]//text()').extract())
                if not Description:
                    Description = '|'.join(div.xpath('.//*[@class="i8Z77e"]//text()').extract())

            Image = div.xpath('.//g-img/img/@src').extract_first(default='')
            featuredsnippet_Number = int(hashlib.md5(bytes(Title + Links + Search_term, "utf8")).hexdigest(), 16) % (
                        10 ** 15)

            item6 = GoogleSearchItem_FeaturedSnippet()
            item6['SearchtermNumber'] = SearchtermNumber
            item6['featuredsnippet_Number'] = featuredsnippet_Number
            item6['Search_term'] = Search_term
            item6['Result_Type'] = Result_Type
            item6['URL'] = URL
            item6['Title'] = Title
            item6['Links'] = Links
            item6['Description'] = Description
            item6['Images'] = Image
            item6['CardTitle'] = CardTitle
            item6['Position'] = Position
            item6['Page_Special_Data'] = "False"
            list_item.append(item6)
            return_item = {'item6': list_item}
            return return_item
        except Exception as e:
            print('Featured Snippet:', e)

    def Videos(self, div, Position, Search_term, SearchtermNumber, URL, body):
        try:
            return_item = {}
            Result_Type = 'Videos'
            Videos = div.xpath('//*[@class="BFJZOc"]/div')
            list_item = []
            index = 'A'
            for video in Videos:
                position = Position + '-' + str(index)
                Title = video.xpath('.//*[@class="mB12kf JRhSae ZyAH8d nDgy9d"]/text()').extract_first(default='')
                if Title:
                    Links = video.xpath('.//a/@href').extract_first(default='')
                    WebsiteName = video.xpath('.//*[@class="zECGdd"]/span/text()').extract_first(default='')
                    Companyname = video.xpath('.//*[@class="zECGdd RgAZAc"]/text()').extract_first(default='')
                    PostedTime = video.xpath('.//*[@class="zECGdd"]/text()').extract_first(default='').replace('-',
                                                                                                               '').strip()
                    VideoNumber = int(hashlib.md5(bytes(Title + Search_term, "utf8")).hexdigest(), 16) % (10 ** 15)

                    item9 = GoogleSearch_VideoPack()
                    item9['SearchtermNumber'] = SearchtermNumber
                    item9['VideoNumber'] = VideoNumber
                    item9['Search_term'] = Search_term
                    item9['Result_Type'] = Result_Type
                    item9['URL'] = URL
                    item9['Title'] = Title
                    item9['Links'] = Links
                    item9['WebsiteName'] = WebsiteName
                    item9['CompnayName'] = Companyname
                    item9['PostedTime'] = str(PostedTime)
                    item9['Position'] = position
                    item9['Page_Special_Data'] = "False"
                    index = chr(ord(index) + 1)
                    list_item.append(item9)
            return_item = {'item9': list_item}
            return return_item
        except Exception as e:
            print('VideoPack:', e)

    def ImagePack(self, div, Position, Search_term, SearchtermNumber, URL, body):
        try:
            list_item = []
            return_item = {}
            Result_Type = 'Image Pack'
            Images = '|'.join(div.xpath('.//g-img/img/@src').extract())
            item8 = GoogleSearchitem_ImagePack()
            item8['SearchtermNumber'] = SearchtermNumber
            item8['Search_term'] = Search_term
            item8['Result_Type'] = Result_Type
            item8['URL'] = URL
            item8['Images'] = Images
            item8['Position'] = Position
            item8['Page_Special_Data'] = "False"
            list_item.append(item8)
            return_item = {'item7': list_item}
            return return_item
        except Exception as e:
            print('ImagePace:', e)