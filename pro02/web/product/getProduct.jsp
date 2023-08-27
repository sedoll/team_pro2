<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세</title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

    <!-- 스타일 초기화 -->
    <link rel="stylesheet" href="${path}/css/reset.css">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="${path}/css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="${path}/css/common.css">
    <link rel="stylesheet" href="${path}/css/hd.css">
    <link rel="stylesheet" href="${path}/css/ft.css">
    <link rel="stylesheet" href="${path}/css/video.css">
    <style>
        /* 본문 영역 스타일 */
        /* background-image: url("../img/login.jpg"); */
        .contents { clear:both; min-height: 250vh; background-image: url("${path}/img/login.jpg");
            background-repeat: no-repeat; background-position: center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center;  color:#fff;
            padding-bottom: 1.3em; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .tb1 {
            width: 1200px;
            font-size: 17px;
            margin-bottom: 50px;
            border-collapse: collapse; /* 테이블 간격 없애기 */
        }

        .tb1 thead th {
            line-height: 32px;
            padding: 12px 15px; /
            /*border: 1px solid #f5f5f5; !*/
            box-sizing: border-box;
            background-color: #eeeeee; /* 배경색 조정 */
            font-size: 22px;
            font-weight: 600;
            border-radius: 10px;
        }

        .tb1 thead td {
            font-size: 16px;
            text-align: right;
            line-height: 40px;
            border-bottom: #7e7e7e 1px solid;

        }
        .tb1 thead td:nth-child(1) {
            width: 6%;
            text-align: center;
        }.tb1 thead td:nth-child(2) {
            text-align: left;
             width: 14%;
         }
        .tb1 thead td:nth-child(3) {
            font-weight: 600;
            width: 62%;
        }
        .tb1 thead td:nth-child(4) {
            width: 10%;
        }
        .tb1 thead td:nth-child(5) {
            width: 8%;

        }
        /*글 내용*/
        .tb1 tbody tr td {
            padding-left: 10px;
            padding-top: 40px;
            font-size: 18px;
            text-align: left;


        }

        .content {
            min-height: 400px;
            border-bottom: 1px solid #7e7e7e;
        }


        .title {
            text-align: left;
            font-weight: bold;
        }



        .tb2{
            width: 1200px;
        }

        .tb2 .item1 { width: 10%; }
        .tb2 .item2 { width: 68%;}
        .tb2 .item3 { width: 10%; }
        .tb2 .item4 { width: 12%;
        }
        .tb2 td {
            border-bottom: 1px solid #7e7e7e;
            vertical-align: middle;
            height: 60px;
        }

        .tb2 thead tr th{
            text-align: center;
        }
        .tb2 tbody tr td:first-child{
            text-align: center;
            font-weight: bold;

        }
        .tb2 tbody tr td:nth-child(2){
            word-break: break-word;

        }
        .tb2 tbody tr td:nth-child(3){
            text-align: center;
        }

        .btn1 {
            display: block;
            border-radius: 10px;
            max-width: 120px;
            text-align: center;
            background-color: #527AF2;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-bottom: 10px;
        }

        .btn1:hover {
            background-color: #666666;
        }

        .inbtn, .delete_btn {
            display: inline-block;
            border-radius: 5px;
            max-width: 100px;
            line-height: 28px;
            text-align: center;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s; /* 마우스 오버 효과 */
            padding: 7px 15px;
        }

        .inbtn {
            background-color: #333;
            color: #fff;
        }

        .delete_btn {
            background-color: red;
            color: #fff;
        }

        .inbtn:hover, .delete_btn:hover {
            background-color: #555;
        }

        .frm {
            margin-top: 50px;
        }

        /*.frm tr > * {*/
        /*    margin-right: 10px;*/
        /*}*/

        .btn_group {
            margin-top: 50px;
        }

        #ans_btn {
            border-radius: 5px; /* 버튼 크기  */
            text-align: center;
        }



        .tb3{
            width: 1200px;
            height: 140px;
            margin-bottom: 50px;
            background-color: #eeeeee;
            border-radius: 10px;
        }

        .tb3 th {
            line-height: 100px;

            text-align: center;
            vertical-align: middle;

        }
        .tb3 th:first-child{
            width: 15%;
            font-weight: bold;
            font-size: 18px;

        }
        .tb3 th:nth-child(2){
            width: 70%;
        }
        .tb3 th:last-child{
            width: 15%;

        }
        textarea {
             resize: none;
             padding: 10px;
             height: 80px;
             border: 1px solid #ccc;
             border-radius: 5px;
             vertical-align: middle;
         }
        #nologin_comment {
            width: 1200px;
            text-align: center;
            padding-top: 60px;
            position: absolute;
            font-weight: bold;
        }
    </style>
</head>

<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="">자유게시판</a> &gt; <a href="">게시글</a></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">게시글</h2>
                <table class="tb1">

                    <thead>
                        <tr class="title">
                            <th colspan="5">${pro.pname}</th>
                        </tr>
                        <tr>
                            <td>
                                <c:if test="${sid eq 'admin'}">
                                    <a href="/board/updateBoard.jsp?lev=0" class="inbtn">수정</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${sid eq 'admin'}">
                                    <a href="${path}/ProductDel.do?no=${pro.no}" class="inbtn delete_btn">삭제</a>
                                </c:if>
                            </td>
                            <td>${pro.cateno}</td>
                            <td>
                                ${pro.resdate}
                            </td>
                            <td>${pro.price}</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td colspan="5" class="content">
                            <div>
                                <img src="${path}/storage/${pro.imgSrc1}" width="300"/>
                                <br><br><br>
                                ${pro.pcomment}
                                <br><br><br>
                                ${pro.imgSrc1}
                                <br><br><br>
                            </div>
                            <c:if test="${not empty pro.imgSrc2}">
                            <div class="player">
                                <div class="vdo_fr">
                                    <video id="video">
                                        <source src="${path}/storage/${pro.imgSrc2}" type="video/mp4" />
                                    </video>
                                </div>
                                <div id="timebar">
                                    <span id="currentTime"></span>
                                </div>
                                <div id="buttonbar">
                                    <button id="restart" class="player_btn"></button>
                                    <button id="rew" class="player_btn"></button>
                                    <button id="play" class="player_btn"></button>
                                    <button id="pause" class="player_btn"></button>
                                    <button id="stop" class="player_btn"></button>
                                    <button id="fastFwd" class="player_btn"></button>
                                    <button id="mute" class="player_btn"></button>
                                    <button id="unmute" class="player_btn"></button>
                                    <input id="vol" type="range" value="500" min="0" max="1000">
                                    <button id="vmup" class="player_btn"></button>
                                    <button id="vmdown" class="player_btn"></button>
                                    <button id="volTxt">100%</button>
                                    <button id="sizeup" class="player_btn"></button>
                                    <button id="sizedown" class="player_btn"></button>
                                    <button id="full" class="player_btn"></button>
                                    <button id="original" class="player_btn"></button>
                                </div>
                                <div id="progress">
                                    <div id="progressBar"></div>
                                </div>
                            </div>
                            </c:if>
                            <script src="./js/vdo.js"></script>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <c:if test="${not empty sid }">
                    <div class="btn-submit">
                        <a href="${path }/AddPayment.do?pno=${pro.no }" class="inbtn">구매하기</a>
                        <a href="${path }/AddCart.do?pno=${pro.no }" class="inbtn">장바구니</a>
                    </div>
                </c:if>
                <table class="tb2" id="myTable">
                    <thead>
                    <tr>
                        <th class="item1">작성자</th>
                        <th class="item2">댓글</th>
                        <th class="item3">작성일</th>
                        <th class="item4"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="lev" items="${revList }">
                    <tr>
                        <td class="item1">${lev.cid}</td>
                        <td class="item2">${lev.content}</td>
                        <td class="item3">${lev.resdate}</td>
                        <td class="item4">
                            <c:if test="${sid eq lev.cid}">
                                <a href="${path}/updateAns.jsp&lev=1" class="inbtn">수정</a>
                                <a href="${path}/deleteBoardpro.jsp&lev=1" class="inbtn delete_btn"> 삭제 </a>
                            </c:if>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable({
                            // sorting 화살표 제거
                            "targets": 'no-sort',
                            "bSort": false,

                            // 3번째 컬럼을 기준으로 내림차순 정렬
                            order: [[3, 'asc']],
                            pageLength : 5,
                            searching: false, //검색 제거
                            lengthChange: false, // show entries 제거
                            info: false,

                            language: {
                                emptyTable: '작성된 후기가 없습니다.'
                            }
                        });
                        $('#myTable').css({
                            'border':'none',
                        });

                    } );
                </script>
                <c:if test="${check == '1'}">
                <form action="${path}/AddReview.do" id="login_frm" class="frm">
                    <table class="tb3">
                        <tbody>
                        <tr>
                                <th>${sid}</th>
                                <th><textarea name="content" id="content" cols="100" rows="5" placeholder="리뷰 작성" required ></textarea></th>
                                <th><input type="submit" value="글쓰기" class="inbtn" id="ans_btn"></th>
                                <input type="hidden" name="pno" value="${pro.no}" readonly>
                        </tr>
                        </tbody>
                    </table>
                </form>
                </c:if>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>