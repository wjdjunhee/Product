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
   
   <!-- 액션 태그 사용 -->
    <jsp:useBean id="dto" class="product.ProductDTO">
    
       <!-- dto에 있는 set메소드를 자동 호출 *-- 모두 다 호출 -->
       <jsp:setProperty name="dto" property="*"/>
    </jsp:useBean>
    
    <%
        	ProductDAO dao = new ProductDAO();
               dao.insert(dto);
        %>
    
    <jsp:getProperty property="id" name="dto"/>
    
      <font color="blue" size="6">상품등록 확인</font>
      <hr>
      <table>
         <tr align="center">
            <td bgcolor="yellow" width="100">항&nbsp;&nbsp;&nbsp;&nbsp;목</td>
            <td bgcolor="green" width="300">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
         </tr>
         <tr align="center">
            <td bgcolor="yellow" width="100">아 이 디</td>
            <td bgcolor="green" width="300">
               <%= dto.getId() %> <!-- 표현식:expression-->
            </td>
         </tr>
         <tr align="center">
            <td bgcolor="yellow" width="100">상품제목</td>
            <td bgcolor="green" width="300">
               <%= dto.getTitle() %>
            </td>
         </tr>
         <tr align="center">
            <td bgcolor="yellow" width="100">상품설명</td>
            <td bgcolor="green" width="300">
               <%= dto.getContent() %>
            </td>
         </tr>
         <tr align="center">
            <td bgcolor="yellow" width="100">가격</td>
            <td bgcolor="green" width="300">
               <%= dto.getPrice() %>
            </td>
         </tr>
      </table>
      
    <a href="insert.html">상품등록</a><br>
	<a href="update.html">상품수정</a><br>
	<a href="delete.html">상품삭제</a><br>
	<a href="select.html">상품검색</a><br>
	<a href="selectAll.jsp">상품전체검색</a><br>
      
</body>
</html>