<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resources/flatly/bootstrap.css" />" media="screen">
<link rel="stylesheet"
	href="<c:url value="/resources/flatly/bootswatch.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/jquery-ui.min.css" />">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>


<title>Buscar Item</title>
</head>

<body>


<div class="container">
<div class="well bs-component">


			<div class="page-header">
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input id="searchItem" type="text" class="form-control"
								placeholder="Buscar Item">
						</div>
						<button type="button" class="btn btn-default"
							onclick="doSearchItemsLike()">Buscar</button>
					</form>
			</div>
			<br>
			<br>
			<div id="subViewDiv" class="bs-component"></div>



</div>

</div>

	<script type="text/javascript">
		function doSearchItemsLike() {

			$.ajax({
				url : "searchItem.do",
				type : "GET",
				data : {
					term : $('#searchItem').val()
				},
				success : function(response) {
					$("#subViewDiv").html(response);
				},
				error : function(xhr, textStatus, errorThrown) {

					alert("Error: " + xhr.status + " " + xhr.statusText);
				}

			});

		}
	</script>


</body>

</html>