<%@ page import="com.lut.beans.NewsRealese" %>
<%@ page import="dao.NewsRealeseDao" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理员界面||文章审核</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
    <!-- jQuery file -->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.tabify.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        var $ = jQuery.noConflict();
        $(function () {
            $('#tabsmenu').tabify();
            $(".toggle_container").hide();
            $(".trigger").click(function () {
                $(this).toggleClass("active").next().slideToggle("slow");
                return false;
            });
        });
    </script>

    <script type=text/javascript src=js/query.js></script>
</head>
<% String administorName = (String) session.getAttribute("username");
    NewsRealeseDao newsRealeseDao = new NewsRealeseDao();
    ArrayList newsRealese = newsRealeseDao.AdministorQueryCheckPending();
%>
<body>
<div id="panelwrap">

    <div class="header">
        <div class="title"><a href="#">欢迎${username}登录!</a></div>

        <div class="header_right"><a href="#" class="settings">设置</a> <a href="login_admin.jsp"
                                                                                                    class="logout">退出</a>
        </div>

        <div class="menu">
            <ul>
                <li><a href="check_pending.jsp" class="selected">文档审核</a></li>
                <li><a href="AllNews_admin.jsp">查看所有文章</a></li>
                <li><a href="">发布文章</a></li>

            </ul>
        </div>

    </div>

    <div class="submenu">
        <ul>
            <li><a href="#" class="selected"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
        </ul>
    </div>

    <div class="center_content">

        <div id="right_wrap">
            <div id="right_content">
                <h2>待审核文档列表</h2>


                <table id="rounded-corner">
                    <thead>
                    <tr>
                        <th></th>
                        <th>文档编号</th>
                        <th>标题</th>
                        <th>发布日期</th>
                        <th>文档类别</th>
                        <th>作者</th>
                        <th>文档详情</th>
                        <th>审核通过</th>
                        <th>删除</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <td colspan="12">以上是所有的待审核文档</td>
                    </tr>
                    </tfoot>
                    <tbody>
                    <%
                        for (int i = 0; i < newsRealese.size(); i++) {
                            NewsRealese tem = (NewsRealese) newsRealese.get(i);
                    %>
                    <tr class="odd">
                        <td><input type="checkbox" name=""/></td>
                        <td><%=tem.getNewsId()%>
                        </td>
                        <td><%=tem.getHead()%>
                        </td>
                        <td><%=tem.getPublish_time()%>
                        </td>
                        <td><%=tem.getNewstype()%>
                        </td>
                        <td><%=tem.getIssueuser()%>
                        </td>
                        <td><a href="#"><img src="images/edit.png" alt="" title="" border="0"
                                             onclick="queryInfo('<%=tem.getNewsId()%>','check_pending')"/></a>
                        </td>

                        <td><a href="#"><img src="images/pass.png" alt="" title="" border="0"
                                             onclick="javascrtpt:window.location.href = 'checkNews?newsid=<%=tem.getNewsId()%>'"/></a>
                        </td>
                        <td><a href="#"><img src="images/trash.gif" alt="" title="" border="0"
                                             onclick="javascrtpt:window.location.href = 'DeleteOneNews?function=check_delete&destination=check_pending.jsp&table=check_pending&newsid=<%=tem.getNewsId()%>'"/></a>
                        </td>
                    </tr>


                    <%
                        }
                    %>
                    </tbody>
                </table>


                <ul id="tabsmenu" class="tabsmenu">
                    <li class="active"><a href="#tab1">文档详情</a></li>

                </ul>
                <div id="tab1" class="tabcontent">
                    <h3>详细信息审核</h3>
                    <div class="form">


                        <div class="form_row">
                            <label>编号:</label>
                            <input type="text" class="form_input" id="check_id" value=""/>
                        </div>

                        <div class="form_row">
                            <label>标题:</label>
                            <input type="text" class="form_input" id="check_head" value="" readonly/>
                        </div>

                        <div class="form_row">
                            <label>作者:</label>
                            <input type="text" class="form_input" id="check_author" value="" readonly/>
                        </div>

                        <div class="form_row">
                            <label>时间:</label>
                            <input type="text" class="form_input" id="check_time" value="" readonly/>
                        </div>

                        <div class="form_row">
                            <label>类型:</label>
                            <input type="text" class="form_input" id="check_type" value="" readonly/>
                        </div>

                        <div class="form_row">
                            <label>内容:</label>
                            <textarea rows="100" class="form_textarea" id="check_content"  value="" readonly></textarea>
                        </div>

                        <div class="form_row">
                            <input type="submit" class="form_submit" value="审核通过" onclick="checkpass()">
                        </div>

                        <div class="clear"></div>
                    </div>
                </div>





















                <!--以下暂时无用------------------------------------------------------------------------>








                <div class="toogle_wrap">
                    <div class="trigger"><a href="#"></a></div>

                    <div class="toggle_container">
                        <p>

                        </p>
                    </div>
                </div>

            </div>
        </div><!-- end of right content-->


        <div class="sidebar" id="sidebar">
            <h2>待完善功能</h2>

            <ul>
                <li><a href="#" class="selected">主页</a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
            </ul>

            <h2>待完善页功能</h2>

            <ul>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
            </ul>

            <h2>待完善用户功能</h2>

            <ul>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
            </ul>

            <h2></h2>
            <%--<div class="sidebar_section_text">--%>


        <%--</div>--%>


        <%--<div class="clear"></div>--%>
        </div> <!--end of center_content-->



</div>


</body>
</html>