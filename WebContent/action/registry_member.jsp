<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

String m_no = request.getParameter("member_no");
String m_name = request.getParameter("member_name");
String birth = request.getParameter("birth_year") + request.getParameter("birth_month") + request.getParameter("birth_day");
String gender = request.getParameter("gender");
String talent = request.getParameter("talent");
String agency = request.getParameter("agency");

try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe", "sdh11", "1234");
	Statement stmt = conn.createStatement();
	
	String query = "INSERT INTO TBL_ARTIST_201905 VALUES ('%s','%s','%s','%s','%s','%s');";
	
	ResultSet rs = stmt.executeQuery(String.format(query, m_no, m_name, birth, gender, talent, agency));
	
	conn.commit();
	
	stmt.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("../index.jsp");
%>