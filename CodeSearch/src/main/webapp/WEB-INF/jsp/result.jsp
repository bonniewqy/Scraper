<%--
  Created by IntelliJ IDEA.
  User: Huawei
  Date: 2020/5/17
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>result</title>
</head>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<style>
    div.search_result{
        margin-left: 24px;
        padding-top: 12px;

    }
    div.info_block div{
        font-size: 18px;
        font-family: Arial;
        float: left;
        color: #999;
    }
</style>
<script>
    function time_format(time) {
        var date = new Date(time);
        // var date = new Date(time* 1000);
        var year = date.getFullYear() + '-';
        var month = (date.getMonth()+1 < 10 ? '0' + (date.getMonth()+1) : date.getMonth()+1) + '-';
        var dates = date.getDate() + ' ';
        var hour = date.getHours() + ':';
        var min = date.getMinutes() + ':';
        var second = date.getSeconds();
        return year + month + dates + hour + min + second ;
    }
</script>
<body>
<c:forEach items="${cs}" var="c">
    <div class="search_result">
        <div style="font-size: 36px;font-family: Arial"><a href="/CodeSearch/code_content?id=${c.id}">${c.title}</a></div>
        <div style="font-size: 18px;color: #999999"><a style="color: #999999" href=${c.url}>${c.url}</a></div>
        <div class="info_block">
            <div style="padding-right: 15px">${c.lang}</div>
            <div>
                <script>
                    var time = '${c.scrapy_time}';
                    var format_time = time_format(time);
                    document.write(format_time);
                </script>
            </div>
        </div>
        <br>
    </div>
</c:forEach>
</body>
</html>
