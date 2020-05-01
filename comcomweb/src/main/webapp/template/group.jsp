
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Free Responsive Html5 Templates">
    <meta name="author" content="">
    <title>组图</title>
    <link href="/myapp/statics/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/myapp/statics/css/style.css">
    <link rel="stylesheet" type="text/css" href="/myapp/statics/css/animate.min.css">
    <link href="/myapp/statics/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>
<%@include file="include/head.jsp"%>
<div id="page-content" class="index-page">
    <section id="" class="box-content box-style text-center">
        <div class="container">
            <div class="row" >
                ${result.data.getList().get(0).getImgname()}
                <div class="portfolio-items" id="addtemp">

                    <c:forEach var="data" items="${result.data.getList()}">
                        <div class="col-sm-6 col-md-3 col-lg-3 paris">
                            <div class="portfolio-item wow fadeInUp" data-wow-delay="200ms">
                                <div class="hover-bg"> <a href="/myapp/vis/${data.getImgnumbering()}" class="portfolio-link" data-toggle="modal">
                                    <div class="hover-text">
                                        <h4>${data.getImgname()}</h4>
                                            ${data.getImgdescription()}
                                        <div class="clearfix"></div>
                                        <i class="fa fa-plus"></i> </div>
                                    <img src="statics/images/thumbnail/${data.getImgthumbnail()}" class="img-responsive" alt="Project Title"> </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- 模板 -->

<div style="display: none" id="temp">

    <div class="col-sm-6 col-md-3 col-lg-3 paris">
        <div class="portfolio-item wow fadeInUp" data-wow-delay="400ms">
            <div class="hover-bg"> <a href="/myapp/vis/{img_id}" class="portfolio-link" data-toggle="modal">
                <div class="hover-text">
                    <h4>{title}</h4>
                    {jianjie}
                    <div class="clearfix"></div>
                    <i class="fa fa-plus"></i> </div>
                <img src="statics/images/leaflet/{slt}" class="img-responsive" alt="Project Title"> </a> </div>
        </div>
    </div>

</div>


<%@include file="include/footer.jsp"%>
<script type="text/javascript" src="/myapp/statics/js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="/myapp/statics/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/myapp/statics/js/SmoothScroll.js"></script>
<script type="text/javascript" src="/myapp/statics/js/wow.min.js"></script>
<script type="text/javascript" src="/myapp/statics/js/jquery.isotope.js"></script>
<script type="text/javascript" src="/myapp/statics/js/main.js"></script>
</body>
</html>