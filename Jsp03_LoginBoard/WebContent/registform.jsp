<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="com.login.dto.MyMemberDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function idConfirm(){
		let nameInput = document.getElementsByName("myid")[0];
		if(nameInput.title == "n"){
			alert("아이디 중복체크를 해주세요");
			nameInput.focus();
		}
	}
	function idChk(){
		let doc = document.getElementsByName("myid")[0];
		if(doc.value.trim()=="" || doc.value==null){
			alert("아이디를 입력해 주세요.");
		}else{
			let target="membercontroller.jsp?command=idChk&myid="+doc.value.trim();
			window.open(target,"","width=200,height=200");
		}
	}
</script>
</head>
<body>
<h1>회원가입</h1>
<form action="membercontroller.jsp" method="post">
	<input type="hidden" name="command" value="insertuser">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="myid" title="n" required="required">
				<input type="button" value="중복체크" onclick="idChk();">			
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="text" name="mypw" onclick="idConfirm();" required="required">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="myname" onclick="idConfirm();" required="required">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="myaddr" onclick="idConfirm();" required="required">
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" name="myphone" onclick="idConfirm();" required="required">
			</td>
		</tr>
		<tr>
			<th>email</th>
			<td>
				<input type="text" name="myemail" onclick="idConfirm();" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="가입">
			</td>
		</tr>
	</table>
</form>

</body>
</html>