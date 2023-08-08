<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%-- 1. 필요한 라이브러리 불러오기 --%>
<%@include file="../setting/setting.jsp"%>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%@include file="../setting/encoding.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    int qno = Integer.parseInt(request.getParameter("qno"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    // 4. sql 실행 및 실행결과 받기
    String sql = "SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev, a.par AS par, b.name AS NAME FROM qna a, member b WHERE a.author=b.id and qno=? ORDER BY a.par DESC, a.lev ASC, a.qno ASC";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setInt(3, qno);
    int cnt = pstmt.executeUpdate();

    if(cnt>0) {
        response.sendRedirect("/qna/qnaList.jsp");
    } else {
        response.sendRedirect("/qna/updateQna.jsp?qno="+qno);
    }
    con.close(pstmt, conn);
%>
