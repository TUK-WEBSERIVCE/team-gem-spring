<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>팀원 모집</title>
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

    .button-container {  /* 버튼 정렬을 위한 컨테이너 클래스 */
        width: 100%;
        display: flex;
        justify-content: flex-end;
        margin: 0px auto;
    }

    .button-container button {  /* container 클래스 내 button 태그 */
        margin-right: 20%;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border-radius: 5px;
        cursor: pointer;
    }

    .button-container button:hover {  /* 버튼에 커서 올렸을 때 */
        background-color: #0051A8;
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
    <div class="page-title"><div class="" style="color: #0082CC;">TUK&nbsp;</div>Team Gem</div>
    <div class="account-container">
        <a href="#">로그인</a>
        <span class="divider">|</span>
        <a href="#" style="margin-right: 30px;">회원가입</a>
    </div>
</header>
<div class="container">
    <div class="main-title">모집하기</div>
    <hr>

    <div>
        <div class="applicant-list">
            <div class="applicant-item"><!-- 샘플 데이터 -->
                <span>Hong Gil-dong</span>
                <div class="applicant-buttons">
                    <button class="detail-btn">자세히보기</button>
                    <button class="approve-btn">승인</button>
                    <button class="reject-btn">거절</button>
                </div>
            </div>
            <div class="applicant-item"><!-- 샘플 데이터 -->
                <span>Son Heung-min</span>
                <div class="applicant-buttons">
                    <button class="detail-btn">자세히보기</button>
                    <button class="approve-btn">승인</button>
                    <button class="reject-btn">거절</button>
                </div>
            </div>
            <div class="applicant-item"><!-- 샘플 데이터 -->
                <span>Park Ji-sung</span>
                <div class="applicant-buttons">
                    <button class="detail-btn">자세히보기</button>
                    <button class="approve-btn">승인</button>
                    <button class="reject-btn">거절</button>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="button-container">
    <button>등록</button>
</div>

<!-- 하단 네비게이션 바 -->
<nav>
    <ul>
        <li><a href="#">&nbsp;&nbsp;&nbsp;내 팀&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="#">홈</a></li>
        <li><a href="#">지원 현황</a></li>
    </ul>
</nav>

</body>
</html>