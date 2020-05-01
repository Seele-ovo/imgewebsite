
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>>
<!DOCTYPE html>
<html>
<head>
    <title>Single</title>
    <link href="/myapp/statics/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="/myapp/statics/css/styles.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/myapp/statics/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- Custom Theme files -->
    <script src="/myapp/statics/js/jquery-2.1.1.js"></script>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Metushi Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
<%@include file="include/head.jsp"%>
<div class="content">
    <div class="container">
        <div class="single">
            <!-- head-section -->
            <div class="head-section text-center">
                <h2>${result.data.get(0).imgname}</h2>
                <span> </span>
            </div>
            <c:if test="${result.listImg != null }">
                <c:forEach items="${result.listImg}" var="img">
                    <div class="single-top">
                        <img  src="/myapp/statics/images/leaflet/${img}" alt="sssss"/>
                    </div>
                </c:forEach>
            </c:if>
            <!-- /head-section -->
            <c:if test="${result.listImg == null }">
                <div class="single-top">
                    <img  src="/myapp/statics/images/leaflet/${result.data.get(0).imgaderess}" alt=""  class="img-thumbnail img-responsive"/>
                </div>

            </c:if>

        </div>
    </div>
</div>
</div>
</div>
<div class="footer">
    <div class="footer-bottom">
        <div class="container">
            <div class="copyrights">
            </div>
        </div>
    </div>
</div>
</body>
</html>