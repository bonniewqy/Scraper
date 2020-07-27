# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy
from msdn_code_spider.model import Snippet,Code

class MsdnCodeSpiderItem(scrapy.Item):
    url = scrapy.Field()
    title = scrapy.Field()
    lang = scrapy.Field()
    content = scrapy.Field()
    scrapy_time = scrapy.Field()
    def save(self):
        code = Code()
        code.url = self['url']
        code.lang = self['lang']
        code.title = self['title']
        code.code = self['content']
        code.scrapy_time = self['scrapy_time']
        code.save()