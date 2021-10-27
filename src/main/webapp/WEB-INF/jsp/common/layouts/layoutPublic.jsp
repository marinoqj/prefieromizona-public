<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>
		
<!DOCTYPE html>
<html lang="es">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title><tiles:insertAttribute name="title" ignore="true"/></title>
	
	<!-- Favicon-->
    <link rel="shortcut icon" href='<spring:url value="/static/imagenes/fav.png"/>' >
	
	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href='<spring:url value="/static/css/bootstrap.4.5.min.css" />' media="all" />
	<link rel="stylesheet" type="text/css" href='<spring:url value="/static/css/mdb.min.css" />' media="all" />
	<link rel="stylesheet" type="text/css" href='<spring:url value="/static/css/estilo.css" />' media="all" />
	<!-- FONTAWESOME 5.11 -->
	<link rel="stylesheet" type="text/css" href='<spring:url value="/static/css/all.min.css"/>' media="all" />
<%-- 	<link rel="stylesheet" type="text/css" href='<spring:url value="/static/css/font-awesome.min.css"/>' media="all" /> --%>

	<%-- jquery lo pongo arriba porque si lo pongo abajo con defer da un error en todos los $(document).ready --%>
	<script type="text/javascript" src='<spring:url value="/static/js/jquery-3.3.1.min.js"/>' ></script>
	
</head>
<body>

	<header>
		<tiles:insertAttribute name="header" />
	</header>

	<main>
		<div class="container-fluid">
			<tiles:insertAttribute name="body" />			
		</div>
	</main>



	<footer id="pie-pagina" class="page-footer font-small special-color">
		<tiles:insertAttribute name="footer" />
	</footer>

	<!-- SCRIPTS -->
<%-- 	<script type="text/javascript" src='<spring:url value="/static/js/popper.min.js"/>' defer></script> --%>
	<script type="text/javascript" src='<spring:url value="/static/js/bootstrap.min.js"/>' defer></script>
<%-- 	<script type="text/javascript" src='<spring:url value="/static/js/mdb.min.js"/>' defer></script> --%>
	<script type="text/javascript" src='<spring:url value="/static/js/pie.js"/>' defer></script>
	
	<script type="text/javascript">
	function ready(callback){
	    // in case the document is already rendered
	    if (document.readyState!='loading') callback();
	    // modern browsers
	    else if (document.addEventListener) document.addEventListener('DOMContentLoaded', callback);
	    // IE <= 8
	    else document.attachEvent('onreadystatechange', function(){
	        if (document.readyState=='complete') callback();
	    });
	}

	ready(function(){
		let winLocation = window.location.pathname;
	    console.log(winLocation);
	    let indexDotDo = winLocation.lastIndexOf(".do");
	    let indexlastBar = winLocation.lastIndexOf("/") + 1;
		let idTarget = null;

	    if (indexDotDo != -1) {
			idTarget = winLocation.substring(indexlastBar, indexDotDo);
		} else {
			idTarget = "inicio";
		}

	    document.getElementById(idTarget).classList.toggle("active");

	    // console.log(idTarget);
	});
	</script>
	<noscript>Su navegador no soporta Javascript o este lenguaje está desactivado</noscript>
</body>
</html>