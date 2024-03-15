<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <title>메인 &#60; | JSP 게시판 웹 사이트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>JSP 게시판 웹 사이트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <div>
            <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="navbar-toggler-icon"></span>
                <span class="navbar-toggler-icon"></span>
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="/index.jsp">JSP 게시판 웹 사이트</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="main.jsp">메인</a></li>
                <li class="nav-item"><a class="nav-link active" href="bbs.jsp">게시판</a></li>
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
                        <li class="active"><a class="dropdown-item" href="login.jsp">로그인</a></li>
                        <li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
                    </ul>
                </li>
            </ul>
            <%
            } else {
            %>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
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
<div class="container mt-3">
    <div class="row">
        <form method="post" action="writeAction.jsp">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
                <thead>
                <tr>
                    <th colspan="2" style="background-color: #eeeeee; text-align: center">게시판 글쓰기 양식</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
                </tr>
                <tr>
                    <td><textarea type="text" class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
                </tr>
                </tbody>
            </table>
            <div class="text-end">
                <input type="submit" class="btn btn-primary" value="글쓰기">
            </div>
        </form>
    </div>
</div>
</body>
</html>