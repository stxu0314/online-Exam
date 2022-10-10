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
                    <a href="${pageContext.request.contextPath}/examServlet?action=findMyExams&userId=${USER.user_id}"><i
                            class="fas fa-file"></i> <span>我的考试</span></a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/scoreServlet?action=findMyExamsRecord&userId=${USER.user_id}"><i class="fas fa-table"></i> <span>我的考试记录</span></a>
                </li>

            </ul>
        </div>
    </div>
</div>