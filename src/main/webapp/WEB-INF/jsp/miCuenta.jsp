




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>


<head>
<title>Mi Cuenta</title>
</head>
<body>
	<div class="container">

		<h1>Mi Cuenta</h1>


		<div class="bs-component">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#misFavs" data-toggle="tab">Mis
						Favoritos</a></li>
				<li><a href="#miPerfil" data-toggle="tab">Mi Perfil</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade active in" id="misFavs">
				<div class="col-lg-6">
					<table class="table table-striped table-hover ">
						<thead>
							<tr>

								<th class="success">Item</th>

							</tr>
						</thead>

						<tbody>
							<c:forEach items="${items}" var="item">
								<tr class="active" onclick="doSearchItem('${item.idItem}')">
<%-- 									<td id="${item.idItem}" style="display:none;">${item.idItem}</td> --%>
									<td>${item.titulo}</td>
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

		location.href = document.URL.substr(0, document.URL.lastIndexOf('/'))
				+ "/item?idItem=" + id;
	}
</script>

</body>
</html>