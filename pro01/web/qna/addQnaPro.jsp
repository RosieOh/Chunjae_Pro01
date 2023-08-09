<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 sql, db 패키지 임포트  --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ include file="../setting/setting.jsp"%>
<%@include file="../setting/encoding.jsp"%>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%
    int lev = Integer.parseInt(request.getParameter("lev"));
    int par = Integer.parseInt(request.getParameter("par"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = request.getParameter("author");

    //3. DB 접속
    Connection con = null;
    PreparedStatement pstmt = null;
    DBC conn = new MariaDBCon();
    con = conn.connect();

    //4. SQL 실행 및 실행결과 리턴
    String sql = "insert into qna(title, content, author, lev, par) values(?, ?, ?, ?, ?)";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);
    pstmt.setInt(4, lev);
    pstmt.setInt(5, par);

    int cnt = pstmt.executeUpdate();

    if (lev==0) {
        sql = "update qna set par=qno where par=0 and lev=0";
        pstmt.close();
        pstmt = con.prepareStatement(sql);
        pstmt.executeUpdate();
        cnt++;
    }

    if(cnt==2) {
        System.out.println("질문 글이 등록되었습니다.");
        response.sendRedirect("/qna/qnaList.jsp");
    } else if(cnt==1){
        System.out.println("답변 글이 등록 되었습니다.");
        response.sendRedirect("/qna/qnaList.jsp");
    } else {
        System.out.println("질문 및 답변 등록이 실패되었습니다.");
        response.sendRedirect("/qna/addQna.jsp?lev="+lev+"&par="+par);
        //out.println("<script>history.go(-1);</script>");
    }
    conn.close(pstmt, con);

%>