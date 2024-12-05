<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    .comment-form button {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
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
        <div class="main-title">프로젝트 이름</div><!-- 샘플 데이터 -->
        <hr>

        <div>
            <h3>지원자 목록</h3>
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

        <!-- 댓글 창 -->
        <div class="comment-section">
            <h3>소통 창구</h3>
            <div class="comment-box">
                <div class="comment-item"><!-- 샘플 데이터 -->
                	<span class="comment-at">2024-11-21 16:55</span>
			        <span class="nickname">Choi:</span>
			        <span class="message">안녕하세요!</span>
                </div>
                <div class="comment-item"><!-- 샘플 데이터 -->
                	<span class="comment-at">2024-11-21 16:58</span>
                	<span class="nickname">Song:</span>
			        <span class="message">반갑습니다.</span>
                </div>
            </div>
            <div class="comment-form">
                <input type="text" placeholder="댓글을 입력하세요">
                <button style="background-color: #333333; color: white;">등록</button>
            </div>
        </div>
    </div>
    
    <!-- 하단 네비게이션 바 -->
    <nav>
        <ul>
            <li><a href="/myTeam-page">&nbsp;&nbsp;&nbsp;내 팀&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="/">홈</a></li>
            <li><a href="/apply-page">지원 현황</a></li>
        </ul>
    </nav>
</body>
</html>
