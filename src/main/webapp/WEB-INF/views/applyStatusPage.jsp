<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>지원 현황</title>
    <style>
        body {  /* body 태그 전체 */
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow-x: hidden;
        }

        header {  /* header 태그 전체 */
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #333333;
            color: white;
        }

        .page-title {  /* 페이지 제목*/
            font-size: 2em; /* 페이지 이름을 크게 */
            font-weight: bold;
            margin-left: 30px;
            display: flex;
        }

        a {  /* a 태그 전체 */
            color: inherit; /* 부모 요소의 글자색과 일치 */
            text-decoration: none;
        }

        header a {  /* header 태그 내 a 태그 */
            color: white;
            text-decoration: none;
        }

        .main-title {
            font-weight: bold;
            font-size: 1.5em;
            color: #333333;
        }

        .container {  /* container 클래스 */
            width: 80%;
            margin: 20px auto;
            margin-top: 10px;
            max-width: 1000px;
            padding: 20px;

        }

        .apply-list {
            background-color: #D6F4FF;
            padding: 10px;
            border-radius: 5px;
            align-items: center; /* 상하 중앙 정렬 */
        }

        .apply-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px;
            padding: 5px 0;
            border-bottom: 1px solid #ddd;
            font-weight: bold;
        }

        .apply-item span {
            font-size: 1.5em;
        }

        .apply-item .waitingStatus {
            font-size: 1.2em;
            color: black;
        }
        .apply-item .okStatus {
            font-size: 1.2em;
            color: green;
        }
        .apply-item .noStatus {
            font-size: 1.2em;
            color: red;
        }

        .divider {  /* 로그인, 회원가입 구분자를 위한 클래스 */
            color: white;
            margin-left: 10px;
            margin-right: 10px;
        }

        nav {  /* 네비게이터 nav 태그 전체 */
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
        }
        nav ul {  /* nav 태그 내 ul 태그 */
            list-style-type: none;
            display: flex;
            justify-content: space-around;
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<header>
    <a class="page-title" href="/"><div class="" style="color: #0082CC;">TUK&nbsp;</div>Team Gem</a>
    <div class="account-container">
        <a href="/login-page">로그인</a>
        <span class="divider">|</span>
        <a href="/member/register-form" style="margin-right: 30px;">회원가입</a>
    </div>
</header>
<div class="container">
    <div class="main-title">지원 현황</div>
    <hr>

    <div>
        <c:forEach var="application" items="${applications}">
            <div class="apply-list">
                <div class="apply-item"><!-- 샘플 데이터 -->
                    <span>${application.team.name}</span>
                    <c:if test="${application.applicationStatus == 'PENDING'}">
                        <div class="waitingStatus">대기</div>
                    </c:if>
                    <c:if test="${application.applicationStatus == 'APPROVED'}">
                        <div class="okStatus">승인</div>
                    </c:if>
                    <c:if test="${application.applicationStatus == 'REJECTED'}">
                        <div class="noStatus">거절</div>
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

<!-- 하단 네비게이션 바 -->
<nav>
    <ul>
        <li><a href="/team-members/my-teams">&nbsp;&nbsp;&nbsp;내 팀&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="/">홈</a></li>
        <li><a href="/team-members/application">지원 현황</a></li>
    </ul>
</nav>

</body>
</html>