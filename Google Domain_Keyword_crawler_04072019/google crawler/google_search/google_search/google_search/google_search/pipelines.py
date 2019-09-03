# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import pymysql
from google_search import database_config as dbc
from google_search.items import GoogleSearchItem_Master,GoogleSearchItem_MainLinks,GoogleSearchItem_ReviewLinks,GoogleSearchItem_PeopleAlsoAsk,GoogleSearchItem_LocalPack,GoogleSearchItem_TopStory,GoogleSearchItem_KnowledgeCard,GoogleSearchItem_FeaturedSnippet,GooglesearchItem_TwitterResult,GoogleSearchitem_ImagePack,GoogleSearch_VideoPack

class GoogleSearchPipeline(object):

    def __init__(self):
        try:
            con = pymysql.connect(dbc.host, dbc.usernm, dbc.passwd)
            con.cursor().execute("CREATE DATABASE IF NOT EXISTS %s;"%(dbc.database))
            con.close()
        except Exception as e:
            print(e)

        try:
            con = pymysql.connect(dbc.host, dbc.usernm, dbc.passwd, dbc.database)
            con.cursor().execute(dbc.create_master_table)
            con.cursor().execute(dbc.create_mainlink_table)
            con.cursor().execute(dbc.create_reviewlink_table)
            con.cursor().execute(dbc.create_peoplealsoask_table)
            con.cursor().execute(dbc.create_localpack_table)
            con.cursor().execute(dbc.create_topstory_table)
            con.cursor().execute(dbc.create_knowledgecard_table)
            con.cursor().execute(dbc.create_featuresnippet_table)
            con.cursor().execute(dbc.create_twitterResult_table)
            con.cursor().execute(dbc.create_imagepack_table)
            con.cursor().execute(dbc.create_videopack_table)
            con.cursor().execute(dbc.alt_table)
            con.cursor().execute(dbc.alt_table2)
            con.cursor().execute(dbc.alt_table3)
            con.cursor().execute(dbc.alt_table4)
            con.cursor().execute(dbc.alt_table5)
            con.cursor().execute(dbc.alt_table6)
            con.cursor().execute(dbc.alt_table7)
            con.cursor().execute(dbc.alt_table8)
            con.cursor().execute(dbc.alt_table9)
            con.cursor().execute(dbc.alt_table10)
        except Exception as e:
            print(e)

    def process_item(self, item, spider):
        con = pymysql.connect(dbc.host, dbc.usernm, dbc.passwd, dbc.database)
        con.commit()

        try:

            if isinstance(item, GoogleSearchItem_Master):
                qry = "INSERT INTO Master_Table (SearchtermNumber, Search_term) values (%s, %s)"
                con.cursor().execute(qry,(item['SearchtermNumber'],item['Search_term']))
                con.commit()
                print('Search_term Inserted..')

            if isinstance(item, GoogleSearchItem_MainLinks):
                qry = "INSERT INTO Mainlinks_Table (SearchtermNumber, MainlinkNumber, Search_term, Result_Type, URL, Title, Links, Description, Tags, Position, Page_Special_Data) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                con.cursor().execute(qry,(item['SearchtermNumber'],item['MainlinkNumber'],item['Search_term'],item['Result_Type'],item['URL'],item['Title'],item['Links'],item['Description'],item['Tags'],item['Position'],item['Page_Special_Data']))
                con.commit()
                print('Search_Links Inserted..')

            if isinstance(item, GoogleSearchItem_ReviewLinks):
                qry = "INSERT INTO reviewlink_Table (SearchtermNumber, ReviewNumber, MainlinkNumber, Search_term, Result_Type, URL, Title, Links, Rating, Review_Count, Page_Special_Data) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                con.cursor().execute(qry, (item['SearchtermNumber'],item['ReviewNumber'],item['MainlinkNumber'],item['Search_term'],item['Result_Type'],item['URL'],item['Title'],item['Links'],item['Rating'],item['Review_Count'],item['Page_Special_Data']))
                con.commit()
                print("Review Inserted...")

            if isinstance(item, GoogleSearchItem_PeopleAlsoAsk):
                qry = "INSERT INTO peoplealsoask_Table (SearchtermNumber, QuestionNumber, Search_term, Result_Type, URL, Title, Special_Title, Links, Page_Description, Position, Page_Special_Data) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                con.cursor().execute(qry, (item['SearchtermNumber'], item['QuestionNumber'],item['Search_term'],item['Result_Type'], item['URL'], item['Title'], item['Special_Title'], item['Links'], item['Page_Description'], item['Position'],item['Page_Special_Data']))
                con.commit()
                print("Questions Inserted...")

            if isinstance(item, GoogleSearchItem_LocalPack):
                qry = "INSERT INTO localpack_Table (SearchtermNumber,LocalPackNumber,Search_term,Result_Type,URL,Images,Name,Website,Category,Rating,Review_Count,Address,Phone_Number,Position, Page_Special_Data) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                con.cursor().execute(qry, (item['SearchtermNumber'],item['LocalPackNumber'],item['Search_term'],item['Result_Type'],item['URL'],item['Images'],item['Name'],item['Website'],item['Category'],item['Rating'],item['Review_Count'],item['Address'],item['Phone_Number'],item['Position'],item['Page_Special_Data']))
                con.commit()
                print("LocalPack Inserted...")

            if isinstance(item, GoogleSearchItem_TopStory):
                qry = "INSERT INTO topstory_Table (SearchtermNumber, StoryNumber, Search_term, Result_Type, URL, Images, Title, Links, Category, Posted_Time, Position, Page_Special_Data) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                con.cursor().execute(qry, (item['SearchtermNumber'], item['StoryNumber'], item['Search_term'], item['Result_Type'], item['URL'], item['Images'], item['Title'], item['Links'], item['Category'], item['PostedTime'], item['Position'],item['Page_Special_Data']))
                con.commit()
                print("Top Story Inserted...")

            if isinstance(item, GoogleSearchItem_KnowledgeCard):
                qry = "INSERT INTO knowledgecard_Table (SearchtermNumber, knowledgecard_number, Search_term, Result_Type, URL, Title, Links, Description, Images, CardTitle, Position, Page_Special_Data) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                con.cursor().execute(qry, (item['SearchtermNumber'], item['knowledgecard_number'], item['Search_term'], item['Result_Type'], item['URL'],item['Title'], item['Links'], item['Description'], item['Images'], item['CardTitle'], item['Position'],item['Page_Special_Data']))
                con.commit()
                print('KnowledgeCard Inserted..')

            if isinstance(item, GoogleSearchItem_FeaturedSnippet):
                qry = "INSERT INTO featuresnippet_Table (SearchtermNumber, featuredsnippet_Number, Search_term, Result_Type, URL, Title, Links, Description, Images, CardTitle, Position, Page_Special_Data) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                con.cursor().execute(qry, (item['SearchtermNumber'], item['featuredsnippet_Number'], item['Search_term'], item['Result_Type'], item['URL'],item['Title'], item['Links'], item['Description'], item['Images'], item['CardTitle'], item['Position'],item['Page_Special_Data']))
                con.commit()
                print('Featured Snippet Inserted..')

            if isinstance(item, GooglesearchItem_TwitterResult):
                qry = "INSERT INTO twitterresult_Table (SearchtermNumber, TwitNumber, Search_term, Result_Type, URL, Title, Links, Twits, Posted_Time, Position, Page_Special_Data) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                con.cursor().execute(qry, (item['SearchtermNumber'], item['TwitNumber'], item['Search_term'], item['Result_Type'], item['URL'],item['Title'], item['Links'], item['Twits'], item['PostedTime'], item['Position'],item['Page_Special_Data']))
                con.commit()
                print('Twitt Inserted..')

            if isinstance(item, GoogleSearchitem_ImagePack):
                qry = "INSERT INTO imagepack_Table (SearchtermNumber, Search_term, Result_Type, URL, Images, Position, Page_Special_Data) values (%s, %s, %s, %s, %s, %s, %s)"
                con.cursor().execute(qry, (item['SearchtermNumber'], item['Search_term'], item['Result_Type'], item['URL'],item['Images'], item['Position'],item['Page_Special_Data']))
                con.commit()
                print('ImagePack Inserted..')

            if isinstance(item, GoogleSearch_VideoPack):
                qry = "INSERT INTO videopack_Table (SearchtermNumber, VideoNumber, Search_term, Result_Type, URL, Title, Links, WebsiteName, CompnayName, Posted_Time, Position, Page_Special_Data) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                con.cursor().execute(qry, (item['SearchtermNumber'], item['VideoNumber'], item['Search_term'], item['Result_Type'], item['URL'],item['Title'], item['Links'], item['WebsiteName'], item['CompnayName'], item['PostedTime'], item['Position'], item['Page_Special_Data']))
                con.commit()
                print('VideosPack Inserted..')

        except Exception as e:
            print(e)
        return item
