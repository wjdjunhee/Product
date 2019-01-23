<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="product.ProductDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	ProductDAO dao = new ProductDAO();
	dao.update(dto);
%>
id: <%= dto.getId() %><br>
title: <%= dto.getTitle() %><br>
content: <%= dto.getContent() %><br>
price: <%= dto.getPrice() %><br>

업데이트가 요청되었습니다.
</body>
</html>