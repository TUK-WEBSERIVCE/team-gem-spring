<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="page-title"><div class="" style="color: #0082CC;">TUK&nbsp;</div>Team Gem</div>
		<div class="account-container">
	        <a href="#">로그인</a>
	        <span class="divider">|</span>
	        <a href="#" style="margin-right: 30px;">회원가입</a>
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