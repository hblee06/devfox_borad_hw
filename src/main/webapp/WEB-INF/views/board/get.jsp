<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

						<div>
							<label>Bno</label><input name='bno'
								value='<c:out value="${board.bno}"/>' readonly="readonly">
						</div>
						<div>
							<label>Title</label><input name='title'
								value='<c:out value="${board.title}"/>' readonly="readonly">
						</div>
						<div>
							<lable>Text area</lable>
							<textarea rows="3" name='content' readonly="readonly"><c:out
									value="${board.content}" /></textarea>
						</div>
						<div>
							<lable>Writer</lable>
							<input name='writer' value='<c:out value="${board.writer}"/>'
								readonly="readonly">
						</div>
						<button data-oper='modify'>Modify</button>
						<button data-oper='list'>List</button>

						<form id='operForm' action="/board/modify" method="get">
							<input type='hidden' id='bno' name='bno'
								value='<c:out value ="${board.bno}"/>'>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var operForm =$("#operForm");

	$("button[data-oper='modify']").on("click", function(e){
	operForm.attr("action","/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.attr("action","/board/list")
		operForm.submit();
	});
	
});
</script>


</body>
</html>