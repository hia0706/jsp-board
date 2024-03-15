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
    /* 로그인 하지 않았을 때 */
    if (userID == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요.')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
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
    /* 로그인 ID != 게시판 작성자 */
    Bbs bbs = new BbsDAO().getBbs(bbsID);
    if (!userID.equals(bbs.getUserID())) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
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
    </div>
</nav>
<div class="container mt-3">
    <div class="row">
        <form method="post" action="updateAction.jsp?bbsID=<%= bbs.getBbsID() %>">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
                <thead>
                <tr>
                    <th colspan="2" style="background-color: #eeeeee; text-align: center">게시판 글 수정 양식</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle()%>"></td>
                </tr>
                <tr>
                    <td><textarea type="text" class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent()%></textarea></td>
                </tr>
                </tbody>
            </table>
            <div class="text-end">
                <input type="submit" class="btn btn-primary" value="글 수정">
            </div>
        </form>
    </div>
</div>
</body>
</html>