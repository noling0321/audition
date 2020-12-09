<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3 style="text-align: center; ">판매등록</h3>

<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "sdh11", "1234");
%>

<script>
function submit_form() {
	if (document.input_form.member_no.value === "") {
		alert("참가번호가 입력되지 않았습니다!");
		return;
	}
	if (document.input_form.member_name.value === "") {
		alert("참가자명이 입력되지 않았습니다!");
		return;
	}
	if (document.input_form.birth_year.value === "" || document.input_form.birth_month.value === "" || document.input_form.birth_day.value === "") {
		alert("생년월일이 입력되지 않았습니다!");
		return;
	}
	if (document.input_form.gender.value === "") {
		alert("성별이 선택되지 않았습니다!");
		return;
	}
	if (document.input_form.talent.value === "") {
		alert("특기가 선택되지 않았습니다!");
		return;
	}
	if (document.input_form.agency.value === "") {
		alert("소속사가 입력되지 않았습니다!");
		return;
	}
	alert("참가신청이 정상적으로 등록 되었습니다!");
	document.input_form.submit();
}
function reset_form() {
	alert("참가신청이 정상적으로 등록 되었습니다!");
	document.input_form.reset();
}
</script>
<h1>오디션 등록</h1>
<form action="action/registry_member.jsp" method="post" name="input_form">
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>
				<input type="text" name="member_no">
			</td>
		</tr>
		<tr>
			<td>참가자명</td>
			<td><input type="text" name="member_name" /></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="birth_year" />년
			<input type="text" name="birth_month" />월
			<input type="text" name="birth_day" />일
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="radio" name="gender" value="M">남성
			<input type="radio" name="gender" value="F">여성
			</td>
		</tr>
		<tr>
			<td>특기</td>
			<td>
				<select name="talent">
					<option value="보컬">보컬</option>
					<option value="댄스">댄스</option>
					<option value="랩">랩</option>
				</select>
			<td>
		</tr>
		<tr>
			<td>소속사</td>
			<td><input type="text" name="agency" />
			</td>
		</tr>
		<tr>
			<td colspan="2" >
				<input type="button" value="동록하기" onclick="submit_form()" />
				<input type="button" value="다시쓰기" onclick="reset_form()" />
			</td>
		</tr>
	</table>
</form>
<%
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>