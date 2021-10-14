<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>

 
 
			<!-- Menú -->
			
			<nav class="navbar navbar-expand-lg navbar-light navbar-dark special-color fixed-top scrolling-navbar">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"> <img src='<spring:url value="/static/imagenes/logo.png"/>' height="40" class="d-inline-block">
				<span class="align-middle lead">Prefiero</span><span class="align-middle lead" style="font-weight: 400;color: #a8ce3b !important;">Mi</span><span class="align-middle lead">Zona</span>
				</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				    <ul class="navbar-nav mr-auto">			    
				      <li class="nav-item active">
				        <a class="nav-link" href='/prefieromizona-public'>Inicio</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href='<spring:url value="/pub/verComoFunciona.do"/>'>¿C&oacute;mo funciona?</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href='<spring:url value="/pub/verEstablecimientos.do"/>'>Establecimientos</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href='<spring:url value="/pub/verOfertas.do"/>'>Ofertas</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href='<spring:url value="/pub/verNoticias.do"/>'>Noticias</a>
				      </li>
				    </ul>
				    <ul class="navbar-nav ml-auto">
				      <li class="nav-item" style="float: right">
				        <a class="nav-link" href='<spring:url value="/login.do"/>'><em class="fas fa-sign-in-alt pr-2"></em>Acceder</a>
				      </li>
				    </ul>
				  </div>

			  </div>
			</nav>			
						
			<!-- FIN Menú -->



