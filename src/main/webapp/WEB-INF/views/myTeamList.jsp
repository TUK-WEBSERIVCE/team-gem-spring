<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 팀 목록</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        overflow-x: hidden;
      }

      header {
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
        background-color: #333333;
        color: white;
      }

      .page-title {
        font-size: 2em;
        font-weight: bold;
        margin-left: 30px;
        display: flex;
      }

      .container {
        width: 80%;
        margin: 20px auto;
        margin-top: 10px;
        max-width: 1000px;
        padding: 20px;
        text-align: center; /* 전체 내용 가운데 정렬 */
      }

      a {
        color: inherit;
        text-decoration: none;
      }

      header a {
        color: white;
        text-decoration: none;
      }

      .main-title {
        font-weight: bold;
        font-size: 1.5em;
        color: #333333;
        text-align: left;
      }

      .table-border {
        border-radius: 10px;
        background-color: #333333;
        padding: 1px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      }

      table { /* table 태그 전체 */
        border-collapse: collapse;
        border-radius: 10px;
        overflow: hidden;
        width: 100%;
      }

      th, td { /* th, td 태그 전체 */
        padding: 15px;
        text-align: center;
      }

      th { /* th 태그 전체 */
        background-color: #333333;
        color: white;
      }

      tr:nth-child(even) { /* 짝수번째 행일 경우 */
        background-color: #D6F4FF;
      }

      tr:nth-child(odd) { /* 홀수번째 행일 경우 */
        background-color: #F9F9F9;
      }

      .status-open { /* open상태(모집중) 클래스 */
        color: green;
        font-weight: bold;
      }

      .status-closed { /* closed상태(모집종료) 클래스 */
        color: red;
        font-weight: bold;
      }

      .divider {
        color: white;
        margin-left: 10px;
        margin-right: 10px;
      }

      nav {
        width: 100%;
        background-color: #007bff;
        color: white;
        padding: 10px 0;
        position: fixed;
        bottom: 0;
      }

      nav ul {
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
    <a class="page-title" href="/">
        <div class="" style="color: #0082CC;">TUK&nbsp;</div>
        Team Gem</a>
    <div class="account-container">
        <a href="/login-page">로그인</a>
        <span class="divider">|</span>
        <a href="/member/register-form" style="margin-right: 30px;">회원가입</a>
    </div>
</header>

<div class="container">
    <div class="main-title">내 팀</div>
    <hr>
    <div class="table-border">
        <table>
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>모집 인원</th>
                <th>분야</th>
                <th>마감 여부</th>
                <th>마감일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="myTeam" items="${myTeams}">
                <tr>
                    <td>${myTeam.id}</td>
                    <td><a href="/team-members/my-team/${myTeam.team.id}">${myTeam.team.name}</a></td>
                    <td>${myTeam.team.numberOfParticipant}/${myTeam.team.capacity}</td>
                    <td>${myTeam.team.field}</td>
                    <td>
                        <span class="status" data-duedate="${myTeam.team.dueDate}"></span>
                    </td>
                    <td>${myTeam.team.dueDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <script>
          document.addEventListener('DOMContentLoaded', function() {
            const now = new Date();
            document.querySelectorAll('.status').forEach(function(statusElement) {
              const dueDate = new Date(statusElement.dataset.duedate);
              if (dueDate > now) {
                statusElement.textContent = '모집중';
                statusElement.classList.add('status-open');
              } else {
                statusElement.textContent = '종료';
                statusElement.classList.add('status-closed');
              }
            });
          });
        </script>
    </div>
</div>

<!-- 하단 네비게이션 바 -->
<nav>
    <ul>
        <li><a href="/team-members/my-teams">&nbsp;&nbsp;&nbsp;내 팀&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="/">홈</a></li>
        <li><a href="/apply-page">지원 현황</a></li>
    </ul>
</nav>
</body>
</html>