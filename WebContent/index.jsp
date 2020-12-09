<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<link rel="stylesheet" href="css/css.css">
</head>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>

	<%
	switch(section){
		case "insert_sales":
			%><%@ include file="page/insert_audition.jsp" %><%
			break;
		case "lookup_totalpurchase":
			%><%@ include file="page/member_list.jsp" %><%
			break;
		case "products_status":
			%><%@ include file="page/member_ranking.jsp" %><%
			break;
		case "lookup_category_status":
			%><%@ include file="page/mento_list.jsp" %><%
			break;
		default:
			%><%@ include file="static/index.jsp" %><%
		}
	%>
	
	<%@ include file="static/footer.jsp" %>
</body>
</html>