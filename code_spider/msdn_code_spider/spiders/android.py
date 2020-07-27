# -*- coding: utf-8 -*-
import scrapy

import sys
sys.path.append("..")
from scrapy import Spider
from scrapy.selector import Selector
from scrapy.http import Request
import re
from scrapy.cmdline import execute
import pandas as pd
import csv,codecs
import datetime

from peewee import *
import datetime
db = MySQLDatabase("msdn_spider", host="127.0.0.1", port=3306, user="root", password="qq1486008053")
class BaseModel(Model):
    class Meta:
        database = db


class Android(BaseModel):
    url = CharField()
    title = CharField()
    lang = CharField(max_length=20)
    content = TextField()
    scrapy_time = DateTimeField()
    domain = CharField()


class AndroidSpider(scrapy.Spider):
    name = 'android'
    input_file = "developer_android_com.csv"
    def start_requests(self):
        df = pd.read_csv(self.input_file, chunksize=10)
        for chunk in df:
            for url in chunk['Url']:
                try:
                    select =Android.get(Android.url == url)
                except:
                    yield Request(url=url,meta={"url":url},callback=self.parse)


    def parse(self, response):
        url = response.meta['url']
        f = open("url.txt", "a")
        f.write(url + "\n")
        sel = Selector(response)
        title = sel.xpath("//h1/text()").extract()
        print(title,url)
        if len(title)!=0:
            title=title[0]
            kotlin_block = sel.xpath("//pre[@class='prettyprint lang-kotlin']/text()")
            if len(kotlin_block) != 0:
                code = ""
                code_list = kotlin_block.extract()
                for item in code_list:
                    code+=item
                print(code_list)
                co = Android()
                co.url=url
                co.title=title
                co.lang="kotlin"
                co.content=code
                co.scrapy_time = datetime.datetime.now()
                co.domain = "android"
                co.save()


            java_block = sel.xpath("//pre[@class='prettyprint lang-java']/text()")
            if len(java_block) != 0:
                code_list = java_block.extract()
                code=""
                for item in code_list:
                    code+=item
                print(code_list)
                row = [url, title, "java", code]
                co = Android()
                co.url=url
                co.title=title
                co.lang="java"
                co.content=code
                co.scrapy_time = datetime.datetime.now()
                co.domain = "android"
                co.save()

            xml_block = sel.xpath("//pre[@class='prettyprint lang-xml']/text()")
            if len(xml_block) != 0:
                code_list = xml_block.extract()
                code=""
                for item in code_list:
                    code+=item
                print(code_list)
                co = Android()
                co.url=url
                co.title=title
                co.lang="xml"
                co.content=code
                co.scrapy_time = datetime.datetime.now()
                co.domain = "android"
                co.save()
            pre = sel.xpath("//pre[@translate='no']/text()")
            if len(pre) != 0:
                code_list = pre.extract()
                code=""
                for item in code_list:
                    code+=item
                print(code_list)
                row = [url, title, "pre_code", code]
                co = Android()
                co.url=url
                co.title=title
                co.lang="unknown language"
                co.content = code
                co.scrapy_time = datetime.datetime.now()
                co.domain="android"
                co.save()


if __name__ == "__main__":
    execute(["scrapy", "crawl", "android"])