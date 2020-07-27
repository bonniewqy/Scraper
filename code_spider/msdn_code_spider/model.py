from peewee import *
import datetime
# db = MySQLDatabase("这里改成你自己的数据库名", host="127.0.0.1", port=3306, user="root", password="这里改成你自己的mysql密码")
db = MySQLDatabase("msdn_spider", host="127.0.0.1", port=3306, user="root", password="qq1486008053")
class BaseModel(Model):
    class Meta:
        database = db

class Code(BaseModel):
    url = CharField()
    title = CharField()
    lang = CharField(max_length=20)
    code = TextField()
    scrapy_time = DateTimeField()

class Snippet(BaseModel):
    url = CharField()
    title = CharField()
    lang = CharField(max_length=20)
    content = TextField()
    scrapy_time = DateTimeField()

