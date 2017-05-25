




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>


<head>
<title>Mi Cuenta</title>
</head>
<body>
<div id="removable">
	<div class="container">

		<h1>Mi Cuenta</h1>


		<div class="bs-component">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#misFavs" data-toggle="tab">Mis
						Favoritos</a></li>
<!-- 				<li><a href="#miPerfil" data-toggle="tab">Mi Perfil</a></li> -->
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade active in" id="misFavs">
					<div class="col-lg-6">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>

									<th class="success">Ejemplar</th>
									<th class="success"></th>



								</tr>
							</thead>

							<tbody>
								<c:forEach items="${items}" var="item">
									<tr class="active">
										<%-- 									<td id="${item.idItem}" style="display:none;">${item.idItem}</td> --%>
										<td id= "fav${item.idItem}" onclick="doSearchItem('${item.idItem}')">${item.titulo}
										</td>
										<td id = "trash${item.idItem}"align="center" onclick="delteFavorito('${item.idItem}')"><img
											class="img-responsive"
											src="<c:url value="/resources/icons/trash.png" />"
											alt="delete" width="24" height="24"></td>
										<%-- 									<td>${itemFav.descripcion}</td> --%>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="miPerfil">
					<p>MI PERFIly</p>
				</div>
			</div>

		</div>

	</div>


	<script type="text/javascript">
		function doSearchItem(id) {

			location.href = document.URL.substr(0, document.URL
					.lastIndexOf('/'))
					+ "/item?idItem=" + id;
		}
		function delteFavorito(id) {

			$.ajax({
				url : "removeFav.do",
				type : "GET",
				data : {
					idItem : id,
				},
				success : function(response) {
					// 					$("#subViewDiv").html(response);
					console.log("SUCESSFULLY REMOVED");
				},
// 				error : function(xhr, textStatus, errorThrown) {
// 					alert("Error: " + xhr.status + " " + xhr.statusText);
// 				}

			});
			
			console.log("TESTTTT");
			removeItemList(id);

		}
		
		function removeItemList(id){
			$('#fav'+id).remove();
			$('#trash'+id).remove();
			
		}
		
		

	</script>
</div>
</body>
</html>