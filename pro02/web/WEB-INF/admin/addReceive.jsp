<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 입고</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../head.jsp"%>

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
        <%@ include file="/header.jsp" %>
    </header>
    <c:if test="${sid eq 'admin'}">
        <%@ include file="../WEB-INF/admin/adminAside.jsp"%>
    </c:if>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/">상품 입고</a>
                &gt; <a href="/">상품 입고</a></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">상품 입고</h2>
                <form name="frm1" id="frm1" action="${path }/AddReceivePro.do" method="post">
                    <table class="tb1">
                        <tbody>
                            <tr>
                                <th><label for="pno">상품명</label></th>
                                <td>
                                    <c:set var="cate" />
                                    <select name="no" id="pno">
                                        <option value="1" cate="0" price="" selected>선택안함</option>
                                        <c:forEach var="pro" items="${proList }" varStatus="status">
                                            <option value="${pro.no }" cate="${pro.cate }" price="${pro.price }">${pro.pname }</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="amount">수량</label></th>
                                <td><input type="number" name="amount" id="amount" placeholder="입고 수량 입력" class="form-control" value="1" min="1" max="1000" required></td>
                            </tr>
                            <tr>
                                <th><label for="price">가격</label></th>
                                <td><input type="number" name="price" id="price" value="" readonly required></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" name="submit-btn" class="inbtn" value="상품입고">
                                    <input type="reset" name="reset-btn" class="inbtn" value="취소">
                                    <a href="${path }/ProList.do" class="inbtn">상품목록</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <script>
                    $(document).ready(function(){
                        $("#pno").change(function(){
                            var v = $(this).val();
                            var cate = $(this).find("option:selected").attr("cate");
                            var price = parseInt($(this).find("option:selected").attr("price"));
                            $("#cate").text(cate);
                            $("#rprice").val(price);
                        });
                    });
                </script>
                <%-- 상품을 선택하면 해당 상품의 가격을 이동 --%>
                <script>
                    const selectElement = document.getElementById("pno");
                    const priceInput = document.getElementById("price");

                    selectElement.addEventListener("change", function() {
                        const selectedOption = selectElement.options[selectElement.selectedIndex];
                        const price = selectedOption.getAttribute("price");
                        priceInput.value = price;
                    });
                </script>
        </div>
        </section>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
