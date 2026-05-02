<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>

<body>

	<h1>Login Page</h1>

	<form action="${pageContext.request.contextPath}/login" method="post">

		<div>
			USERNAME <input name="username">
		</div>

		<div>
			PASSWORD <input type="password" name="password">
		</div>

		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		<button type="submit">Login</button>

		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/member/join'">
			Sign Up</button>
	</form>

	<c:if test="${param.error != null}">
		<div>Login Error.</div>
	</c:if>

	<c:if test="${param.logout != null}">
		<div>Logout Complete.</div>
	</c:if>

</body>
</html>