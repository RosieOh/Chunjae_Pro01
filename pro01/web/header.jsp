<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path1 = request.getContextPath();
    String sid = (String) session.getAttribute("id");
%>
<div class="hd_wrap">
    <nav class="tnb">
        <ul class="menu">
            <% if(sid!=null) { %>
            <li><a href="<%=path1 %>/member/logout.jsp">로그아웃</a></li>
            <li><a href="<%=path1 %>/member/mypage.jsp">마이페이지</a></li>
            <li><a href="map.jsp">오시는 길</a></li>
                <% if(sid.equals("admin")) { %>
                <li><a href="<%=path1 %>/admin/index.jsp">관리자페이지로</a></li>
                <% } %>
            <% } else { %>
            <li><a href="<%=path1 %>/member/login.jsp">로그인</a></li>
            <li><a href="<%=path1 %>/member/term.jsp">회원가입</a></li>
            <li><a href="map.jsp">오시는 길</a></li>
            <% } %>
        </ul>
    </nav>
</div>
<div class="hd_wrap">
    <a href="<%=path1 %>index.html" class="logo">
        <img src="<%=path1 %>/images/chunjae1.png" alt="천재IT교육센터 로고타입">
    </a>
    <nav class="gnb">
        <ul class="menu">
            <li class="item1">
                <a href="company.html" class="dp1">회사소개</a>
                <ul class="sub">
                    <li><a href="company.html#com">회사개요</a></li>
                    <li><a href="company.html#greet">인사말</a></li>
                    <li><a href="company.html#history">연혁</a></li>
                    <li><a href="company.html#map">오시는길</a></li>
                </ul>
            </li>
            <li class="item2">
                <a href="biz.html" class="dp1">사업영역</a>
                <ul class="sub">
                    <li><a href="biz.html#text">교과서</a></li>
                    <li><a href="biz.html#ref">참고서</a></li>
                    <li><a href="biz.html#smart">스마트교육</a></li>
                    <li><a href="biz.html#edu">에듀테크</a></li>
                </ul>
            </li>
            <li class="item3">
                <a href="social.html" class="dp1">사회공헌</a>
                <ul class="sub">
                    <li><a href="social.html#serve">학습봉사</a></li>
                    <li><a href="social.html#support">지역사회후원</a></li>
                    <li><a href="social.html#academy">학회지원</a></li>
                    <li><a href="social.html#school">공교육지원</a></li>
                </ul>
            </li>
            <li class="item4">
                <a href="promotion.html" class="dp1">홍보</a>
                <ul class="sub">
                    <li><a href="promotion.html#news">언론보도</a></li>
                    <li><a href="promotion.html#pr">광고</a></li>
                    <li><a href="promotion.html#sns">SNS</a></li>
                    <li><a href="promotion.html#story">천재이야기</a></li>
                </ul>
            </li>
            <li class="item5">
                <a href="brand.html" class="dp1">브랜드</a>
                <ul class="sub">
                    <li><a href="brand.html#intro">브랜드 소개</a></li>
                    <li><a href="brand.html#organizion">유관 기관</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>