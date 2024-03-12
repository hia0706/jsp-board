<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String userID = (String) session.getAttribute("userID");
%>
<!doctype html>
<html>
<head>
    <title>로그인 &#60; | JSP 게시판 웹 사이트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>JSP 게시판 웹 사이트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <div>
            <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="navbar-toggler-icon"></span>
                <span class="navbar-toggler-icon"></span>
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="/index.jsp">JSP 게시판 웹 사이트</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="main.jsp">메인</a></li>
                <li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판</a></li>
            </ul>
            <%
                if (userID == null) {
            %>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="btn btn-dark dropdown-toggle" href="#"
                       role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        접속하기
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark">
                        <li><a class="dropdown-item active" href="/login.jsp">로그인</a></li>
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
                        <li class="dropdown-item"><a class="nav-link" href="logoutAction.jsp">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <%
            }
        %>
    </div>
</nav>
<div class="container d-flex align-items-center">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form class="border bg-light p-3" name="form" method="post" action="loginAction.jsp">
                <h3 style="text-align: center;">로그인 화면</h3>
                <div class="form-group mb-3">
                    <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                </div>
                <div class="form-group mb-3">
                    <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="로그인">
            </form>
        </div>
        <div class="col-lg-4"></div>
    </div>
</div>
</body>
</html>