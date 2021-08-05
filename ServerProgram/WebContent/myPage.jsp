<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>${loginDTO.name}님 환영합니다.</h3>
	
	<a href="logout.do">로그아웃</a>
	<br><br>
	
	<form>
		아이디  ${loginDTO.id}<br>
		이름  <input type="text" name="name" value="${loginDTO.name}"> <br>
		등급  ${loginDTO.grade}<br>
		포인트  <input type="text" name="point" value="${loginDTO.point}"><br>
		<input type="hidden" name="no" value="${loginDTO.no}">
		<input type="button" value="수정하기" onclick="fn_update(this.form)"> 
	</form>
	
	<script type="text/javascript">
		function fn_update(f){
			f.action = 'update.do';
			f.submit();
		}
	</script>
</body>
</html>