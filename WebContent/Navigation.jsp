<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="text-align: center;" >
	



	<a class="navbar-brand" href="/login.jsp" style="padding-left:25%"><strong>MBTI MATE</strong></a>
      <%
      	String id = (String)session.getAttribute("u_id");
      	if(id != null && id != "") {
      		
   		%>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" 
  aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01" style="padding-left:10%">
    <ul class="navbar-nav mr-auto" >
      <li class="nav-item">
        <a class="nav-link" href="/index.jsp">친구목록<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/board/list.jsp">게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/mypage.jsp">회원정보</a>
      </li>

      		<li class="nav-item">
        	<a class="nav-link" href="/logoutAction.jsp">로그아웃</a>
      	</li>

    </ul>
    
  </div>
  	<%          
      	} 
      	%> 
</nav>

</body>
</html>