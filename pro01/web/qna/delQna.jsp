<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 sql, db 패키지 임포트  --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ include file="../setting/setting.jsp"%>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%
        int qno = Integer.parseInt(request.getParameter("qno"));
        int lev = Integer.parseInt(request.getParameter("lev"));

        //3. DB 연결
        Connection con = null;
        PreparedStatement pstmt = null;
        DBC conn = new MariaDBCon();
        con = conn.connect();
        String script = "";

        //4. SQL 실행 및 실행결과 리턴
        String sql = "";
        if(lev == 0) {
            sql = "delete from qna where par=?";         // 삭제 대상이 질문글일 때
        } else {
            sql = "delete from qna where qno=?";         // 삭제 대상이 답변글일 때
        }
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, qno);

        int cnt = pstmt.executeUpdate();

        if (cnt>0) {
            response.sendRedirect("/qna/qnaList.jsp");
        }else {
            response.sendRedirect("/qna/getQna.jsp?qno="+qno);
        }

        conn.close(pstmt, con);
%>