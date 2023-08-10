<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.DBC" %>
<%@ page import="com.chunjae.db.MariaDBCon" %>
<%@ page import="com.chunjae.dto.Faq" %>
<%-- 인코딩 세팅 --%>
<%@ include file="../setting/encoding.jsp"%>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC conn = new MariaDBCon();
    con = conn.connect();
    String sql = "select * from faq order by fno desc";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Faq> faqlist = new ArrayList<>();
    while (rs.next()) {
        Faq faq = new Faq();
        faq.setFno(rs.getInt("fno"));
        faq.setQuestion(rs.getString("question"));
        faq.setAnswer(rs.getString("answer"));
        faq.setCnt(rs.getInt("cnt"));
        faqlist.add(faq);
    }
    conn.close(rs, pstmt, con);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <%@ include file="../head.jsp" %>
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

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:1000px; margin:50px auto; text-align: center;}
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; text-align: center;}
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; text-align: center; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
        .ans {display: none;}
    </style>

<%--        <style>--%>
<%--        @import url('http://fonts.googleapis.com/earlyaccess/notosanskr.css');--%>
<%--        ul, li, p { list-style:none; padding:0; margin:0; }--%>
<%--        .faqlist { font-family:'Noto Sans KR', sans-serif; margin-bottom:20px; }--%>
<%--        .faqlist .qa_li { position:relative; display:block; padding:0; border-bottom:1px solid #ededed; cursor:pointer; }--%>
<%--        .faqlist .qa_li:first-child { border-top:1px solid #a6a6a6; }--%>
<%--        .qa_li .question { position:relative; display:block; padding:25px 100px 25px 120px; background:url('https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_q.png') 40px center no-repeat; }--%>
<%--        .qa_li .question .iconDiv { position:absolute; right:40px; top:50%; -webkit-transform:translateY(-50%); -moz-transform:translateY(-50%); -o-transform:translateY(-50%); -ms-transform:translateY(-50%); transform:translateY(-50%); }--%>
<%--        .qa_li .ans{ position:relative; display:none; padding:40px 120px; font-size:16px; color:#222; line-height:28px; background:#f6f6f6 url('https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_a.png') 40px 40px no-repeat; border-top:1px solid #e4e4e4; }--%>
<%--    </style>--%>
    <link rel="stylesheet" href="../ft.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>

    <link rel="stylesheet" href="../jquery.dataTables.css">
    <script src="../jquery.dataTables.js"></script>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="">FAQ</a> &gt; <span>FAQ 목록</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">FAQ 목록</h2>
                <table class="tb1" id="myTable">
                        <thead>
                            <th class="item1">번호</th>
                            <th class="item3">자주 묻는 질문</th>
                        </thead>
                        <tbody>
                            <% for(Faq faq : faqlist) { %>
                        <tr>
                            <td><%= faq.getFno()%></td>
                            <td>
                                <ul class="faqlist">
                                    <li>
                                        <div class="que"><%=faq.getQuestion()%></div>
                                        <div class="ans"><%=faq.getAnswer()%></div>
                                    </li>
                                </ul>
                                <% } %>
                            </td>
                        </tr>
                        </tbody>
                </table>
<%--                <script>--%>
<%--                    $(document).ready( function () {--%>
<%--                        $('#myTable').DataTable({--%>
<%--                            order:[[0, "desc"]]--%>
<%--                        }); // 테이블 태그의 id태그가 되어야함--%>
<%--                    });--%>
<%--                </script>--%>
                <script>
                    $(document).ready(function() {
                        $(".faqlist li").click(function (){
                            $(this).find(".ans").slideToggle(100);
                        });
                    });
                </script>
<%--                <ul class="faqlist">--%>
<%--                    <% for(Faq faq : faqlist) { %>--%>
<%--                    <li class="qa_li">--%>
<%--                        <div class="question">--%>
<%--                            <p class><%=faq.getQuestion()%></p>--%>
<%--                            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>--%>
<%--                        </div>--%>
<%--                        <div class="ans"><p><%=faq.getAnswer()%></p></div>--%>
<%--                    </li>--%>
<%--                    <% } %>--%>
<%--                    <script>--%>
<%--                        $(document).ready(function() {--%>
<%--                            $(".faqlist li").click(function (){--%>
<%--                                $(this).find(".ans").slideToggle(500);--%>
<%--                            });--%>
<%--                        });--%>
<%--                    </script>--%>
<%--                </ul>--%>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>