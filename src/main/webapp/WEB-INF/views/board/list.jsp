<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIST PAGE</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

    <h1>List Page</h1>

    <c:if test="${pageContext.request.userPrincipal != null}">
        <div>
            ${pageContext.request.userPrincipal.name}

            <form action="${pageContext.request.contextPath}/customLogout"
                  method="post">
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}" />
                <button type="submit">Logout</button>
            </form>
        </div>
    </c:if>

    <c:if test="${pageContext.request.userPrincipal == null}">
        <a href="${pageContext.request.contextPath}/customLogin">Login</a>
    </c:if>

    <div>
        Board List Page
        <button id="regBtn" type="button">Register New Board</button>
    </div>

    <table>
        <thead>
            <tr>
                <th>&nbsp;NUM&nbsp;</th>
                <th>&nbsp;TITLE&nbsp;</th>
                <th>&nbsp;WRITER&nbsp;</th>
                <th>&nbsp;REGISTER&nbsp;</th>
                <th>&nbsp;UPDATE&nbsp;</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="board" items="${list}">
                <tr>
                    <td><c:out value="${board.bno}" /></td>
                    <td>
                        <a class="move" href='<c:out value="${board.bno}" />'>
                            <c:out value="${board.title}" />
                        </a>
                    </td>
                    <td><c:out value="${board.writer}" /></td>
                    <td>
                        <fmt:formatDate pattern="yyyy-MM-dd"
                                        value="${board.regdate}" />
                    </td>
                    <td>
                        <fmt:formatDate pattern="yyyy-MM-dd"
                                        value="${board.updateDate}" />
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="row">
        <form id="searchForm"
              action="${pageContext.request.contextPath}/board/list"
              method="get">

            <select name="type">
                <option value=""
                    <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}" />>--</option>

                <option value="T"
                    <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}" />>title</option>

                <option value="C"
                    <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}" />>content</option>

                <option value="W"
                    <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}" />>writer</option>

                <option value="TC"
                    <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}" />>title or content</option>

                <option value="TW"
                    <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}" />>title or writer</option>

                <option value="TCW"
                    <c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected' : ''}" />>title or content or writer</option>
            </select>

            <input type="text"
                   name="keyword"
                   value='<c:out value="${pageMaker.cri.keyword}" />' />

            <input type="hidden"
                   name="pageNum"
                   value='<c:out value="${pageMaker.cri.pageNum}" />' />

            <input type="hidden"
                   name="amount"
                   value='<c:out value="${pageMaker.cri.amount}" />' />

            <button class="btn btn-default">Search</button>
        </form>
    </div>

    <div>
        <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li class="paginate_button previous">
                    <a href="${pageMaker.startPage - 1}">Previous</a>
                </li>
            </c:if>

            <c:forEach var="num"
                       begin="${pageMaker.startPage}"
                       end="${pageMaker.endPage}">
                <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active" : ""}'>
                    <a href="${num}">${num}</a>
                </li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
                <li class="paginate_button next">
                    <a href="${pageMaker.endPage + 1}">Next</a>
                </li>
            </c:if>
        </ul>
    </div>

    <form id="actionForm"
          action="${pageContext.request.contextPath}/board/list"
          method="get">

        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}" />'>
        <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}" />'>
    </form>

    <div class="modal fade"
         id="myModal"
         tabindex="-1"
         role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button"
                            data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 id="myModalLabel">Modal title.</h4>
                </div>

                <div class="modal-body">処理が完了しました。</div>

                <div class="modal-footer">
                    <button type="button" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {

            var result = '<c:out value="${result}" />';
            var actionForm = $("#actionForm");
            var searchForm = $("#searchForm");

            checkModal(result);
            history.replaceState({}, null, null);

            function checkModal(result) {
                if (result === "" || history.state) {
                    return;
                }

                if (parseInt(result) > 0) {
                    $(".modal-body").html(
                        "content " + parseInt(result) + "番が登録しました。"
                    );
                }

                $("#myModal").modal("show");
            }

            $("#regBtn").on("click", function() {
                self.location = "${pageContext.request.contextPath}/board/register";
            });

            $(".paginate_button a").on("click", function(e) {
                e.preventDefault();

                actionForm.attr("action", "${pageContext.request.contextPath}/board/list");
                actionForm.find("input[name='bno']").remove();

                actionForm.find("input[name='pageNum']")
                          .val($(this).attr("href"));

                actionForm.submit();
            });

            $(".move").on("click", function(e) {
                e.preventDefault();

                actionForm.attr("action", "${pageContext.request.contextPath}/board/get");

                actionForm.find("input[name='bno']").remove();

                actionForm.append(
                    "<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>"
                );

                actionForm.submit();
            });

            $("#searchForm button").on("click", function(e) {

                if (!searchForm.find("option:selected").val()) {
                    alert("検索種類を選んでください。");
                    return false;
                }

                if (!searchForm.find("input[name='keyword']").val()) {
                    alert("キーワードを入力してください。");
                    return false;
                }

                searchForm.find("input[name='pageNum']").val("1");

                e.preventDefault();
                searchForm.submit();
            });

        });
    </script>

</body>
</html>