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
            color: #007bff;
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
        
        * {
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box; /* 모든 요소에 적용 */
		}
    </style>
</head>
<body>
    <header>
        <div class="page-title"><div class="" style="color: #0082CC;">TUK&nbsp;</div>Team Gem</div>
        <div class="account-container">
            <a href="#">로그인</a>
            <span class="divider">|</span>
            <a href="/member/register-form" style="margin-right: 30px;">회원가입</a>
        </div>
    </header>

    <div class="container">
        <h2>로그인</h2>
            <form method="post" action="/member/login">
                <label for="loginId">아이디</label>
                <input type="text" id="loginId" name="loginId" placeholder="아이디를 입력하세요" required>

                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>

                <input type="submit" value="로그인">
            </form>
    </div>

    <nav>
        <ul>
            <li><a href="/myTeam-page">&nbsp;&nbsp;&nbsp;내 팀&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="/">홈</a></li>
            <li><a href="/apply-page">지원 현황</a></li>
        </ul>
    </nav>
</body>
</html>