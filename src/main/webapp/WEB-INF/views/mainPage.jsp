<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tuk-Team-Gem</title>
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
        
        .table-border {
        	border-radius: 10px;
        	background-color: #333333;
        	padding: 1px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        table {  /* table 태그 전체 */
  			border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            width: 100%;
        }

        th, td {  /* th, td 태그 전체 */
            padding: 15px;
            text-align: center;
        }

        th {  /* th 태그 전체 */
            background-color: #333333;
            color: white;
        }

        tr:nth-child(even) {  /* 짝수번째 행일 경우 */
            background-color: #D6F4FF;
        }

        tr:nth-child(odd) {  /* 홀수번째 행일 경우 */
            background-color: #F9F9F9;
        }

        .status-open {  /* open상태(모집중) 클래스 */
            color: green;
            font-weight: bold;
        }

        .status-closed {  /* closed상태(모집종료) 클래스 */
            color: red;
            font-weight: bold;
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
    	<div class="main-title">팀 목록</div>
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
	                <tr>
	                    <td>3</td>
	                    <td><a href="#">프로젝트 C</a></td>
	                    <td>0/5</td>
	                    <td>백엔드 개발</td>
	                    <td class="status-open">모집중</td>
	                    <td>2024.11.12 오후 11:59</td>
	                </tr>
	                <tr>
	                    <td>2</td>
	                    <td><a href="#">프로젝트 B</a></td>
	                    <td>4/4</td>
	                    <td>디자인</td>
	                    <td class="status-closed">종료</td>
	                    <td>2024.11.06 오전 2:59</td>
	                </tr>
	                <tr>
	                    <td>1</td>
	                    <td><a href="#">프로젝트 A</a></td>
	                    <td>2/3</td>
	                    <td>임베디드</td>
	                    <td class="status-closed">종료</td>
	                    <td>2024.10.30 오후 12:00</td>
	                </tr>
	            </tbody>
	        </table>
        </div>
    </div>
    <div class="button-container">
        <button>모집하기</button>
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