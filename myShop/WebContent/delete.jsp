<%@ page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	ProductDAO dao = new ProductDAO();
	dao.delete(id);
	out.print("물품을 삭제합니다.");
%>

</body>
</html>