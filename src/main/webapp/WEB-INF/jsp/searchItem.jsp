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

	<form class="navbar-form navbar-left" role="search">
		<div class="form-group">
			<input id="searchItem" type="text" class="form-control" placeholder="Buscar Item">
		</div>
		<button type="submit" class="btn btn-default">Buscar</button>
	</form>



<script type="text/javascript">
$(function() {
	$("#searchItem").autocomplete({
		delay : 500,
		source : function(request, response) {
			$.ajax({
				url : "searchItem.do",
				type : "GET",
				data : {
					term : request.term
				},
				dataType : "json",
				success : function(data) {
					response($.map(data, function(v, i) {
						return {
							value : v.idItem,
							label : v.titulo
						};
					}));
				}
			});
		},

	});
});
</script>


</body>

</html>