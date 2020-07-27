package com.schmidtgan.code.pojo;

import java.util.Date;

public class Snippet {
    private int id;
    private String url;
    private String title;
    private String lang;
    private String content;
    private Date scrapy_time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getScrapy_time() {
        return scrapy_time;
    }

    public void setScrapy_time(Date scrapy_time) {
        this.scrapy_time = scrapy_time;
    }
}
