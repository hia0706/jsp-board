<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="org.example.bbs.bbs.Bbs" %>
<%@page import="org.example.bbs.bbs.BbsDAO" %>
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
    int bbsID = 0;
    if (request.getParameter("bbsID") != null) {
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    if (bbsID == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다.')");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
    }
    Bbs bbs = new BbsDAO().getBbs(bbsID);
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
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
            <thead>
            <tr>
                <th colspan="3" style="background-color: #eeeeee; text-align: center">게시판 글 보기</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="width: 20%;">글 제목</td>
                <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td colspan="2"><%= bbs.getUserID() %></td>
            </tr>
            <tr>
                <td>작성일자</td>
                <td><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시 " + bbs.getBbsDate().substring(14, 16) + "분 " %></td>
            </tr>
            <tr>
                <td>내용</td>
                <td colspan="2" style="height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
            </tr>
            </tbody>
        </table>
        <div class="row">
            <div class="col">
                <a href="bbs.jsp" class="btn btn-secondary">목록</a>
                <%
                    if (userID != null && userID.equals(bbs.getUserID())) {
                %>
                <a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-warning">수정</a>
                <a onclick="return confirm('정말 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-danger">삭제</a>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>