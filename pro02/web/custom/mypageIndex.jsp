<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- 스타일 초기화 -->
    <link rel="stylesheet" href="${path}/css/reset.css">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="${path}/css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="${path}/css/common.css">
    <link rel="stylesheet" href="${path}/css/hd.css">
    <link rel="stylesheet" href="${path}/css/ft.css">
    <style>


        @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap");

        /* noonnu font */
        @font-face {
            font-family: "yg-jalnan";
            src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff") format("woff");
            font-weight: normal;
            font-style: normal;
        }

        * {
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
            font-family: "Noto Sans KR", sans-serif;
        }

        li, li a {
            list-style: none;
        }

        a {
            color: #000;
        }

        button,input {
            overflow: visible;
        }

        input {
            outline: none;
            border: none;
        }

        button {
            outline: none !important;
            border: none;
            background: 0 0;
        }

        /* 본문 영역 스타일 */
        .contents {
            clear: both;
            min-height: 100vh;
            background-image: url("${path}/img/login.jpg");
            background-repeat: no-repeat;
            background-position: center -250px;
        }

        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }

        .page {
            clear: both;
            width: 100vw;
            height: 100vh;
            position: relative;
        }

        .page::after {
            content: "";
            display: block;
            width: 100%;
            clear: both;
        }

        .page_wrap {
            clear: both;
            width: 1200px;
            height: auto;
            margin: 0 auto;
        }

        .page_tit {
            font-size: 48px;
            text-align: center;
            padding-top: 0.7em;
            color: #fff;
            padding-bottom: 1.3em;
        }

        .breadcrumb {
            clear: both;
            width: 1200px;
            margin: 0 auto;
            text-align: right;
            color: #fff;
            padding-top: 28px;
        }

        .breadcrumb a {
            color: #fff;
        }

        .frm {
            clear: both;
            width: 1200px;
            margin: 0 auto;
            padding-top: 80px;
        }

        .tb1 {
            width: 600px;
            margin: 0 auto;
            font-size: 20px;
            border-collapse: separate;
            border-spacing: 0 20px;
            background-color: #e1e1e1;
            border-radius: 14px;

        }

        .tb1 th {
            width: 180px;
            line-height: 30px;

            padding-left: 70px;
            border-right: 2px solid #6b6b6b;

            box-sizing: border-box;
            text-align: left;
        }

        .tb1 .data {
            width: 320px;
            line-height: 30px;
            padding-top: 4px;
            padding-bottom: 4px;
            /*border-bottom: 1px solid #333; */
            box-sizing: border-box;
            text-align: left;
            padding-left: 90px;
        }

        .tb2 {
            width: 600px;
            margin: 0 auto;
            margin-top: 50px;
        }

        .inbtn {
            display: block;
            border-radius: 10px;
            min-width: 120px;
            padding-left: 24px;
            padding-right: 24px;
            text-align: center;
            line-height: 38px;
            background-color: #333;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
        }

        .inbtn:first-child {
            float: left;
        }

        .inbtn:last-child {
            float: right;
        }

        .inbtn:hover {
            background-color: #666666;
        }


        /* 사이드바 시작 */
        aside {
            float: left;
            width: 30%;
            min-height: 250px;
            z-index: 999;
        }

        /* 커스텀 시작 */
        .side-bar > ul ul {
            display: none;
        }

        /* 사이드바의 너비와 높이를 변수를 통해 통제 */
        :root {
            --side-bar-width: 220px;
            --side-bar-height: 80vh;
        }

        .side-bar {
            position: absolute; /* 스크롤을 따라오도록 지정 */
            background-color: cornflowerblue;
            width: var(--side-bar-width);
            min-height: var(--side-bar-height); /* 사이드바의 높이를 전체 화면 높이의 90%로 지정 */
            margin-top: 20px; /* 사이드바 위와 아래의 마진을 동일하게 지정 */
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


        .my-page {
            width: 43vw;
            min-width: 600px;
            margin: 100px auto;
            margin-bottom: 200px;
            padding-top: 50px;
        }

        .my-page__title {
            font-weight: 700;
            font-size: 38px;
            margin-bottom: 83px;
            text-align: center;
        }

        .my-page__profile {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .my-page-profile__image {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            margin-bottom: 45px;
        }

        .my-page-profile__nickname {
            display: block;
            font-weight: 700;
            font-size: 22px;
        }

        .my-transaction-info {
            margin-top: 24px;
            margin-right: 12px;
            width: 23vw;
        }

        .my-transaction-info__list {
            display: flex;
            justify-content: space-between;
            align-items: center;
            text-align: center;
            min-width: 260px;
        }

        .my-transaction-info__title {
            font-weight: 400;
            font-size: 22px;
            display: block;
            margin-bottom: 24px;
        }

        .my-transaction-info__content {
            font-weight: 700;
            font-size: 26px;
        }

        .my-page__introduction {
            margin-top: 19px;
            margin-bottom: 24px;
            font-weight: 400;
            font-size: 22px;
            min-height: 72px;
            max-height: 170px;
            overflow-y: scroll;
        }

        .my-page__edit-buttons {
            margin-bottom: 85px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .my-profile-edit,
        .my-info-edit {
            font-weight: 700;
            font-size: 19px;
            height: 57px;
            border-radius: 5px;
            cursor: pointer;
        }

        .my-profile-edit:active,
        .my-info-edit:active {
            opacity: 0.7;
        }

        .my-profile-edit {
            width: 27vw;
            border: 2px solid #4751FD;
            background-color: white;
            color: #4751FD;
            min-width: 310px;
        }

        .my-info-edit {
            width: 13.9vw;
            margin-right: 14px;
            border: none;
            background-color: #EFEFEF;
            color: #444444;
            min-width: 220px;
        }

        .transaction-history {
            width: 100%;
            border: 2px solid #000;
            display: flex;
            border-radius: 5px;
        }

        .transaction-history__sale,
        .transaction-history__purchase {
            width: 50%;
            font-weight: 700;
            font-size: 22px;
            height: 71px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }

        .transaction-history__sale:active,
        .transaction-history__purchase:active {
            opacity: 0.7;
        }

        .transaction-history__sale {
            border-right: 2px solid #000;
        }


    </style>
    <c:set var="path" value="<%=request.getContextPath() %>"/>
</head>

<body>
<div id="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>


    <div id="container">
        <%@ include file="../custom/customAside.jsp"%>
        <main class="container__inner">
            <article class="my-page">
                <h1 class="my-page__title">마이페이지</h1>

                <div class="my-page__profile">
                    <div class="my-page-profile">
                        <img
                                src="${path }/img/basic-profile-image.png"
                                alt="프로필 사진"
                                class="my-page-profile__image"
                        />
                        <span class="my-page-profile__nickname">user</span>
                    </div>

                    <div class="my-transaction-info">
                        <ul class="my-transaction-info__list">
                            <li class="my-transaction-info__item">
                                <span class="my-transaction-info__title">거래건수</span>
                                <span class="my-transaction-info__content">66</span>
                            </li>

                            <li class="my-transaction-info-item">
                                <span class="my-transaction-info__title">회원등급</span>
                                <span class="my-transaction-info__content">F</span>
                            </li>

                            <li class="my-transaction-info-item">
                                <span class="my-transaction-info__title">POINT</span>
                                <span class="my-transaction-info__content">1000 점</span>
                            </li>
                        </ul>
                    </div>
                </div>

                <p class="my-page__introduction">


                </p>

                <div class="my-page__edit-buttons">
                    <button type="button" class="my-profile-edit" onclick="location.href='${path}/Mypage.do'">회원 정보 변경</button>
                    <button type="button" class="my-info-edit" onclick="location.href='${path }/LikeList.do'">
                        <i class="fas fa-cog my-info-edit__icon"></i>
                        <span class="my-info-edit__text" >찜목록</span>
                    </button>
                </div>

                <div class="transaction-history">
                    <div class="transaction-history__sale">
                        <a href="${path}/PaymentList.do">결제정보</a>
                    </div>
                    <div class="transaction-history__purchase">
                        <a href="${path}/CartList.do">장바구니</a>
                    </div>
            </article>
        </main>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>

<script
        src="https://kit.fontawesome.com/b17793764c.js"
        crossorigin="anonymous"
></script>
</body>
</html>