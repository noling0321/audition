<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<h1>멘토점수조회</h1>
<body>
<table border="1">
	<tr>
		<td>채점번호</td>
		<td>참가번호</td>
		<td>참가자명</td>
		<td>생년월일</td>
		<td>점수</td>
		<td>평점</td>
		<td>멘토</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "sdh11", "1234");
		Statement stmt = conn.createStatement();
		String query = "SELECT POINT.SERIAL_NO, ARTIST.ARTIST_ID, ARTIST.ARTIST_NAME, ARTIST_BIRTH, POINT.POINT, POINT.POINT, MENTO.MENTO_NAME "+
				"FROM tbl_artist_201905 ARTIST, tbl_mento_201905 MENTO, tbl_point_201905 POINT "+
				"WHERE ARTIST.ARTIST_ID = point.artist_id AND mento.mento_id = point.mento_id "+
				"ORDER BY SERIAL_NO ASC";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getInt(4) %></td>
				<td><%= rs.getString(5) %></td>
				<td><% if(rs.getInt(6) >= 90) { 
					out.print("A");
				} else if(rs.getInt(6) >= 80) {
					out.print("B");
				} else if(rs.getInt(6) >= 70) {
					out.print("C");
				} else if(rs.getInt(6) >= 60) {
					out.print("D");
				} else {
					out.print("F");
				}
				%></td>
				<td><%= rs.getString(7) %></td>
			</tr>
			<%
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
</body>
</html>