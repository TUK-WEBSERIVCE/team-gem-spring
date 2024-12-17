<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 팀</title>
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
        margin-bottom: 20px;
      }

      .applicant-list {
        background-color: #D6F4FF;
        padding: 10px;
        border-radius: 5px;
        align-items: center; /* 상하 중앙 정렬 */
      }

      .applicant-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin: 5px;
        padding: 5px 0;
        border-bottom: 1px solid #ddd;
      }

      .applicant-item span {
        font-weight: bold;
      }

      .applicant-item:last-child {
        border-bottom: none;
      }

      .applicant-buttons button {
        margin-right: 5px;
        padding: 5px 10px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
      }

      .detail-btn {
        background-color: #444444;
        color: white;
      }

      .approve-btn {
        background-color: #4CAF50;
        color: white;
      }

      .reject-btn {
        background-color: #f44336;
        color: white;
      }

      .comment-section {
        margin-top: 20px;
        text-align: left;
      }

      .comment-box {
        background-color: #E6E6E6;
        padding: 10px;
        border-radius: 5px;
        min-height: 150px;
      }

      .comment-item {
        display: flex; /* Flexbox 사용 */
        align-items: center; /* 상하 중앙 정렬 */
        margin-bottom: 10px;
        font-size: 0.9em;
      }

      .comment-item .comment-at {
        color: #444444;
        margin-right: 15px;
      }

      .comment-item .nickname {
        font-weight: bold; /* 닉네임 강조 */
        margin-right: 5px; /* 내용과 간격 추가 */
        color: #007bff; /* 닉네임 색상 */
      }

      .comment-item .message {
        flex: 1; /* 나머지 공간 차지 */
      }

      .comment-form {
        margin-top: 10px;
        width: 100%;
      }

      .comment-form input {
        width: 90%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
      }

      .comment-form .submit-btn {
        width: 7%;
        background-color: #444444;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
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
    <div class="main-title">프로젝트 이름</div><!-- 샘플 데이터 -->
    <hr>

    <c:if test="${myTeam.isHost}">
        <div>
            <h3>지원자 목록</h3>
            <div class="applicant-list">
                <c:forEach var="teamMember" items="${myTeam.teamMembers}">
                    <c:if test="${teamMember.applicationStatus eq 'PENDING'}">
                        <div class="applicant-item"><!-- 샘플 데이터 -->
                            <span>${teamMember.member.nickname}</span>
                            <div class="applicant-buttons">
                                <button class="detail-btn" onclick="toggleDetails(${teamMember.id})">자세히보기</button>
                                <div id="details-${teamMember.id}" style="display: none;">
                                    <!-- 숨겨진 정보 내용 -->
                                    <p>분야: ${teamMember.field}</p>
                                    <p>자기 소개: ${teamMember.introduction}</p>
                                </div>
                                <form id="hiddenForm1" style="display: inline" action="/team-members/approve" method="POST">
                                    <!-- 요청 본문 데이터 -->
                                    <input type="hidden" name="memberId" value="${teamMember.member.id}">
                                    <input type="hidden" name="teamId" value="${teamMember.team.id}">

                                    <input type="submit" value="승인" class="approve-btn">
                                </form>
                                <form id="hiddenForm2" style="display: inline" action="/team-members/reject" method="POST">
                                    <!-- 요청 본문 데이터 -->
                                    <input type="hidden" name="memberId" value="${teamMember.member.id}">
                                    <input type="hidden" name="teamId" value="${teamMember.team.id}">

                                    <input type="submit" value="거절" class="reject-btn">
                                </form>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </c:if>

    <div>
        <h3>참여자 목록</h3>
        <div class="applicant-list">
            <c:forEach var="teamMember" items="${myTeam.teamMembers}">
                <c:if test="${teamMember.applicationStatus eq 'APPROVED'}">
                    <div class="applicant-item"><!-- 샘플 데이터 -->
                        <span>${teamMember.member.nickname}</span>
                        <div class="applicant-buttons">
                            <button class="detail-btn" onclick="toggleDetails(${teamMember.id})">자세히보기</button>
                            <div id="details-${teamMember.id}" style="display: none;">
                                <!-- 숨겨진 정보 내용 -->
                                <p>분야: ${teamMember.field}</p>
                                <p>자기 소개: ${teamMember.introduction}</p>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <!-- 댓글 창 -->
    <div class="comment-section">
        <h3>소통 창구</h3>
        <div class="comment-box">
            <c:forEach var="comment" items="${myTeam.comments}">
                <div class="comment-item"><!-- 샘플 데이터 -->
                    <span class="comment-at">${comment.createdAt}</span>
                    <span class="nickname">${comment.member.nickname}:</span>
                    <span class="message">${comment.content}</span>
                </div>
            </c:forEach>
        </div>
        <form method="post" action="/comment">
            <div class="comment-form">
                <input type="hidden" name="teamId" value="${myTeam.teamMembers.get(0).team.id}">
                <input type="text" id="content" name="content" placeholder="댓글을 입력하세요">
                <input class="submit-btn" type="submit" value="등록">
            </div>
        </form>
    </div>
</div>

<script>
  function toggleDetails(memberId) {
    const details = document.getElementById(`details-`+memberId);
    if (details.style.display === 'none') {
      details.style.display = 'block';
    } else {
      details.style.display = 'none';
    }
  }
</script>

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
