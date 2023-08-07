<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.Board" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록</title>
    <%@ include file="../head.jsp" %>
    <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DBC con = new MariaDBCon();
        conn = con.connect();
        String sql = null;
        pstmt = conn.prepareStatement(sql);
        sql = "select * from board order by bno";
        rs = pstmt.executeQuery();

        List<Board> boardList = new ArrayList<>();
        Board bd = new Board();
        while (rs.next()) {
            bd.setBno(rs.getInt("bno"));
            bd.setTitle(rs.getString("title"));
            bd.setContent(rs.getString("content"));
            bd.setAuthor(rs.getString("author"));
            bd.setRegdate(rs.getString("regdate"));
            bd.setCnt(rs.getInt("cnt"));
            boardList.add(bd);
        }
        con.close(rs, pstmt, conn);


    %>

    <style>
             /* 본문 영역 스타일 */
         .contents { clear:both; min-height:100vh;
             background-image: url("../images/bg_visual_overview.jpg");
             background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:500px; margin:50px auto; }
        .tb1 th {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td { width:310px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>
    <link rel="stylesheet" href="../ft.css">
    </style>
</head>
<body>
    <div class="container">
        <header class="hd" id="hd">
            <%@include file="../header.jsp"%>
        </header>

        <div class="contents" id="contents">
            <div class="breadcrumb">
                <p><a href="">HOME</a> &gt; <a href="">공지사항</a> <span>공지사항</span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <table class="tb1">
                        <thead>
                        <th>글번호</th>
                        <th>글제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        </thead>
                        <tbody>
                        <%
                            for (Board bd : boardList) {
                        %>
                        <% } %>
                            <td class="item1"><%=bd.getBno()%></td>
                            <td class="item2"></td>
                            <td class="item3"></td>
                            <td class="item4"></td>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>

        <footer class="ft" id="ft">
            <%@include file="../footer.jsp"%>
        </footer>
    </div>
</body>
</html>