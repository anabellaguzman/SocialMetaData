<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
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
<title>Subir Archivo</title>
</head>
<body>
<br>
 
<c:out value="${message}"/>
<form method="post" action="fileUpload" enctype="multipart/form-data">
    <table>
        <tr>
           <td>Seleccionar archivo: </td>
           <td><input type="file" id=fichero name="fichero"></td>
        </tr>
        <tr>
    
        </tr>
        <tr><td colspan="2" align="center">
    	<input type="submit" value="Subir fichero">
<!--     	<button type="button" class="btn btn-primary" -->
<!-- 								onclick="uploadFile()">Submit</button></td> -->
        </tr>
     </table>
</form>

<!-- <table> -->
<!--         <tr> -->
<!--            <td>Seleccionar archivo: </td> -->
<!--            <td><input type="file" id=fichero name="fichero"></td> -->
<!--         </tr> -->
<!--         <tr> -->
    
<!--         </tr> -->
<!--         <tr><td colspan="2" align="center"> -->
    	
<!--     	<button type="button" class="btn btn-primary" onclick="uploadFile()">Submit</button></td> -->
<!--         </tr> -->
<!--      </table> -->

<script type="text/javascript">
		function uploadFile() {
			$.ajax({
			    url: 'fileUpload',
			    contentType: false,
			    type: 'POST',
			    data: {fileFormBean: $('#fichero')},
			    cache: false,
			    processData: false,
			    success: function(data){
			        alert(':)');
			    }
			});
		}
</script>

</body>
</html>