<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<h1>참가자목록조회</h1>
<body>
<table border="1">
	<tr>
		<td>참가번호</td>
		<td>참가자명</td>
		<td>총점</td>
		<td>평균</td>
		<td>등수</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "sdh11", "1234");
		Statement stmt = conn.createStatement();
		String query = "select artist.artist_id, artist.artist_name, SUM(point.point) total, avg(point.point) "+
				"from tbl_artist_201905 artist, tbl_point_201905 point, tbl_mento_201905 mento "+
				"where artist.artist_id = point.artist_id and mento.mento_id = point.mento_id "+
				"group by artist.artist_id, artist.artist_name "+
				"order by total desc";
		ResultSet rs = stmt.executeQuery(query);
		int i = 1;
		while (rs.next()) {
			%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getInt(3) %></td>
				<td><% out.print( String.format("%.2f", rs.getFloat(4))); %></td>
				<td><%= i%></td>
			</tr>
			<%
			i++;
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