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
			        <a class="nav-link" href='<spring:url value="/inicio.do"/>'>Inicio <span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href='<spring:url value="/listadoComercios1.do"/>'>Comercios</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href='<spring:url value="/listadoClientes1.do"/>'>Clientes</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href='<spring:url value="/listadoCompras1.do"/>'>Compras</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href='<spring:url value="/listadoCanjes1.do"/>'>Canjes</a>
			      </li>	
			      <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          Puntos
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href='<spring:url value="/verPuntosFormgenerar.do"/>'>Generar</a> 
						<a class="dropdown-item" href='<spring:url value="/verPuntosFormcanjear.do"/>'>Canjear</a>					
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href='<spring:url value="/listadoPuntos1.do"/>'>Ver puntos</a>
			        </div>
			      </li>	
			      			      
			    </ul>
			    <ul class="navbar-nav">
			      <li class="nav-item dropdown active">
			        <a class="nav-link dropdown-toggle"  href="#" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
			          aria-haspopup="true" aria-expanded="false">
			          Margarita Salas &nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-user-circle fa-lg"></i>
			        </a>
			        <div class="dropdown-menu dropdown-menu-right dropdown-default"
			          aria-labelledby="navbarDropdownMenuLink-333">
			          <a class="dropdown-item" href="#">Mi perfil</a>
			          <a class="dropdown-item" href="#">Cerrar sesión</a>
			        </div>
			      </li>
			    </ul>
			  </div>
			  </div>
			</nav>			
						
			<!-- FIN Menú -->



