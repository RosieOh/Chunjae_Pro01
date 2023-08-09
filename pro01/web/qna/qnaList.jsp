<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 불러오기 --%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ page import="java.util.Date" %>
<%@ include file="../setting/encoding.jsp"%>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev, a.par AS par, b.name AS name FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Qna> qnaList = new ArrayList<>();
    while (rs.next()){
        Qna qna = new Qna();
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
        qna.setName(rs.getString("name"));
        qnaList.add(qna);
    }
    con.close(rs, pstmt, conn);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>묻고 답하기 목록</title>
    <%@include file="../head.jsp"%>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../google.css">
    <link rel="stylesheet" href="../fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../common.css">
    <link rel="stylesheet" href="../hd.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: auto; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .tb1 .item1 { width:10%; text-align: center; }
        .tb1 .item2 { width:65%; }
        .tb1 .item3 { width:10%; text-align: center; }
        .tb1 .item4 { width:15%; text-align: center; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="../ft.css">
    <link rel="stylesheet" href="../jquery.dataTables.css">
    <script src="../jquery.dataTables.js"></script>
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>
</head>
<body>
    <div class="container">
            <header class="id" id="id">
                <%@include file="../header.jsp"%>
            </header>
            <div class="contents" id="contents">
                <div class="breadcrumb">
                    <p><a href="/">HOME</a> &gt; <a href="">질문 및 답변</a> &gt; <span>질문 및 답변</span></p>
                </div>
                <section class="page" id="page1">
                    <div class="page_wrap">
                        <h2 class="page_tit">질문 및 답변</h2>
                        <br><br><hr><br><br>
                        <table class="tb1" id="myTable">
                            <thead>
                            <th class="item1">글번호</th><th class="item2">제목</th>
                            <th class="item3">작성자</th><th class="item4">작성일</th>
                            </thead>
                            <tbody>
                            <%
                                SimpleDateFormat ymd = new SimpleDateFormat("yy-MM-dd");
                                int tot = qnaList.size(); // tot를 선언해주고
                                for(Qna q:qnaList) {
                                    Date d = ymd.parse(q.getResdate());
                                    String date = ymd.format(d);
                            %>
                                    <tr>
                                        <td class="item1"><%=tot%></td> <%-- 여기서 지정을 해줘야함!--%>
                                        <td class="item2">
                                            <% if(q.getLev()==0) { %>
                                                <a href="/qna/getQna.jsp?qno=<%=q.getQno()%>"><%= q.getTitle()%></a>
                                            <% } else { %>
                                                <a style="padding-left: 28px" href="/qna/getQna.jsp?qno=<%=q.getQno()%>"><%=q.getTitle()%></a>
                                            <% } %>
                                        </td>
                                        <td class="item3"><%=q.getAuthor()%></td>
                                        <td class="item4"><%=date %></td>
                                    </tr>
                            <%
                                    tot--;
                                }
                            %>
                            </tbody>
                        </table>
                        <script>
                            $(document).ready( function () {
                                $('#myTable').DataTable({
                                    order:[[0, "desc"]]
                                }); // 테이블 태그의 id태그가 되어야함
                            });
                        </script>
                        <br><hr>
                        <div class="btn_group">
                            <% if(sid!=null) { %>
                            <a href="/qna/addQna.jsp?lev=0&par=0" class="inbtn">질문하기</a>
                            <% } else { %>
                            <p>관리자만 공지사항의 글을 쓸 수 있습니다.<br>
                                로그인한 사용자만 글의 상세내용을 볼 수 있습니다.</p>
                            <% } %>
                        </div>
                    </div>
                </section>
            </div>
            <footer class="ft" id="ft">
                <%@ include file="../footer.jsp" %>
            </footer>
    </div>
</body>
</html>