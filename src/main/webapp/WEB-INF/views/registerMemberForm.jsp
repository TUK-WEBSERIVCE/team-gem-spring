<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>팀원 모집</title>
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

        .divider {
            color: white;
            margin-left: 10px;
            margin-right: 10px;
        }

        .page-title {
            font-size: 2em;
            font-weight: bold;
            margin-left: 30px;
            display: flex;
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
        }

        .container {
            width: 80%;
            margin: 20px auto;
            margin-top: 10px;
            margin-bottom: 0;
            max-width: 1000px;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 10px; /* 간격 조정 */
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 1em;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 1em;
            font-family: Arial, sans-serif;
        }

        .form-control:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        textarea.form-control {
            resize: none;
        }

        .date-container {
            display: flex;
            gap: 10px; /* 날짜와 시간 간격 조정 */
            align-items: center;
        }

        .button-container {
            width: 100%;
            display: flex;
            justify-content: flex-end;
            margin: 0px auto;
        }

        .button-container button {
            margin-right: 20%;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .button-container button:hover {
            background-color: #0051A8;
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
    <a class="page-title" href="/"><div class="" style="color: #0082CC;">TUK&nbsp;</div>Team Gem</a>
    <div class="account-container">
        <a href="/login-page">로그인</a>
        <span class="divider">|</span>
        <a href="/member/register-form" style="margin-right: 30px;">회원가입</a>
    </div>
</header>

<div class="container">
    <div class="main-title">모집하기</div>
    <hr>
    <form>
        <!-- 제목 입력 -->
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" class="form-control" />
        </div>

        <!-- 모집 인원 입력 -->
        <div class="form-group">
            <label for="recruitment">모집 인원</label>
            <input type="number" id="recruitment" name="recruitment" class="form-control" />
        </div>

        <!-- 분야 입력 -->
        <div class="form-group">
            <label for="field">분야</label>
            <input type="text" id="field" name="field" class="form-control" />
        </div>

        <!-- 마감일 및 시간 입력 -->
        <div class="form-group">
            <label for="deadline">마감일</label>
            <div class="date-container">
                <input type="date" id="deadline" name="deadline" class="form-control" />
                <input type="time" id="deadline-time" name="deadline-time" class="form-control" />
            </div>
        </div>

        <!-- 설명 입력 -->
        <div class="form-group">
            <label for="description">설명</label>
            <textarea id="description" name="description" rows="5" class="form-control"></textarea>
        </div>
    </form>
</div>

<div class="button-container">
    <button>등록</button>
</div>

<nav>
    <ul>
        <li><a href="/myTeam-page">&nbsp;&nbsp;&nbsp;내 팀&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="/">홈</a></li>
        <li><a href="/apply-page">지원 현황</a></li>
    </ul>
</nav>

<script>
    // 오늘 날짜 및 현재 시간을 기본값으로 설정
    const today = new Date();
    const formattedDate = today.toISOString().split("T")[0];
    const formattedTime = today.toTimeString().split(":").slice(0, 2).join(":");

    document.getElementById("deadline").value = formattedDate;
    document.getElementById("deadline-time").value = formattedTime;
</script>
</body>
</html>
