<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="yellow">
	<%
		String id = request.getParameter("id");
			ProductDAO dao = new ProductDAO();
			ProductDTO dto = dao.select(id);
	%>
	
	
		<font color="red" size="6">상품정보 확인</font>
		<hr>
		<form action="update.jsp">
		<table>

			<tr align="center">
				<td bgcolor="yellow" width="100">아 이 디</td>
				<td bgcolor="green" width="300">
					<input type="text" name="id" value="<%= dto.getId() %>" readonly="readonly" size="45"> <!-- 표현식:expression-->
				</td>
			</tr>
			<tr align="center">
				<td bgcolor="yellow" width="100">상품제목</td>
				<td bgcolor="green" width="300">
					<input type="text" name="title" 
					size="45" value="<%= dto.getTitle() %>">
				</td>
			</tr>
			<tr align="center">
				<td bgcolor="yellow" width="100">상품설명</td>
				<td bgcolor="green" width="300">
					<input type="text" name="content" 
					size="45" value="<%= dto.getContent() %>">
				</td>
			</tr>
			<tr align="center">
				<td bgcolor="yellow" width="100">가격</td>
				<td bgcolor="green" width="300">
					<input type="text" name="price" 
					size="45" value="<%= dto.getPrice() %>">
				</td>
			</tr>
	
		</table>
		</form>
		
	<a href="insert.html">상품등록</a><br>
	<a href="update.html">상품수정</a><br>
	<a href="delete.html">상품삭제</a><br>
	<a href="select.html">상품검색</a><br>
	<a href="selectAll.jsp">상품전체검색</a><br>
</body>
</html>