<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REGISTER PAGE</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

    <h1>Register Page</h1>

	<form role="form"
		action="${pageContext.request.contextPath}/board/register"
		method="post">

		<div>
			<label>Title</label> <input name="title">
		</div>

		<div>
			<label>Text area</label>
			<textarea rows="3" name="content"></textarea>
		</div>

		<div>
			<label>Writer</label> <input type="hidden" name="writer"
				value="${pageContext.request.userPrincipal.name}">

			${pageContext.request.userPrincipal.name} <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>

		<button type="submit">Submit Button</button>
		<button type="reset">Reset Button</button>
	</form>

</body>
</html>