<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 가져오기 --%>
<%@ page import="com.chunjae.util.*" %>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%-- 2. 인코딩 설정 --%>
<%@ include file="../setting/encoding.jsp" %>
<%
    //3. 보내온 이메일 데이터 받기
    String name = request.getParameter("name");
    String from = request.getParameter("author");
    String email = request.getParameter("from");    //보내는 사람 이메일
    //String from = "kkt09072@naver.com";
    String tel = request.getParameter("tel");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String to = "dhxogns920@naver.com";  //받는 사람 이메일

    //4. smtp 설정 -> Properties 활용
    Properties p = new Properties();
    p.put("mail.smtp.host","smtp.naver.com");
    p.put("mail.smtp.port", "465");
    p.put("mail.smtp.starttls.enable", "true");
    p.put("mail.smtp.auth", "true");
   // p.put("mail.smtp.ssl.enable", "true");
    //
    p.put("mail.smtp.debug", "true");
    p.put("mail.smtp.socketFactory.port", "465");
    p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    p.put("mail.smtp.socketFactory.fallback", "false");

    //5. 이메일 보내기
    try {
        Authenticator auth = new SMTPAuthenticatior();
        Session ses = Session.getInstance(p, auth);

        ses.setDebug(true);
        MimeMessage msg = new MimeMessage(ses);

        msg.setSubject(title); //  제목

        StringBuffer buffer = new StringBuffer();   //이메일 내용
        buffer.append("보내는 사람 : ");
        buffer.append(name+"\n");
        buffer.append("연락처 : ");
        buffer.append(tel+"\n");
        buffer.append("이메일 : ");
        buffer.append(email+"\n");
        buffer.append("제목 : ");
        buffer.append(title+"\n");
        buffer.append("내용 : ");
        buffer.append(content+"\n");

        Address fromAddr = new InternetAddress(from);  //보내는 사람
        msg.setFrom(fromAddr);

        Address toAddr = new InternetAddress(to);      // 받는 사람
        msg.addRecipient(Message.RecipientType.TO, toAddr);

        msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용
        Transport.send(msg); // 전송
    } catch(Exception e){
        e.printStackTrace();
        return;
    } finally {
        response.sendRedirect("/index.jsp");
    }
%>
