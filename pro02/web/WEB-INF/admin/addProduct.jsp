<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 정보 작성</title>
    <%@ include file="../../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- 스타일 초기화 -->
    <!-- 스타일 초기화 -->
    <link rel="stylesheet" href="${path}/css/reset.css">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="${path}/css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="${path}/css/common.css">
    <link rel="stylesheet" href="${path}/css/hd.css">
    <link rel="stylesheet" href="${path}/css/ft.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height: 100vh; background-image: url("${path}/img/login.jpg");
            background-repeat: no-repeat; background-position: center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 200vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center;  color:#fff;
            padding-bottom: 1.3em; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .tb1 { width:600px; margin:0 auto; font-size: 24px;}
        .tb1 th { width: 200px; line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}
        .tb1 td { width: 400px; line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}

        .tb1 td:last-child { line-height: 48px; padding-top:24px; padding-bottom:24px; }


        .inbtn { display:block;
            border-radius:10px;
            min-width:120px;
            padding-left: 24px;
            padding-right: 24px;
            text-align: center;
            line-height: 38px;
            background-color: #333;
            color:#fff;
            font-size: 18px;
            cursor: pointer; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }

        .inbtn:hover {
            background-color: #666666;
        }
        .indata {
            display:inline-block;
            width: 590px;
            height: 32px;
            line-height: 32px;
            text-indent:10px;
            font-size:16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px 15px;
        }

        textarea {
            resize: none;
            width: 600px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        /* 노멀라이즈 끝 */

        aside{
            float: left;
            width: 30%;
            min-height: 250px;
            z-index: 999;
        }
        /* 커스텀 시작 */
        .side-bar > ul ul {
            display: none;
        }


        /* 사이드바 시작 */

        /* 사이드바의 너비와 높이를 변수를 통해 통제 */
        :root {
            --side-bar-width: 220px;
            --side-bar-height: 80vh;
        }

        .side-bar {
            position: fixed; /* 스크롤을 따라오도록 지정 */
            background-color: cornflowerblue;
            width: var(--side-bar-width);
            min-height: var(--side-bar-height); /* 사이드바의 높이를 전체 화면 높이의 90%로 지정 */
            margin-top: 50px; /* 사이드바 위와 아래의 마진을 동일하게 지정 */
        }

        /* 아이콘 시작 */
        .side-bar__icon-box {
            display: flex;
            justify-content: flex-end;
        }

        .side-bar__icon-1 {
            position: relative;
            width: 23px;
            height: 17px;
            margin: 15px;
            margin-top: 20px;
            transition: .5s;
        }

        :root {
            --side-bar__icon: .5s;
        }

        .side-bar__icon-1 > div {
            position: absolute;
            width: 100%;
            height: 20%;
            background-color: white;
            transition: all var(--side-bar__icon);
        }

        .side-bar__icon-1 > div:nth-of-type(1) {
            top: 0;
            width: auto;
            left: 0;
            right: 0;
            transition: all var(--side-bar__icon), left calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2), right calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2), height calc(var(--side-bar__icon) / 2) 0s;
        }

        .side-bar__icon-1 > div:nth-of-type(2) {
            top: 40%;
            transform-origin: bottom left;
        }

        .side-bar__icon-1 > div:nth-of-type(3) {
            top: 80%;
            left: auto;
            right: 0;
            transform-origin: bottom right;
        }


        .side-bar:hover .side-bar__icon-1 {
            transform: translate(-198px, 0);
        }

        .side-bar:hover .side-bar__icon-1 > div:nth-of-type(2) {
            transform: rotate(45deg);
            width: 70.5%;
            height: 25%;
        }

        .side-bar:hover .side-bar__icon-1 > div:nth-of-type(3) {
            top: 40%;
            transform: rotate(-45deg);
            width: 70.5%;
            height: 25%;
        }

        .side-bar:hover .side-bar__icon-1 > div:nth-of-type(1) {
            left: 41%;
            right: 41%;
            height: 100%;
            transition: all var(--side-bar__icon), left calc(var(--side-bar__icon) / 2) 0s, right calc(var(--side-bar__icon) / 2) 0s, height calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2);
        }
        /* 아이콘 끝 */

        /* 모든 메뉴의 a에 속성값 부여 */
        .side-bar ul > li > a {
            display: block;
            color: white;
            font-size: 1.4rem;
            font-weight: bold;
            padding-top: 20px;
            padding-bottom: 20px;
            padding-left: 50px;
            transition: .5s;
        }

        /* 자식의 position이 absolute일 때 자식을 영역 안에 가두어 준다 */
        .side-bar > ul > li {
            position: relative;
        }

        /* 모든 메뉴가 마우스 인식 시 반응 */
        .side-bar ul > li:hover > a {
            background-color: #555;
            border-bottom: 1px solid #999;
        }

        /* 1차 메뉴의 항목이 마우스 인식 시에 2차 메뉴 등장 */
        .side-bar > ul > li:hover > ul {
            display: block;
            position: absolute;
            background-color: #888;
            top: 0; /* 2차 메뉴의 상단을 1차 메뉴의 상단에 고정 */
            left: 100%; /* 2차 메뉴를 1차 메뉴의 너비만큼 이동 */
            width: 100%; /* 1차 메뉴의 너비를 상속 */
        }

        /* 사이드바 너비의 80%만큼 왼쪽으로 이동 */
        .side-bar {
            border-radius: 0px 20px 20px 0;
            /*  transform: translate(calc(var(--side-bar-width) * -0.8), 0);
              transition: .5s;*/
        }

        /* 마우스 인식 시 원래의 위치로 이동 */
        .side-bar:hover {
            transform: translate(-20px, 0); /* 둥근 모서리의 너비만큼 숨겨주기 */
        }
        /* 사이드바 끝 */
        /* 커스텀 끝 */
    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../../header.jsp" %>
    </header>
    <c:if test="${sid eq 'admin'}">
        <%@ include file="adminAside.jsp"%>
    </c:if>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/">상품추가</a>
                &gt; <a href="/">상품 추가</a></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">상품 추가</h2>
                <form action="${path}/AddProductPro.do" class="frm" method="post" enctype="multipart/form-data">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th>카테고리</th>
                            <td colspan="2">
                                <select name="c1" id="c1" class="indata" autofocus required>
                                    <option value="" selected>선택안함</option>
                                    <option value="초등">초등</option>
                                    <option value="중등">중등</option>
                                    <option value="고등">고등</option>
                                    <option value="기타">기타</option>
                                </select>

                                <select name="c2" id="c2" class="indata" autofocus required>
                                    <option value="" selected>선택안함</option>
                                    <option value="교과서"  id="op1" >교과서</option>
                                    <option value="참고서" id="op2">참고서</option>
                                    <option value="문제집" id="op3">문제집</option>
                                    <option value="기타" id="op4">기타</option>
                                    <option value="일반서적" id="op5">일반서적</option>
                                    <option value="유아" id="op6">유아</option>
                                    <option value="해외" id="op7">해외</option>

                                </select>

                                <script>
                                    var c1 = document.getElementById("c1");
                                    var c2 = document.getElementById("c2");
                                    var op1 = document.querySelectorAll("#op1,#op2,#op3,#op4");
                                    var op2 = document.querySelectorAll("#op5,#op6,#op7");


                                    c1.addEventListener("change", function() {
                                        if (c1.value === "기타") {
                                            op2.forEach(option => {
                                                option.style.display = "block";
                                            });

                                            op1.forEach(option => {
                                                option.style.display = "none";
                                            });

                                        } else {
                                            op1.forEach(option => {
                                                option.style.display = "block";
                                            });

                                            op2.forEach(option => {
                                                option.style.display = "none";
                                            });



                                        }
                                    });
                                </script>


                            </td>
                        </tr>
                        <tr>
                            <th>상품 이름</th>
                            <td colspan="2"><input type="text" name="pname" id="pname" class="indata" placeholder="상품 이름 입력" required></td>
                        </tr>
                        <tr>
                            <th>상품 설명</th>
                            <td colspan="2"> <textarea name="pcomment" id="pcomment" cols="50" rows="15" placeholder="상품 설명 입력" required></textarea></td>
                        </tr>
                        <tr>
                            <th>상품 목차</th>
                            <td colspan="2"> <textarea name="plist" id="plistt" cols="50" rows="8" placeholder="상품 목차 입력" required></textarea></td>
                        </tr>
                        <tr>
                            <th>상품 가격</th>
                            <td colspan="2"><input type="text" name="price" id="price" class="indata" placeholder="상품 가격 입력" required></td>
                        </tr>
                        <tr>
                            <th>메인 이미지</th>
                            <td colspan="2"><input type="file" name="imgsrc1" id="imgsrc1" class="indata" placeholder="상품 이미지" accept=".jpg, .png" required></td>
                        </tr>

                        <tr>
                            <th>설명 이미지</th>
                            <td colspan="2"><input type="file" name="imgsrc2" id="imgsrc2" class="indata" placeholder="상품 이미지" accept=".jpg, .png" required></td>
                        </tr>
                        <tr>
                            <th>샘플 영상</th>
                            <td colspan="2"><input type="file" name="imgsrc3" id="imgsrc3" class="indata" placeholder="상품 소개 영상" accept=".mp4" required></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="상품등록" class="inbtn">
                                <input type="reset" value="취소" class="inbtn" onclick="window.history.back();">
                                <a href="${path}/ProList.do" class="inbtn">상품목록</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../../footer.jsp" %>
    </footer>
</div>
</body>
</html>