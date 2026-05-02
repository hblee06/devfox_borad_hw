<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN PAGE</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>

<body>

	<h1>Join Page</h1>
	
	<c:if test="${not empty error}">
		<p style="color: red;">${error}</p>
	</c:if>

	<form action="${pageContext.request.contextPath}/member/join"
		method="post" accept-charset="UTF-8">

		<div>
			USERNAME <input name="username">
		</div>

		<div>
			PASSWORD <input type="password" name="password">
		</div>

		<div>
			NAME <input name="name">
		</div>

		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		<button type="submit">Join</button>

		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/customLogin'">
			Back</button>
	</form>

</body>
</html>