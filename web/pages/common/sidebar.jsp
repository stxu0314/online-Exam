<%--
  Created by IntelliJ IDEA.
  User: STXU
  Date: 2022/9/19
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="sidebar" id="sidebar">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.min.js"></script>
    <script>
        $(function () {
            $("li[class=submenu]").click(function () {
                $("li[class='submenu active']").prop("class", "submenu")
                $(this).prop("class", "submenu active")
            })
            // $("li>ul>li>a").click(function () {
            //     $(this).parent().parent().parent().prop("class","submenu active")
            //     $(this).prop("class","active")
            //     alert($(this).text())
            // })
        })
    </script>

    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>主菜单</span>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/userServlet?action=findIndexData"><i class="fas fa-th-large"></i> <span>仪表板</span></a>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fas fa-user-graduate"></i> <span> 学生</span> <span
                            class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/userServlet?action=findUsers&part=0">学生列表</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/pages/add-student.jsp">添加学生</a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fas fa-chalkboard-teacher"></i> <span> 老师</span> <span
                            class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/userServlet?action=findUsers&part=1">老师列表</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/pages/add-teacher.jsp">添加老师</a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fas fa-building"></i> <span> 班级</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/clazzServlet?action=findClasses">班级列表</a></li>
                        <li><a href="${pageContext.request.contextPath}/pages/add-class.jsp">添加班级</a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fas fa-book-reader"></i> <span> 试题</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/questionServlet?action=findQuestions">试题列表</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/pages/add-question.jsp">添加试题</a></li>
                    </ul>
                </li>

                <li class="submenu">
                    <a href="#"><i class="fas fa-file-invoice-dollar"></i> <span> 试卷</span> <span
                            class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/paperServlet?action=findPapers">试卷列表</a></li>
                        <li><a href="${pageContext.request.contextPath}/pages/add-paper.jsp">添加试卷</a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fas fa-file-invoice-dollar"></i> <span> 考试</span> <span
                            class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/examServlet?action=findExams">考试列表</a></li>
                        <li><a href="${pageContext.request.contextPath}/pages/add-exam.jsp">添加考试</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>