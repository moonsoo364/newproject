<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:useBean id="req" class="mybean.scope.RequestScopeBean" scope="request"/>
 
<%--
    RequestScopeBean자바빈 객체의 getHeader()메서드를 이용하여...
    자바빈 객체 내부에 저장되어 있는 <form>태그에 입력한 header값 전달 받기
--%>
<jsp:getProperty property="header" name="req"/>