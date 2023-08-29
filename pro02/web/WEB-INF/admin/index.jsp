<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 정보수정</title>
    <c:set var="path" value="<%=request.getContextPath() %>"/>
    <%--   <%@ include file="../../common.jsp"%>--%>
    <%@ include file="../../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">


    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- 스타일 초기화 -->
    <link rel="stylesheet" href="${path }/css/reset.css">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="${path }/css/font.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="${path }/css/common.css">
    <link rel="stylesheet" href="${path }/css/hd.css">
    <link rel="stylesheet" href="${path }/css/ft.css">


    <style>


        /* 본문 영역 스타일 */
        .contents {
            clear: both;
            min-height:200vh;
            /*background-image: url("${path}/img/login.jpg");
            background-repeat: no-repeat;
            background-position: center -250px;*/
        }

        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }


      /* 사이트의 높이를 5000px로 만들어 스크롤 생성 */
       body {
           height: 5000px;
           /*background-color: #444;*/
       }

        /* 노멀라이즈 시작 */
        body, ul, li {
            margin: 0;
            padding: 0;
            list-style: none; /* 해당 태그의 list-style을 none으로 하는 것으로 ●을 제거한다 */
        }

        a {
            color: inherit; /* 부모 엘리먼트의 값을 물려받는다 */
            text-decoration: none; /* 해당 태그의 text-decoration 속성을 none 값으로 하는 것으로 밑줄을 제거한다 */
        }

        /* 노멀라이즈 끝 */

       aside{
           float: left;
           width: 30%;
           min-height: 250px;

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

       /* 본문 */

       .page{
           float: right;
           width: 70%;
           height: 100vh;
           margin-bottom:10px;
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



        /*본문 내용*/
       .adminContent{
           width: 600px;
           margin: 50px;
           background-color: #ffffff;

           display: inline-block;


       }
    </style>

</head>
<body>
<div class="container-fluid">
    <%@ include file="../../header.jsp" %>
    <div class="contents" style="min-height:200vh">
        <%--<nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="${path }/ProList.do">관리자 페이지 메인</a></li>
                </ol>
            </div>
        </nav>--%>

        <%--<div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/admin/baordList.jsp">관리자 페이지</a></p>
        </div>--%>
            <%@ include file="./adminAside.jsp"%>

        <section class="page" id="page1">
            <div class="page_wrap">


                <div class="adminContent">
                    <h2> 관리자 페이지 입니다</h2>

                </div>


            </div>
        </section>


    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>