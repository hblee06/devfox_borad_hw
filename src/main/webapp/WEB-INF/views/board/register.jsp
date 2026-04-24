<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
<div>
<div>
<div>
<div>

<form role ="form" action="/board/register" method="post">
<div><label>Title</label> <input name='title'> </div>
<div><lable>Text area</lable><textarea rows="3" name='content'></textarea></div>
<div><lable>Writer</lable><input name='writer'></div>
<button type="submit">Submit Button</button>
<button type="reset">Reset Button</button>
</form>

</div>
</div>
</div>
</div>
</div>

</body>
</html>