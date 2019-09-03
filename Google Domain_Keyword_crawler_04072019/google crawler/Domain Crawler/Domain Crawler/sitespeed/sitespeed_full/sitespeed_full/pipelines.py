# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import pymysql
from sitespeed_full import databaseconfig as dbc
from datetime import datetime


class SitespeedFullPipeline(object):


    def __init__(self) -> None:
        super().__init__()

        try:
            self.con = pymysql.connect(dbc.host, dbc.user, dbc.passwd, dbc.database)
            self.crsr = self.con.cursor()
            self.crsr.execute(dbc.site_speed_table_fileds)
        except Exception as e:
            print(e)

    def process_item(self, item, spider):

        try:

            link_unique_id = item['link_unique_id']
            timestemp = datetime.now().strftime("%Y%m%d_%I%M %p")
            qry = "INSERT INTO "+dbc.site_speed_table+" (overall_score, performance_score, accessibility_score, best_practice_score, fast_render_advice, avoid_scaling_images_advice, compress_assets_advice, optimal_css_size_advice, total_size__transfer, image_size__transfer, javascript_size__transfer, css_size__transfer, total_requests, image_requests, css_requests, javascript_requests, font_requests, _200_responses, domains_per_page, cache_time, time_since_last_modification, party_requests_1st, party_size_1st, rum_speed_index, first_paint, backend_time, frontend_time, page_load_time, first_visual_change, speed_index, perceptual_speed_index, visual_complete_85, visual_complete_95, visual_complete_99, last_visual_change, link_unique_id, timestamp) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            self.crsr.execute(
                qry,
                (item['overall_score'],
                item['performance_score'],
                item['accessibility_score'],
                item['best_practice_score'],
                item['fast_render_advice'],
                item['avoid_scaling_images_advice'],
                item['compress_assets_advice'],
                item['optimal_css_size_advice'],
                item['total_size__transfer'],
                item['image_size__transfer'],
                item['javascript_size__transfer'],
                item['css_size__transfer'],
                item['total_requests'],
                item['image_requests'],
                item['css_requests'],
                item['javascript_requests'],
                item['font_requests'],
                item['_200_responses'],
                item['domains_per_page'],
                item['cache_time'],
                item['time_since_last_modification'],
                item['party_requests_1st'],
                item['party_size_1st'],
                item['rum_speed_index'],
                item['first_paint'],
                item['backend_time'],
                item['frontend_time'],
                item['page_load_time'],
                item['first_visual_change'],
                item['speed_index'],
                item['perceptual_speed_index'],
                item['visual_complete_85'],
                item['visual_complete_95'],
                item['visual_complete_99'],
                item['last_visual_change'],
                link_unique_id,
                timestemp)
            )
            self.con.commit()
        except Exception as e:
            print(e)
        return item
