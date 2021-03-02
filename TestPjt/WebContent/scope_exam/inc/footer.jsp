<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%--
입력한 꼬릿말 정보를 RequestScopeBean자바빈 객체에 저장
--%>
<jsp:useBean id="req" class="mybean.scope.RequestScopeBean" scope="request"/>
<jsp:getProperty property="footer" name="req"/>