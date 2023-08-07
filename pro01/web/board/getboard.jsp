<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae.db" %>
<%@ page import="com.chunjae.dto" %>
<%@ page import="com.chunjae.db.DBC" %>
<%@ page import="com.chunjae.db.MariaDBCon" %>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int bno = Integer.parseInt(request.getParameter("bno"));

    // 2. DB 연결하기
    DBC conn = new MariaDBCon();
    conn.connect();

    //
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세보기</title>
</head>
<body>

</body>
</html>