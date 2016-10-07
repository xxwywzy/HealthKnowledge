<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>健康知识库-新建知识</title>

    <link
            href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css"
            rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="dist/css/wangEditor.min.css">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link href="images/heart.ico" rel="shortcut icon"/>

    <!--Icons-->
    <script src="js/lumino.glyphs.js"></script>

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body style="margin:0 auto;width:1200px">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
     style="background:#30a5ff;height:50px">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <img style="height:80px;padding-bottom:40px;padding-top:10px;"
                 class="navbar-brand"
                 src="http://120.27.141.50:8080/health-knowledge/upload/icon.png"/>
            <a class="navbar-brand" href="#" style="font-size:23px"><span>血压助手·</span>知识管理平台</a>
            <ul class="user-menu">
                <li class="dropdown pull-right"><a href="#"
                                                   class="dropdown-toggle" data-toggle="dropdown">
                    <svg
                            class="glyph stroked male-user">
                        <use xlink:href="#stroked-male-user"></use>
                    </svg>
                    wzy&nbsp;&nbsp;<span
                        class="caret"></span> </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">
                            <svg class="glyph stroked male-user">
                                <use xlink:href="#stroked-male-user"></use>
                            </svg>
                            信息</a></li>
                        <li><a href="#">
                            <svg class="glyph stroked gear">
                                <use xlink:href="#stroked-gear"></use>
                            </svg>
                            设置</a></li>
                        <li><a href="#">
                            <svg class="glyph stroked cancel">
                                <use xlink:href="#stroked-cancel"></use>
                            </svg>
                            退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>

    </div>
    <!-- /.container-fluid -->
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <ul class="nav menu">

        <li class="active"><a href="index.jsp">
            <svg
                    class="glyph stroked pencil">
                <use xlink:href="#stroked-pencil"></use>
            </svg>
            新建知识</a></li>
        <li><a href="kno-show.jsp">
            <svg
                    class="glyph stroked calendar">
                <use xlink:href="#stroked-calendar"></use>
            </svg>
            知识管理</a></li>
        <li><a href="rules-add.jsp">
            <svg class="glyph stroked table">
                <use xlink:href="#stroked-table"></use>
            </svg>
            新建规则</a></li>
        <li><a href="rules-show.jsp">
            <svg
                    class="glyph stroked dashboard-dial">
                <use xlink:href="#stroked-dashboard-dial"></use>
            </svg>
            规则管理</a></li>

    </ul>

</div>
<!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

    <div class="row">
        <div class="col-lg-12">
            <h3></h3>
        </div>
    </div>
    <!--/.row-->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">新建知识</div>
                <div class="panel-body">
                    <div class="col-md-6">
                        <form>
                            <div class="form-group">
                                <label>知识类型</label> <select class="form-control" id="kno_type">
                                <option>高血压</option>
                                <option>糖尿病</option>
                                <option>高血脂</option>
                                <option>冠心病</option>
                                <option>脑卒中</option>
                            </select>
                            </div>
                            <div class="form-group">
                                <label>知识名称</label> <input id="name_input" class="form-control"
                                                           placeholder="请输入知识名称"></input>
                            </div>

                            <div class="form-group">
                                <label>知识简单描述</label>
                                <textarea class="form-control" rows="3" id="dis_input"
                                          placeholder="请输入知识描述（不超过50个字）"></textarea>
                            </div>

                            <div class="form-group">
                                <label>知识标签</label> <input id="kno_tag1" class="form-control"
                                                           placeholder="知识标签1"></input> <input id="kno_tag2"
                                                                                               class="form-control"
                                                                                               placeholder="知识标签2"></input>
                                <input
                                        id="kno_tag3" class="form-control" placeholder="知识标签3"></input><br>（请至少输入一个标签）
                            </div>

                            <div class="form-group">
                                <label>知识详细内容</label>
                                <textarea class="form-control" rows="10" id="content_input"
                                          placeholder="请输入知识内容"></textarea>
                            </div>

                            <div class="form-group">
                                <label>图片链接</label>
                                <textarea class="form-control" rows="2"
                                          id="link_input"><%=session.getAttribute("pic_link")%></textarea>
                            </div>

                            <button type="button" class="btn btn-primary"
                                    data-toggle="modal" data-target="#myModal" id="first_save">保存知识
                            </button>
                            <button type="reset" class="btn btn-default">重置输入</button>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <form action=Upload method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>选择上传的图片</label> <input type="file" name="fileName"
                                                              class="form-control"></input>
                                <p></p>
                                <input type="submit" value="上传" class="btn btn-primary"></input>
                            </div>
                        </form>


                    </div>

                    <div class="modal fade" id="myModal" tabindex="-1"
                         style="overflow:auto">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color:#30a5ff">
                                    <button type="button" class="close" data-dismiss="modal"
                                            style="color:white">×
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        <font color="white">确认知识</font>
                                    </h4>
                                </div>
                                <form method="post" action=Save_kno_Servlet>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>知识类型</label>
                                            <p class="form-control" style="width:350px"
                                               id="type_tobesaved">未选择类型</p>
                                        </div>
                                        <div class="form-group">
                                            <label>知识名称</label>
                                            <p class="form-control" style="width:350px"
                                               id="name_tobesaved">未输入名称</p>
                                        </div>
                                        <div class="form-group">
                                            <label>知识描述</label>
                                            <p class="form-control" style="width:350px;height:60px"
                                               id="dis_tobesaved">未输入描述</p>
                                        </div>
                                        <div class="form-group">
                                            <label>知识标签</label>
                                            <div class="form-control" style="width:350px;height:50px">
                                                <input type="button" class="btn btn-reset" value="晨峰血压"
                                                       id="kno_tag1_to_be_saved"></input>&nbsp;&nbsp; <input
                                                    type="button" class="btn btn-reset" value="饮食"
                                                    id="kno_tag2_to_be_saved"></input>&nbsp;&nbsp; <input
                                                    type="button" class="btn btn-reset" value="减肥"
                                                    id="kno_tag3_to_be_saved"></input>&nbsp;&nbsp;
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>知识图片</label>
                                            <!-- <p class="form-control" style="width:350px" id="link_tobesaved">未输入链接</p> -->
                                            <div class="form-control" style="height:200px">
                                                <img id="link_tobesaved" width="50%"/>
                                            </div>
                                        </div>
                                        <div class="form-group" style="display:none">
                                            <label>目标用户</label>
                                            <div class="form-control" style="width:350px">
                                                <input type="radio" name="user" style="cursor:pointer"
                                                       value="all" onclick="tag_selected_hide()" checked/>&nbsp;全部用户&nbsp;&nbsp;
                                                <input type="radio" name="user" style="cursor:pointer"
                                                       value="tag" data-toggle="modal" data-target="#tagModal"/>&nbsp;标签用户<br/>
                                                <!-- <input type="radio" name="user" value="male"/>男性
                                            <input type="radio" name="user" value="female" />女性<br/> -->
                                            </div>
                                        </div>
                                        <div class="form-group" id="tag_selected"
                                             style="display:none">
                                            <label>用户标签</label>
                                            <div class="form-control" style="width:350px;height:50px">
                                                <input type="button" class="btn btn-reset" value=""
                                                       name="tag1_to_be_send" style="display:none"></input>&nbsp;&nbsp;
                                                <input type="button" class="btn btn-reset" value=""
                                                       name="tag2_to_be_send" style="display:none"></input>&nbsp;&nbsp;
                                                <input type="button" class="btn btn-reset" value=""
                                                       name="tag3_to_be_send" style="display:none"></input>&nbsp;&nbsp;
                                            </div>
                                        </div>
                                        <br> <input type="hidden" style="width:1px;height:1px"
                                                    name="type_saved"></input> <input type="hidden"
                                                                                      style="width:1px;height:1px"
                                                                                      name="name_saved"></input> <input
                                            type="hidden" style="width:1px;height:1px" name="dis_saved"></input>
                                        <input type="hidden" style="width:1px;height:1px"
                                               name="link_saved"></input> <input type="hidden"
                                                                                 style="width:1px;height:1px"
                                                                                 name="content_saved"></input> <input
                                            type="hidden" style="width:1px;height:1px" name="tag1_saved"></input>
                                        <input type="hidden" style="width:1px;height:1px"
                                               name="tag2_saved"></input> <input type="hidden"
                                                                                 style="width:1px;height:1px"
                                                                                 name="tag3_saved"></input> <input
                                            type="hidden" style="width:1px;height:1px"
                                            name="kno_tag1_saved"></input> <input type="hidden"
                                                                                  style="width:1px;height:1px"
                                                                                  name="kno_tag2_saved"></input>
                                        <input type="hidden" style="width:1px;height:1px"
                                               name="kno_tag3_saved"></input>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">关闭
                                        </button>
                                        <input type="submit" value="保存" class="btn btn-primary"
                                               id="save"></input>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="tagModal" tabindex="-1"
                         style="overflow:auto">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color:#30a5ff">
                                    <button type="button" class="close" data-dismiss="modal"
                                            style="color:white" onclick="tag_selected_hide()">×
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        <font color="white">标签选择</font>
                                    </h4>
                                </div>
                                <form>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>用户性别</label>
                                            <div class="form-control" style="width:350px;height:50px">
                                                <input type="button" class="btn btn-reset" value="男性"
                                                       id="male_selected"></input>&nbsp;&nbsp; <input
                                                    type="button" class="btn btn-reset" value="女性"
                                                    id="female_selected"></input>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>用户年龄</label>
                                            <div class="form-control" style="width:350px;height:50px">
                                                <input type="button" class="btn btn-reset" value="青年"
                                                       id="young_selected"></input>&nbsp;&nbsp; <input
                                                    type="button" class="btn btn-reset" value="中年"
                                                    id="mid-life_selected"></input>&nbsp;&nbsp; <input
                                                    type="button" class="btn btn-reset" value="老年"
                                                    id="old_selected"></input>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>体重情况</label>
                                            <div class="form-control" style="width:350px;height:50px">
                                                <input type="button" class="btn btn-reset" value="正常"
                                                       id="normal_selected"></input>&nbsp;&nbsp; <input
                                                    type="button" class="btn btn-reset" value="过轻"
                                                    id="light_selected"></input>&nbsp;&nbsp; <input
                                                    type="button" class="btn btn-reset" value="肥胖"
                                                    id="fat_selected"></input>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label id="tag_amount">已选标签：0/3</label>
                                            <div class="form-control" style="width:350px;height:50px">
                                                <input type="button" class="btn btn-reset" value="性别：男性"
                                                       id="tag1" style="display:none"></input>&nbsp;&nbsp; <input
                                                    type="button" class="btn btn-reset" value="年龄：中年"
                                                    id="tag2" style="display:none"></input>&nbsp;&nbsp; <input
                                                    type="button" class="btn btn-reset" value="体重：肥胖"
                                                    id="tag3" style="display:none"></input>&nbsp;&nbsp;
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal" onclick="tag_selected_hide()">关闭
                                        </button>
                                        <button type="button" class="btn btn-primary"
                                                data-dismiss="modal" id="tag_select_complete">确定
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.col-->
    </div>
    <!-- /.row -->

</div>
<!--/.main-->


<!-- <script src="js/jquery-1.11.1.min.js"></script> -->


<script src="https://www.gstatic.com/firebasejs/3.4.0/firebase.js"></script>
<script>
    // Initialize Firebase
    var config = {
        apiKey: "AIzaSyAoQmRalvCIwIukGneaDHlq0EvGK0whLSI",
        authDomain: "helloworld-84162.firebaseapp.com",
        databaseURL: "https://helloworld-84162.firebaseio.com",
        storageBucket: "helloworld-84162.appspot.com",
        messagingSenderId: "219679750226"
    };
    firebase.initializeApp(config);
</script>


<script type="text/javascript" src="dist/js/lib/jquery-2.2.1.js"></script>
<!-- <script src="js/bootstrap.min.js"></script> -->
<script
        src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="dist/js/wangEditor.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/chart-data.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/knowledgeInput.js"></script>
<script>
    $(function () {
        var btn = $("#first_save");
        btn.click(function () {
            var type = $("#kno_type").find("option:selected").text();
            var name = $("#name_input").val();
            var dis = $("#dis_input").val();
            var link = $("#link_input").val();
            var content = $("#content_input").val();
            var kno_tag1 = $("#kno_tag1").val();
            var kno_tag2 = $("#kno_tag2").val();
            var kno_tag3 = $("#kno_tag3").val();
            $("#kno_tag1_to_be_saved").hide();
            $("#kno_tag2_to_be_saved").hide();
            $("#kno_tag3_to_be_saved").hide();
            if (kno_tag1 != "")
                $("#kno_tag1_to_be_saved").show();
            if (kno_tag2 != "")
                $("#kno_tag2_to_be_saved").show();
            if (kno_tag3 != "")
                $("#kno_tag3_to_be_saved").show();
            var tag1 = $("input[name='tag1_to_be_send']").val();
            var tag2 = $("input[name='tag2_to_be_send']").val();
            var tag3 = $("input[name='tag3_to_be_send']").val();
            $("#type_tobesaved").text(type);
            $("input[name='type_saved']").val(type);
            $("#name_tobesaved").text(name);
            $("input[name='name_saved']").val(name);
            $("#dis_tobesaved").text(dis);
            $("input[name='dis_saved']").val(dis);
            $("#link_tobesaved").attr('src', link);
            $("input[name='link_saved']").val(link);
            $("#kno_tag1_to_be_saved").val(kno_tag1);
            $("input[name='kno_tag1_saved']").val(kno_tag1);
            $("#kno_tag2_to_be_saved").val(kno_tag2);
            $("input[name='kno_tag2_saved']").val(kno_tag2);
            $("#kno_tag3_to_be_saved").val(kno_tag3);
            $("input[name='kno_tag3_saved']").val(kno_tag3);
            $("input[name='content_saved']").val(content);
            $("input[name='tag1_saved']").val(tag1);
            $("input[name='tag2_saved']").val(tag2);
            $("input[name='tag3_saved']").val(tag3);
            var kno_key = firebase.database().ref('knowledge/').push({
                knoname: name,
                knotype: type,
                knodis: dis,
                knocontent: content,
                knolink: link
            }).key;
            if (kno_tag1 != "") {
                firebase.database().ref('knowledge/' + kno_key + '/' + 'tags' + '/' + kno_tag1).set(true);
                var tag_key = firebase.database().ref('tags/').push({
                    tagname: kno_tag1
                }).key;
                firebase.database().ref('tags/' + tag_key + '/' + 'members' + '/' + name).set(true);
            }
            if (kno_tag2 != "") {
                firebase.database().ref('knowledge/' + kno_key + '/' + 'tags' + '/' + kno_tag2).set(true);
                var tag_key = firebase.database().ref('tags/').push({
                    tagname: kno_tag2
                }).key;
                firebase.database().ref('tags/' + tag_key + '/' + 'members' + '/' + name).set(true);
            }
            if (kno_tag3 != "") {
                firebase.database().ref('knowledge/' + kno_key + '/' + 'tags' + '/' + kno_tag3).set(true);
                var tag_key = firebase.database().ref('tags/').push({
                    tagname: kno_tag3
                }).key;
                firebase.database().ref('tags/' + tag_key + '/' + 'members' + '/' + name).set(true);
            }
        });
    });
</script>
<!-- <script type="text/javascript">
var editor = new wangEditor('content_input');
editor.config.uploadImgUrl = 'http://115.28.42.235:8080/health-knowledge/upload';
editor.create();
</script> -->
<!-- <script>
    $(function() {
        var btn = $("#save");
        btn.click(function() {
            //alert('保存成功！');
            $("#myModal").modal("hide");//手动关闭；双引号单引号都一样？
        });
    });
</script> -->
<script>
    !function ($) {
        $(document)
                .on(
                        "click",
                        "ul.nav li.parent > a > span.icon",
                        function () {
                            $(this).find('em:first').toggleClass(
                                    "glyphicon-minus");
                        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768)
            $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767)
            $('#sidebar-collapse').collapse('hide')
    })
</script>
</body>

</html>
