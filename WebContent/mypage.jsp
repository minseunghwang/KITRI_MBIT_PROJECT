<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User2DAO"%>
<%@ page import="user.User2"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>my page</title>

<!-- Bootstrap core CSS -->
<link href="./Resource/css/bootstrap.min.css" rel="stylesheet">
<link href="./Resource/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./Resource/css/custom.css" rel="stylesheet">

</head>
<body style="background-color: antiquewhite";>

	<%@ include file="Navigation.jsp"%>


	<!-- Page Content -->

	<%
		String u_id = null;
	if (session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");

	}

	if (u_id == null) {
		session.setAttribute("messageType", "오류메시지");
		session.setAttribute("messageContent", "현재 로그인이 되어있지 않습니다.");
		response.sendRedirect("login.jsp");
		return;
	}

	User2DAO user2DAO = new User2DAO();
	ArrayList<User2> list = user2DAO.getUserinfo((String) session.getAttribute("u_id"));
	%>



	<div class="container">
		<div class="row" style="position: relative;">
			<div class="col-lg-1"></div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9" style="text-align: center";>
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel" style="text-align: -webkit-center;">

					<div class="card-body col-lg-5">

							<h3 style="text-align: center;">회원정보 수정</h3>
							
							<img src="./upload/<%=list.get(0).getU_img()%>" style="margin-top:30px;" width=150 height=150></img>
							
								<form action="upload.jsp" method="post" enctype="multipart/form-data">
								<span class="btn btn-default" style="margin-left:95px;"><input type="file" name="file"></span>
								<input type="submit" class="btn btn-outline-secondary form-control" value="사진 등록" style="margin-bottom:30px;">
								</form>
					
								
								<form method="post" action="updateAction.jsp">
							<div class="form-group">
								<input type="text" class="form-control"
									value="<%=list.get(0).getU_id()%>" name="u_id" maxlength="20" readonly>

								<a style="font-size: 13px; color: #F3969A; font-weight: bold;">
									* 아이디는 수정할 수 없습니다.</a>
							</div>
							<div class="form-group">
								<input type="password" class="form-control"
									placeholder="비밀번호 : <%=list.get(0).getU_pw()%>" name="u_pw"
									maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="이름"
									value="<%=list.get(0).getU_name()%>" name="u_name"
									maxlength="20">
							</div>
							<div class="form-group" style="text-align: center;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-secondary"> <input type="radio"
										name="u_gender" autocomplete="on" value="남자"
										<%if (list.get(0).getU_gender().equals("남자"))
										System.out.print("checked");%>>남자
									</label> <label class="btn btn-secondary"> <input type="radio"
										name="u_gender" value="여자"
										<%if (list.get(0).getU_gender().equals("여자"))
										System.out.print("checked");%>>여자
									</label>
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="나이 "
									value="<%=list.get(0).getU_age()%>" name="u_age" maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="주소"
									value="<%=list.get(0).getU_loc()%>" name="u_loc" maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="취미"
									value="<%=list.get(0).getU_hobby()%>" name="u_hobby"
									maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="특기 "
									value="<%=list.get(0).getU_talent()%>" name="u_talent"
									maxlength="20">
							</div>

							<div>
								<select id="selectBox" name="u_mbti"
									style="margin-bottom: 15px; padding: 5px; width: 300px">
									<option value="<%=list.get(0).getU_mbti()%>">나의 유형 :<%=list.get(0).getU_mbti()%>
									</option>
									<option value="INTJ">INTJ</option>
									<option value="INTP">INTP</option>
									<option value="ENTJ">ENTJ</option>
									<option value="ENTP">ENTP</option>
									<option value="INFJ">INFJ</option>
									<option value="INFP">INFP</option>
									<option value="ENFJ">ENFJ</option>
									<option value="ENFP">ENFP</option>
									<option value="ISTJ">ISTJ</option>
									<option value="ISFJ">ISFJ</option>
									<option value="ESTJ">ESTJ</option>
									<option value="ESFJ">ESFJ</option>
									<option value="ISTP">ISTP</option>
									<option value="ISFP">ISFP</option>
									<option value="ESTP">ESTP</option>
									<option value="ESFP">ESFP</option>
								</select>
							</div>
							
							<input type="submit" class="btn btn-secondary form-control" value="수정하기" style="margin-bottom:10px;">
						</form> 
							 
					</div>

				</div>
			</div>
			<!-- /.col-lg-9 -->

			<div class="col-lg-1"></div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	</footer>

	<%@ include file="Footer.jsp"%>


	<!-- Bootstrap core JavaScript -->
	<script src="./Resource/jquery/jquery.min.js"></script>
	<script src="./Resource/js/bootstrap.bundle.min.js"></script>

</body>
</html>