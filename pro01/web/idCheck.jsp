<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-P");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>idCheck-유효성 검사</title>
</head>
<body>
    <%
        String id = request.getParameter("id");
    %>
<div class="container">
    <label for="id">아이디</label>
    <input type="text" name="id" id="id" value="<%=id %>" readonly />
    <a href="idload.jsp?id=<%=id%>">아이디 중복 검사</a>

</div>
</body>
</html>