




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
					<table class="table table-striped table-hover ">
						<thead>
							<tr>
								
								<th class="success">Item</th>
								
							</tr>
						</thead>
						<tbody>
							<tr class="active">								
								<td>Column content</td>			
							</tr>
							<tr class="active">								
								<td>Column content</td>			
							</tr>
							<tr class="active">								
								<td>Column content</td>			
							</tr>
							<tr class="active">								
								<td>Column content</td>			
							</tr>
						
							</tbody>
							</table>
				</div>
				<div class="tab-pane fade" id="miPerfil">
					<p>MI PERFIIIIL</p>
				</div>
			</div>

		</div>

	</div>

</body>
</html>