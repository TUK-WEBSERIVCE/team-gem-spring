<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모집목록 상세</title>
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
        }

        .container {
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

        table {
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            width: 100%;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
        	background-color: #333333;
            color: white;
            width: 30%; /* 너비 비율 설정 */
            border-bottom: 1px solid #666666;
        }
        
        tr:last-child th {
            border-bottom: none; /* 마지막 행 구분선 제거 */
        }

		tr:nth-child(even) {
		    background-color: #D6F4FF;
		}
		
		tr:nth-child(odd) {
		    background-color: #F9F9F9;
		}

        .status-open {
            color: green;
            font-weight: bold;
        }

        .status-closed {
            color: red;
            font-weight: bold;
        }

        .button-container {
            width: 100%;
            display: flex;
            justify-content: flex-end;
            margin: 0px auto;
			margin-top: 20px;
        }

        .button-container button {
            margin-right: 5%;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
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

        .project-description {
            margin-top: 20px;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .project-description strong {
            color: #333333;
        }
</style>
</head>
<body>
	<header>
		<a class="page-title" href="/"><div class="" style="color: #0082CC;">TUK&nbsp;</div>Team Gem</a>
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
    	<div class="main-title">팀 상세 내용</div>
    	<hr>
    	<div class="table-border">
        	<table>
	            <tbody><!-- 샘플 데이터 -->
	                <tr>
	                    <th class="th-style">제목</th>
	                    <td>${team.name}</td>
	                </tr>
	                <tr>
	                    <th>모집 인원</th>
	                    <td>${team.numberOfParticipant}/${team.capacity}</td>
	                </tr>
	                <tr>
	                    <th>분야</th>
	                    <td>${team.field}</td>
	                </tr>
	                <tr>
	                    <th>마감 여부</th>
	                    <td class="status-open"><span class="status" data-duedate="${team.dueDate}"></span></td>
	                </tr>
	                <tr>
	                    <th>마감일</th>
	                    <td>${team.dueDate}</td>
	                </tr>
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
        <div class="project-description"><!-- 샘플 데이터 -->
            <strong>프로젝트 설명:</strong> <br>
            ${team.description}
        </div>
		<div class="button-container">
			<button onclick="location.href='/team-members/join/${team.id}'">참여하기</button>
		</div>
    </div>
    
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
