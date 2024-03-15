 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.example.bbs.bbs.BbsDAO"%>
<%@ page import="org.example.bbs.bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
 <%@ page import="java.util.List" %>
 <!doctype html>
<html>
<head>
    <title>게시판 &#60; | JSP 게시판 웹 사이트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>JSP 게시판 웹 사이트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style type="text/css">
        a, a:hover {
            color: #000000;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <%
        String userID = null;
        if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
        }
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
    %>
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
    <div class="container mt-3">
        <div class="row">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
                <thead>
                    <tr>
                       <th style="background-color: #eeeeee; text-align: center">번호</th>
                       <th style="background-color: #eeeeee; text-align: center">제목</th>
                       <th style="background-color: #eeeeee; text-align: center">작성자</th>
                       <th style="background-color: #eeeeee; text-align: center">작성일</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    BbsDAO bbsDAO = new BbsDAO();
                    List<Bbs> list = bbsDAO.getList(pageNumber);
                    for (int i = 0; i < list.size(); i++) {
                %>
                    <tr>
                        <td><%= list.get(i).getBbsID() %></td>
                        <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></td>
                        <td><%= list.get(i).getUserID()%></td>
                        <td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시 " + list.get(i).getBbsDate().substring(14, 16) + "분 "%></td>
                    </tr>
                  <%
                      }
                  %>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col text-start">
                <% if (pageNumber != 1) { %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success">이전</a>
                <% } %>
                <% if (bbsDAO.nextPage(pageNumber + 1)) { %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success">다음</a>
                <% } %>
            </div>
            <div class="col text-end">
                <a href="write.jsp" class="btn btn-primary">글쓰기</a>
            </div>
        </div>
    </div>
</body>
</html>