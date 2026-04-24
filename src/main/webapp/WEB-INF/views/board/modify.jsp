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

<form role="form" action="/board/modify" method="post">
<div><label>Bno</label><input name='bno' value='<c:out value="${board.bno}"/>' readonly="readonly"> </div>
<div><label>Title</label><input name='title' value='<c:out value="${board.title}"/>'> </div>
<div><lable>Text area</lable><textarea rows="3" name='content'><c:out value="${board.content}"/></textarea></div>
<div><lable>Writer</lable><input name='writer' value='<c:out value="${board.writer}"/>' readonly="readonly"></div>
<div><lable>RegDate</lable><input name='regDate' value='<fmt:formatDate pattern= "yyyy/MM/dd" value="${board.regdate}"/>' readonly="readonly"></div>
<div><lable>Update Date</lable><input name='updateDate' value='<fmt:formatDate pattern= "yyyy/MM/dd" value="${board.updateDate}"/>' readonly="readonly"></div>

<button type="submit" data-oper='modify'>Modify</button>
<button type="submit" data-oper='remove'>Remove</button>
<button type="submit" data-oper='list'>List</button>
</form>

</div>
</div>
</div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var formObj = $("form");
							$('button').on("click", function(e){
								
								e.preventDefault();
								
								var operation = $(this).data("oper");
								
								console.log(operation);
								
								if(operation === 'remove'){
									formObj.attr("action", "/board/remove");
								} else if(operation === 'list') {
									//move to list
									formObj.attr("action", "/board/list").attr("method", "get");
									formObj.empty();
								}
								formObj.submit();
							});
						});
	</script>
</body>
</html>