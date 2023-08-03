<h1>1. 세팅 작업</h1>
<p>Project 추가 : pro01 //d:oth/pro01/pro01</p>

<p>add framework... // web 추가</p>

<p>select Run/Debug configuration Tomcat 9 추가</p>

<p>open module settings -> <br>
javax.servletXXXX_4.0.1.jar 추가<br>
mariadb-java-client-3.1.4.jar 추가</p>

<p>web/WEB-INF/lib 폴더를 만들고,<br>
javax.servletXXXX_4.0.1.jar 복사하여 붙여넣기<br>
tomcat-servlet-api-9.0.78.jar 복사하여 붙여넣기<br>
mariadb-java-client-3.1.4.jar 복사하여 붙여넣기</p>

<p>web/head.jsp 작성(메타포, 오픈그래프, 파비콘, css라이브러리, js라이브러리...path를 등록하여 위치 맞추기)<br>
images 디렉토리 및 동영상 등 모든 리소스 디렉토리 복사하여<br>
web 디렉토리에 복사하여 붙여넣기</p>

<p>index.jsp에 head태그 사이에(title 태그 밑)에 <%@ include file = "head.jsp"%></p>

<p>web/header.jsp 작성 (index.html에 있는 header 태그 안에 소스 코드를 모두 복사하여 붙여넣기</p>

<p>web/index.jsp에 아래와 같이 include
header class="hd" id="hd">
    <%@ include file = "header.jsp"%>
</p>