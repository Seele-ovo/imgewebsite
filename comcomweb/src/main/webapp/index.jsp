<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Free Responsive Html5 Templates">
    <meta name="author" content="">
    <title>首页</title>
    <!-- Bootstrap Core CSS -->
    <link href="statics/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="statics/css/style.css">
    <link rel="stylesheet" type="text/css" href="statics/css/animate.min.css">
    <link href="statics/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>
<%@include file="template/include/head.jsp"%>
<header class="text-center" name="home">
    <div class="intro-text">
        <h1 class="wow fadeInDown">Welcome to <strong><span class="color">MyTravel</span></strong></h1>
        <p class="wow fadeInDown">a creative digital agency from New York</p>
    </div>
</header>

<div id="page-content" class="index-page">
    <section id="" class="box-content box-style text-center">
        <div class="container">
            <div class="row heading wow fadeInDown">
                <div class="col-lg-12">
                    <h2>Our <strong>Portfolio</strong></h2>
                    <hr>
                    <div class="clearfix"></div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diamcommodo nibh ante facilisis.</p>
                </div>
            </div>
            <div class="categories">
                <ul class="cat">
                    <li>
                        <ol class="type list-inline">
                            <li><a href="#" data-filter="*" class="active">所有</a></li>
                            <li><a href="#" data-filter=".dubai">Dubai</a></li>
                            <li><a href="#" data-filter=".maldives">Maldives</a></li>
                            <li><a href="#" data-filter=".sapa">SAPA</a></li>
                            <li><a href="#" data-filter=".paris">Paris</a></li>
                        </ol>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>

            <div class="row" >
                <div class="portfolio-items" id="addtemp">
                    <div class="col-sm-6 col-md-3 col-lg-3 paris">
                        <div class="portfolio-item wow fadeInUp" data-wow-delay="200ms">
                            <div class="hover-bg"> <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                                <div class="hover-text">
                                    <h4>Project Title</h4>
                                    Web Design
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i> </div>
                                <img src="statics/images/leaflet/75709101_p0.jpg" class="img-responsive" alt="Project Title"> </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 col-lg-3 paris">
                        <div class="portfolio-item wow fadeInUp" data-wow-delay="400ms">
                            <div class="hover-bg"> <a href="#portfolioModal2" class="portfolio-link" data-toggle="modal">
                                <div class="hover-text">
                                    <h4>Project Title</h4>
                                    App Development
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i> </div>
                                <img src="statics/images/leaflet/75807974_p0.png" class="img-responsive" alt="Project Title"> </a> </div>
                        </div>
                    </div>
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
                <img src="statics/images/thumbnail/{slt}" class="img-responsive" alt="Project Title"> </a> </div>
        </div>
    </div>

</div>


<%@include file="template/include/footer.jsp"%>
<script type="text/javascript" src="statics/js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="statics/js/bootstrap.min.js"></script>
<script type="text/javascript" src="statics/js/SmoothScroll.js"></script>
<script type="text/javascript" src="statics/js/wow.min.js"></script>
<script type="text/javascript" src="statics/js/jquery.isotope.js"></script>
<script type="text/javascript" src="statics/js/main.js"></script>
<script type="text/javascript">
        $.ajax({
            url: "/myapp/getimg/1",
            type: "POST",
            dataType: "json",
            success: function(data) {
                $.each(data.data.list,function(idx,obj){
                    createHtml(obj);
                })
            }
        });

    function createHtml(result) {
        var html = $("#temp").html();
        html = html.replace(/{img_id}/, result.imgnumbering);
        html = html.replace(/{title}/g, result.imgname);
        html = html.replace(/{jianjie}/, result.imgdescription);
        html = html.replace(/{slt}/g, result.imgthumbnail);
        $("#addtemp").append(html)
    }
</script>
</body>
</html>