<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원하기</title>
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

        .container {  
			width: 80%;
        	margin: 20px auto;
        	margin-top: 10px;
            max-width: 1000px;
            padding: 20px;
            text-align: center; /* 전체 내용 가운데 정렬 */
        }       

        .form-group {
            margin: 20px 0;
        }

        .form-group label {
            display: block;
            font-size: 1.2em;
            margin-bottom: 10px;
            text-align: left; /* 글씨 왼쪽 정렬 */
        }

        .form-group input,
        .form-group textarea {
            width: 100%; /* 부모 요소 너비에 맞춤 */
            max-width: 100%; /* 레이아웃 깨짐 방지 */
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; /* 패딩 포함 계산 */
        }

        .form-group textarea {
		    font-size: 16px; /* 글자 크기 */
		    line-height: 1.5; /* 줄 간격 */
		    resize: none; /* 크기 조정 비활성화 */
        }

        .button-container {  
            display: flex;
            justify-content: center;
        }

        .button-container button {  
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        .button-container button:hover {  
            background-color: #0051A8;
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
    	<div class="main-title">지원</div>
    	<hr>
    	
    	<div class="form-group">
    	    <label for="field">지원 분야</label>
    	    <input type="text" id="field" name="field" placeholder="지원 분야를 입력해주세요.">
			<br><br>
    	    <label for="introduction">자기소개</label>
    	    <textarea id="introduction" name="introduction" rows="6" placeholder="자기소개를 입력해주세요."></textarea>
    	</div>
    	
    	<div class="button-container">
        	<button>참여하기</button>
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
