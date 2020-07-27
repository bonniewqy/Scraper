<%--
  Created by IntelliJ IDEA.
  User: Huawei
  Date: 2020/5/17
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<html>
<head>
    <title>Search</title>
</head>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>

<script>
    $(function(){
        $("#search").click(function(){
            console.log("aaa");
            $("#loading").show();
            $(this).attr("disabled", "disabled");

            request_search();
        });

        function request_search() {
            var url_value = $("#url_input").val();
            console.log(url_value);
            $.ajax({
                url:"result_code",
                type:"POST",
                dataType:"text",
                data:{url:url_value},
                success:function (msg) {
                    console.log(msg);
                    $("#loading").hide();
                    window.location.href = "code_list";
                }
            })
        }
    });
</script>
<style>

    .loader {
        position: absolute;
        top: 50%;
        left: 40%;
        margin-left: 10%;
        transform: translate3d(-50%, -50%, 0);
    }
    .dot {
        margin: 0;
        width: 24px;
        height: 24px;
        background: #3ac;
        border-radius: 100%;
        display: inline-block;
        animation: slide 1s infinite;
    }
    .dot:nth-child(1) {
        animation-delay: 0.1s;
        background: #32aacc;
    }
    .dot:nth-child(2) {
        animation-delay: 0.2s;
        background: #64aacc;
    }
    .dot:nth-child(3) {
        animation-delay: 0.3s;
        background: #96aacc;
    }
    .dot:nth-child(4) {
        animation-delay: 0.4s;
        background: #c8aacc;
    }
    .dot:nth-child(5) {
        animation-delay: 0.5s;
        background: #faaacc;
    }
    @-moz-keyframes slide {
        0% {
            transform: scale(1);
        }
        50% {
            opacity: 0.3;
            transform: scale(2);
        }
        100% {
            transform: scale(1);
        }
    }
    @-webkit-keyframes slide {
        0% {
            transform: scale(1);
        }
        50% {
            opacity: 0.3;
            transform: scale(2);
        }
        100% {
            transform: scale(1);
        }
    }
    @-o-keyframes slide {
        0% {
            transform: scale(1);
        }
        50% {
            opacity: 0.3;
            transform: scale(2);
        }
        100% {
            transform: scale(1);
        }
    }
    @keyframes slide {
        0% {
            transform: scale(1);
        }
        50% {
            opacity: 0.3;
            transform: scale(2);
        }
        100% {
            transform: scale(1);
        }
    }


    div.searchDiv{
        width: 920px;
        margin: 300px auto;
        padding: 1px;
        height: 500px;
        display: block;
    }

    div.searchDiv div.search{
        background-color: #5e9fc4;
        width: 920px;
        padding: 1px;
        height: 40px;
        display: block;
    }
    div.icon-div{
        margin-left: 180px;
    }

    div.icon-div div{
        float: left;
    }
    div.searchDiv input{
        width: 800px;
        border: 1px solid transparent;
        height: 36px;
        margin: 1px;
        outline: none;
    }

    div.searchDiv button{
        width: 110px;
        border: 1px solid transparent;
        background-color: #5e9fc4;
        font-size: 20px;
        color: white;
        font-weight: bold;
    }
</style>
<body>
<div class="loader" id="loading" style="display: none">
    <div class="dot"></div>
    <div class="dot"></div>
    <div class="dot"></div>
    <div class="dot"></div>
    <div class="dot"></div>
</div>
<div class="searchDiv">
    <div class="icon-div">
        <span style="height: 80px;margin-bottom: 40px"><img style="margin-bottom: 40px" width="72px" height="72px" src="img/cheese.png"></span>
        <span style="font-family: Arial;font-size: 64px;color: #5bc0de;margin-bottom: 2px">CODE SEARCH</span>
    </div>
    <div class="search">
        <input id ="url_input" type="text" name="keyword">
        <button id = "search" class="searchButton" type="submit">search</button>
    </div>
</div>
</body>
</html>
