<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
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

        .small-container {
            display: flex;
            justify-content: space-between; /* 자식 요소 간 간격 설정 */
            gap: 20px; /* 요소 사이 간격 */
        }

        .list-container {
            width: 45%;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        .list-title {
            font-weight: bold;
            font-size: 1.2em;
            margin-bottom: 10px;
        }

        .container ul {
            list-style-type: none;
            padding: 0;
        }

        .container li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border: 1px solid #ddd;
            margin-bottom: 5px;
            border-radius: 4px;
            background-color: #fff;
        }

        .delete-button {
            background-color: #ff4d4d;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 0.9em;
        }

        .delete-button:hover {
            background-color: #cc0000;
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
    <div class="main-title">관리</div>
    <hr>
    <!-- 회원 목록 -->
    <div class="small-container">
        <div class="list-container">
            <div class="list-title">회원 목록</div>
            <ul>
                <li>ID 1 <button class="delete-button">X</button></li>
                <li>ID 2 <button class="delete-button">X</button></li>
                <li>ID 3 <button class="delete-button">X</button></li>
                <li>ID 4 <button class="delete-button">X</button></li>
            </ul>
        </div>

        <!-- 팀 목록 -->
        <div class="list-container">
            <div class="list-title">팀 목록</div>
            <ul>
                <li>ID 1 <button class="delete-button">X</button></li>
                <li>ID 2 <button class="delete-button">X</button></li>
                <li>ID 3 <button class="delete-button">X</button></li>
                <li>ID 4 <button class="delete-button">X</button></li>
            </ul>
        </div>
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
