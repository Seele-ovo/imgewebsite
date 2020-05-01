<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-04-11
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <title>table模块快速使用</title>
    <link rel="stylesheet" href="/myapp/statics/layui/css/layui.css?t=2" media="all">
    <link rel="stylesheet" href="/myapp/statics/css/common.css?t=2" media="all">
    <link href="/myapp/statics/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/myapp/statics/css/FraUpload.css">
</head>
<style type="text/css" id="LAY_layadmin_theme"></style>
<body>
<div id="LAY_WRAP">
    <div id='LAY_app' class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <div class="layui-logo" lay-href=""> <span>layuiAdmin Pro</span> </div>
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-left layui-nav-tree" lay-filter="layui-nav-left">
                <li class="layui-nav-item">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-face-smile"></i> <cite >导航1</cite></a>
                    <dl class="layui-nav-child"  style="display: none;">
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-face-smile"></i> <cite >导航2</cite></a>
                    <dl class="layui-nav-child" style="display: none;">
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <!--主体-->
    <div class="layui-body" id="LAY_app_body">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left" lay-filter="layadmin-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect="">
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect="">
                    <a href="javascript:;" layadmin-event="refresh" title="刷新">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect=""> </li>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right" style="display: none">
                <li class="layui-nav-item layui-hide-xs" lay-unselect="">

                </li>
                <li class="layui-nav-item" lay-unselect="">
                    <a href="javascript:;"> <span>Choutest</span> <span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd><a lay-href="set/user/info">基本资料</a></dd>
                        <dd><a lay-href="set/user/password">修改密码</a></dd>
                        <hr>
                        <dd layadmin-event="logout" style="text-align: center;"><a>退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">


                    </div>
                </div>
                <div class="layui-col-md12"> </div>
            </div>
        </div>
        <!-- Large modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large modal</button>

        <table class="table table-hover">
            <thead>

            <tr>
                <th>id</th>
                <th>图片标题</th>
                <th>是否是组图</th>
                <th>图片具体名称</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="dome" items="${result.data}">
                <tr>
                    <th scope="row">${dome.idimg}</th>
                    <td>${dome.imgname}</td>
                    <td>${dome.imggroup}</td>
                    <td>${dome.imgdescription}</td>
                    <td><a href="/myapp/getdata/${dome.imgnumbering}" class="btn btn-default glyphicon glyphicon-cog"></a>&nbsp;&nbsp;<a href="222" class="btn btn-default glyphicon glyphicon-trash"></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!--模态框-->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <form  method="post" enctype="multipart/form-data" id="forms" action="/myapp/upload">
                        <div class="form-group">
                            <label for="exampleInputPassword1">图片标题</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" name="imgname">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">图片类型</label>
                            <select class="form-control" name="imgType">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">是否同组</label>
                            <label class="radio-inline">
                                <input type="radio" name="imggroup" id="inlineRadio1" value="0"> 单张
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="imggroup" id="inlineRadio2" value="1"> 同组
                            </label>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">描述</label>
                            <textarea class="form-control" rows="3" name="imgdescription"></textarea>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">标签</label>
                            <textarea class="form-control" rows="3" name="imglabel"></textarea>
                        </div>


                        <div class="form-group">
                            <label for="exampleInputPassword1">作者</label>
                            <input type="text" class="form-control" id="" placeholder="Password" name="imgauthor">
                        </div>


                        <div class="form-group">
                            <span id="upload_duixiang">上传</span><!-- 上传按钮 -->
                            <input type="hidden" id="imagepath">  <!-- 保存的图片id 用于表单提交 -->
                            <div class="show"></div> <!-- 输出图片 -->
                        </div>
                    </form>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="submits()">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--辅助作用一般用于手机遮罩层-->
<div class="layui-layer-shade mobilenav" id="mobilenav" onClick="clearmobilenav()" style="z-index: 998; background-color: rgb(0, 0, 0); opacity: 0.3;display:none"></div>
</body>
<script type="text/javascript" src="/myapp/statics/js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="/myapp/statics/layui/layui.js?t=2"></script>
<script type="text/javascript" src="/myapp/statics/js/common.js?t=2"></script>
<script type="text/javascript" src="/myapp/statics/js/bootstrap.min.js"></script>
<script src="/myapp/statics/js/Sortable.js"></script>
<script type="text/javascript" src="/myapp/statics/js/MD5.js"></script>
<script type="text/javascript" src="/myapp/statics/js/FraUpload.js"></script>
<script>

    a = $("#upload_duixiang").FraUpload({
        view        : ".show",      // 视图输出位置
        url         : "/myapp/upload", // 上传接口
        fetch       : "img",   // 视图现在只支持img
        debug       : false,    // 是否开启调试模式
        /* 外部获得的回调接口 */
        onLoad: function(e){                    // 选择文件的回调方法
            console.log("外部: 初始化完成...");
        },
        breforePort: function (e) {         // 发送前触发
            console.log("文件发送之前触发");
        },
        successPort: function (e) {         // 发送成功触发
            console.log("文件发送成功");
            onload_image()
        },
        errorPort: function (e) {       // 发送失败触发
            console.log("文件发送失败");
            onload_image()
        },
        deletePost: function(e){    // 删除文件触发
            console.log("删除文件");
            console.log(e);
            alert('删除了'+e.filename)
            onload_image()
        },
        sort: function(e){      // 排序触发
            console.log("排序");
            onload_image()
        },
    });
    function onload_image(){
        var res = a.FraUpload.show()
        var ids = [];
        for(let k in res){
            this_val = res[k]
            if(!empty(res[k]['is_upload']) && !empty(res[k]['ajax'])){
                ajax_value = res[k]['ajax'];
                ids.push(ajax_value.data.id)
            }
        }
        $("#imagepath").val(ids);
        $('#geoJsonTxt').html(JsonFormat(res));
    }

    function submits() {
        $("#forms").submit();
    }


</script>
</html>