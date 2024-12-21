<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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

      .container {
        background-color: #cceeff;
        width: 80%;
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #0082CC;
      }

      form {
        display: flex;
        flex-direction: column;
        gap: 15px;
      }

      label {
        font-weight: bold;
        color: #333;
      }

      input[type="text"], input[type="email"], input[type="password"] {
        width :100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1rem;
        box-sizing: border-box;
      }

      input[type="submit"] {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1rem;
      }

      input[type="submit"]:hover {
        background-color: #0056b3;
      }

      .message {
        text-align: center;
        margin-top: 20px;
        font-weight: bold;
        color: #333;
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
        <%
            HttpSession memberSession = request.getSession(false);
            Object memberId = memberSession.getAttribute("memberId");
        %>
        <!-- 세션에 사용자 정보가 있으면 로그아웃 링크 표시 -->
        <% if (memberId != null) { %>
        <a href="/member/logout" style="margin-right: 30px;">로그아웃</a>
        <% } else { %>
        <!-- 세션에 사용자 정보가 없으면 로그인 및 회원가입 링크 표시 -->
        <a href="/login-page">로그인</a>
        <span class="divider">|</span>
        <a href="/member/register-form" style="margin-right: 30px;">회원가입</a>
        <% } %>
    </div>
</header>

<div class="container">
    <h2>회원가입</h2>
    <form method="post" action="/member/register">
        <label for="nickname">닉네임</label>
        <input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력하세요" required>

        <label for="loginId">아이디</label>
        <input type="text" id="loginId" name="loginId" placeholder="아이디를 입력하세요" required>

        <label for="password">비밀번호</label>
        <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>

        <input type="submit" value="회원가입">
    </form>
</div>

<!-- 경고 메시지 박스 -->
<div class="alert-box">
    <p>${errorMessage}</p>
</div>

<style>
  .alert-box {
    width: 80%;
    max-width: 1000px;
    margin: 20px auto;
    padding: 15px 20px;
    background-color: #ffdddd; /* 연한 빨간 배경 */
    color: #d8000c; /* 경고 빨간 글씨 */
    border: 1px solid #d8000c; /* 경고 빨간 테두리 */
    border-radius: 5px; /* 둥근 모서리 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 약간의 그림자 */
    font-family: Arial, sans-serif; /* 글꼴 */
    text-align: center; /* 중앙 정렬 */
    font-size: 1.2em; /* 적당히 큰 글씨 크기 */
  }

  .alert-box p {
    margin: 0; /* p 태그 여백 제거 */
  }

  .alert-box a {
    color: #d8000c; /* 빨간 글씨 */
    text-decoration: underline; /* 밑줄 */
    font-weight: bold; /* 굵은 글씨 */
  }

  .alert-box a:hover {
    text-decoration: none; /* 마우스 오버 시 밑줄 제거 */
  }
</style>

<nav>
    <ul>
        <li><a href="/team-members/my-teams">&nbsp;&nbsp;&nbsp;내 팀&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="/">홈</a></li>
        <li><a href="/team-members/application">지원 현황</a></li>
    </ul>
</nav>
</body>
</html>