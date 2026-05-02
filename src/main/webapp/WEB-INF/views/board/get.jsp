<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONTENT PAGE</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

	<h1>Content Page</h1>

	<div>
		<label>Bno</label> <input name="bno"
			value='<c:out value="${board.bno}" />' readonly="readonly">
	</div>

	<div>
		<label>Title</label> <input name="title"
			value='<c:out value="${board.title}" />' readonly="readonly">
	</div>

	<div>
		<label>Text area</label>
		<textarea rows="3" name="content" readonly="readonly"><c:out
				value="${board.content}" /></textarea>
	</div>

	<div>
		<label>Writer</label> <input name="writer"
			value='<c:out value="${board.writer}" />' readonly="readonly">
	</div>

	<button data-oper="modify">Modify</button>
	<button data-oper="list">List</button>

	<form id="operForm"
		action="${pageContext.request.contextPath}/board/modify" method="get">

		<input type="hidden" id="bno" name="bno"
			value='<c:out value="${board.bno}" />'> <input type="hidden"
			name="pageNum" value='<c:out value="${cri.pageNum}" />'> <input
			type="hidden" name="amount" value='<c:out value="${cri.amount}" />'>

		<input type="hidden" name="keyword"
			value='<c:out value="${cri.keyword}" />'> <input
			type="hidden" name="type" value='<c:out value="${cri.type}" />'>
	</form>

	<hr>

	<h3>Reply</h3>

	<div>
		<c:out value="${pageContext.request.userPrincipal.name}" />
	</div>

	<div>
		<input type="text" name="reply" id="reply">
	</div>

	<button id="replyRegisterBtn" type="button">reply button</button>

	<hr>

	<div id="replyList"></div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript">
        $(document).ready(function() {

            var operForm = $("#operForm");

            $("button[data-oper='modify']").on("click", function(e) {
                e.preventDefault();

                operForm.attr(
                    "action",
                    "${pageContext.request.contextPath}/board/modify"
                );
                operForm.submit();
            });

            $("button[data-oper='list']").on("click", function(e) {
                e.preventDefault();

                operForm.find("#bno").remove();

                operForm.attr(
                    "action",
                    "${pageContext.request.contextPath}/board/list"
                );

                operForm.submit();
            });

        });
    </script>

	<script type="text/javascript">
        var bnoValue = '<c:out value="${board.bno}" />';
        var loginUser = '<c:out value="${pageContext.request.userPrincipal.name}" />';
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

        $(document).ready(function() {

            showList();

            $("#replyRegisterBtn").on("click", function() {

                var reply = $("#reply").val();

                if (loginUser === "") {
                    alert("ログインの後に登録可能です。");
                    return;
                }

                if (reply === "") {
                    alert("内容を入力してください。");
                    return;
                }

                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/replies/new",
                    data: JSON.stringify({
                        reply: reply,
                        replyer: loginUser,
                        bno: bnoValue
                    }),
                    contentType: "application/json; charset=utf-8",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                    },
                    success: function(result) {
                        alert("登録完了");
                        $("#reply").val("");
                        showList();
                    },
                    error: function(xhr) {
                        alert("登録失敗");
                        console.log(xhr);
                    }
                });

            });

        });

        function showList() {
            $.getJSON(
                "${pageContext.request.contextPath}/replies/pages/" + bnoValue,
                function(arr) {

                    var str = "";

                    for (var i = 0; i < arr.length; i++) {
                        str += "<div style='border:1px solid #ccc; margin:5px; padding:5px;'>";
                        str += "<div><strong>writer :</strong> " + arr[i].replyer + "</div>";
                        str += "<div><strong>content :</strong> " + arr[i].reply + "</div>";
                        str += "<button type='button' onclick='deleteReply(" + arr[i].rno + ")'>delete</button>";
                        str += "</div>";
                    }

                    $("#replyList").html(str);
                }
            );
        }

        function deleteReply(rno) {
            $.ajax({
                type: "delete",
                url: "${pageContext.request.contextPath}/replies/" + rno,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                },
                success: function(result) {
                    alert("削除完了");
                    showList();
                },
                error: function(xhr) {
                    alert("削除失敗");
                    console.log(xhr);
                }
            });
        }
    </script>

</body>
</html>