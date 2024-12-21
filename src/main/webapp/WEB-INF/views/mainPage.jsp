<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tuk-Team-Gem</title>
    <style>
      body { /* body 태그 전체 */
        font-family: Arial, sans-serif;
        margin: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        overflow-x: hidden;
      }

      header { /* header 태그 전체 */
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
        background-color: #333333;
        color: white;
      }

      .page-title { /* 페이지 제목*/
        font-size: 2em; /* 페이지 이름을 크게 */
        font-weight: bold;
        margin-left: 30px;
        display: flex;
      }

      a { /* a 태그 전체 */
        color: inherit; /* 부모 요소의 글자색과 일치 */
        text-decoration: none;
      }

      header a { /* header 태그 내 a 태그 */
        color: white;
        text-decoration: none;
      }

      .main-title {
        font-weight: bold;
        font-size: 1.5em;
        color: #333333;
      }

      .container { /* container 클래스 */
        width: 80%;
        margin: 20px auto;
        margin-top: 10px;
        margin-bottom: 0;
        max-width: 1000px;
        padding: 20px;

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

      .button-container { /* 버튼 정렬을 위한 컨테이너 클래스 */
        width: 100%;
        display: flex;
        justify-content: flex-end;
        margin: 0px auto;
        margin-top: 20px;
      }

      .button-container button { /* container 클래스 내 button 태그 */
        margin-right: 5%;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border-radius: 5px;
        cursor: pointer;
      }

      .button-container button:hover { /* 버튼에 커서 올렸을 때 */
        background-color: #0051A8;
      }

      .divider { /* 로그인, 회원가입 구분자를 위한 클래스 */
        color: white;
        margin-left: 10px;
        margin-right: 10px;
      }

      nav { /* 네비게이터 nav 태그 전체 */
        width: 100%;
        background-color: #007bff;
        color: white;
        padding: 10px 0;
        position: fixed;
        bottom: 0;
      }

      nav ul { /* nav 태그 내 ul 태그 */
        list-style-type: none;
        display: flex;
        justify-content: space-around;
        margin: 0;
        padding: 0;
      }

      /* Pagination 스타일 */
      .pagination {
          display: flex;
          justify-content: center;
          margin-bottom: 20px;
          font-family: Arial, sans-serif;
      }

      .pagination a, .pagination span {
          margin: 0 5px;
          padding: 8px 12px;
          text-decoration: none;
          border: 1px solid #ddd;
          color: #007bff;
          border-radius: 4px;
      }

      .pagination a:hover {
          background-color: #007bff;
          color: white;
      }

      .pagination .current-page {
          font-weight: bold;
          background-color: #007bff;
          color: white;
          border: none;
      }
    </style>
</head>
<body>
<header>
    <a class="page-title" href="/">
        <div class="" style="color: #0082CC;">TUK&nbsp;</div>
        Team Gem</a>
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
    <div class="main-title">지원 가능한 팀 목록</div>
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
            <c:forEach var="team" items="${teams}">
                <tr>
                    <td>${team.id}</td>
                    <td><a href="/team/${team.id}">${team.name}</a></td>
                    <td>${team.numberOfParticipant}/${team.capacity}</td>
                    <td>${team.field}</td>
                    <td>
                        <span class="status" data-duedate="${team.dueDate}"></span>
                    </td>
                    <td>${team.dueDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
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

    <div class="button-container">
        <button onclick="location.href='/registerMember-page'">모집하기</button>
    </div>

</div>

<!-- Pagination -->
<div class="pagination">
    <!-- 첫 페이지 및 이전 페이지 링크 -->
    <c:if test="${currentPage > 1}">
        <a href="?page=0" aria-label="First Page">&laquo;</a> <!-- 첫 페이지 -->
        <a href="?page=${currentPage - 2}" aria-label="Previous Page">&lt;</a> <!-- 이전 페이지 -->
    </c:if>

    <!-- 동적 페이지 번호 생성 -->
    <c:set var="startPage" value="${currentPage - 3}" />
    <c:set var="endPage" value="${currentPage + 3}" />

    <!-- 시작 페이지가 1보다 작으면 조정 -->
    <c:if test="${startPage < 1}">
        <c:set var="startPage" value="1" />
    </c:if>

    <!-- 종료 페이지가 totalPages보다 크면 조정 -->
    <c:if test="${endPage > totalPages}">
        <c:set var="endPage" value="${totalPages}" />
    </c:if>

    <!-- 페이지 번호 반복 -->
    <c:forEach var="page" begin="${startPage}" end="${endPage}">
        <c:choose>
            <c:when test="${page == currentPage}">
                <span class="current-page">${page}</span> <!-- 현재 페이지 -->
            </c:when>
            <c:otherwise>
                <a href="?page=${page - 1}" aria-label="Go to page ${page}">${page}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <!-- 다음 페이지 및 마지막 페이지 링크 -->
    <c:if test="${currentPage < totalPages}">
        <a href="?page=${currentPage}" aria-label="Next Page">&gt;</a> <!-- 다음 페이지 -->
        <a href="?page=${totalPages - 1}" aria-label="Last Page">&raquo;</a> <!-- 마지막 페이지 -->
    </c:if>
</div>
<!-- 경고 메시지 박스 -->
<c:if test="${hasError}">
<div class="alert-box">
        <p>${errorMessage}</p>
</div>
</c:if>

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