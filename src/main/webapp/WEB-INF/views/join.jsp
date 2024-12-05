<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow-x: hidden;
        }

        header {
            width: 100%;
            display: flex;
            justify-content: flex-end;
            padding: 10px 20px;
            background-color: #333;
            color: white;
        }

        header a {
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

        nav {
            width: 100%;
            background-color: #007bff;
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

        nav ul li a {
            color: white;
            text-decoration: none;
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
        <a href="login.jsp">로그인</a>
        <span class="divider">|</span>
        <a href="#" style="margin-right: 50px;">회원가입</a>
    </header>

    <div class="container">
        <h2>회원가입</h2>
            <form method="post" action="join.jsp">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>

                <label for="loginId">아이디</label>
                <input type="text" id="loginId" name="loginId" placeholder="아이디를 입력하세요" required>

                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>

				<label for="confirmPassword">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호를 다시 입력하세요" required>

                <label for="email">이메일</label>
                <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required>

                <input type="submit" value="회원가입">
            </form>
    </div>

    <nav>
        <ul>
            <li><a href="#">내 팀</a></li>
            <li><a href="#">홈</a></li>
            <li><a href="#">지원 현황</a></li>
        </ul>
    </nav>
</body>
</html>