<%--
  Created by IntelliJ IDEA.
  User: Huawei
  Date: 2020/5/17
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<html>
<head>
    <title>code</title>
</head>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
<body>

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

<div>
    <div style="margin-left: 50px">
        <div style="font-size: 36px;font-family: Arial">${code.title}</div>
        <div style="" class="info_block">
            <div style="padding-right: 15px">${code.lang}</div>
            <div>
                <script>
                    var time = '${code.scrapy_time}';
                    var format_time = time_format(time);
                    document.write(format_time);
                </script>
            </div>
            <br>
            <br>
    </div>

    </div>
    <div class="well" style="width:800px;background: #999999;margin-left: 50px">
            <pre style="font-size: 18px;font-family: Arial" class="prettyprint">
                <div style="margin-left: 50px">
                    ${code.content}
                </div>

            </pre>
    </div>


</div>
</body>
</html>
