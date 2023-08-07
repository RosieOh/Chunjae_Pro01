<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 sql, db 패키지 임포트  --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");

    //3. DB 접속
    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //4. SQL 구문 처리(insert문)
    String sql = "insert into board(title, content, author) values (?, ?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);

    //5. 처리된 결과의 건수를 반환받아 글등록이 성공되었으면, 목록 페이지로 이동(boardList.jsp)
    //실패하면, 글쓰기(addBoard.jsp) 창으로 이동
    int cnt = pstmt.executeUpdate();
    String script = "<script>";
    script += "history.go(-1);";
    script += "</script>";
    if(cnt>0){
        response.sendRedirect("boardList.jsp");
    } else {
        //response.sendRedirect("addBoard.jsp");
        out.println(script);
    }
    con.close(pstmt, conn);
%>
