<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체상품검색</title>
</head>
<body>
<jsp:useBean id="dao" class="product.ProductDAO"></jsp:useBean>
<%
   ArrayList<ProductDTO> list = dao.selectAll();
   out.print("전체 상품 수는 : " + list.size() + "<br>");
   %>
   <table border="1">
   <tr>
      <td>아이디</td>
      <td>상품제목</td>
      <td>상품설명</td>
      <td>가격</td>
   </tr>
   
   <%
   for(int i = 0; i < list.size(); i++){
      ProductDTO dto = list.get(i);
   %>
   <tr>
      <td><%= dto.getId() %></td>
      <td><%= dto.getTitle() %></td>
      <td><%= dto.getContent() %></td>
      <td><%= dto.getPrice() %></td>
   </tr>
   <%   
   }
   /* for(int i = 0; i < list.size(); i++){
      MemberDTO dto = list.get(i);
      out.print("id: " + dto.getId() + ",&nbsp;");
      out.print("pw: " + dto.getPw()  + ",&nbsp;");
      out.print("name: " + dto.getName()  + ",&nbsp;");
      out.print("tel: " + dto.getTel()  + "&nbsp;");
      out.print("<br>");
   } */
%>
</table>

	<a href="insert.html">상품등록</a><br>
	<a href="update.html">상품수정</a><br>
	<a href="delete.html">상품삭제</a><br>
	<a href="select.html">상품검색</a><br>
	<a href="selectAll.jsp">상품전체검색</a><br>

</body>
</html>