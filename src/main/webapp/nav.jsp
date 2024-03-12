<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String menu = request.getParameter("menu");
    String userID = (String) session.getAttribute("userID");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JSP 게시판 웹 사이트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="/index.jsp">JSP 게시판 웹 사이트</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="nav navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link <%="메인".equals(menu) ? "active" : "" %>" href="/main.jsp">메인</a></li>
                <li class="nav-item"><a class="nav-link <%="게시판".equals(menu) ? "active" : "" %>" href="/bbs.jsp">게시판</a></li>
            </ul>
            <%
                if (userID == null) {
            %>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="btn btn-dark dropdown-toggle <%="접속하기".equals(menu) ? "active" : "" %>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        접속하기
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark">
                        <li><a class="dropdown-item" href="/login.jsp">로그인</a></li>
                        <li><a class="dropdown-item" href="/join.jsp">회원가입</a></li>
                    </ul>
                </li>
            </ul>
            <%
            } else {
            %>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        회원관리
                    </button>
                    <ul class="dropdown-menu dropdown-menu-dark">
                        <li class="dropdown-item"><a class="nav-link <%="로그아웃".equals(menu) ? "active" : "" %>" href="/logoutAction.jsp">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <%
            }
        %>
    </div>
</nav>
</body>
</html>