<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>

 			<style>
	 			.dropdown-menu-right-fixed { 
	 				position: fixed !important;
				}
 			</style>
 
			<!-- Men? -->
			
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
			    <sec:authorize access="hasRole('ADMIN')">
			      <li class="nav-item" id="inicio">
			        <a class="nav-link" href='<spring:url value="/inicio.do"/>'>Inicio <span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item" id="listadoComercios">
			        <a class="nav-link" href='<spring:url value="/listadoComercios1.do"/>'>Comercios</a>
			      </li>
			      <li class="nav-item" id="listadoClientes">
			        <a class="nav-link" href='<spring:url value="/listadoClientes1.do"/>'>Clientes</a>
			      </li>
			      <li class="nav-item" id="listadoCompras">
			        <a class="nav-link" href='<spring:url value="/listadoCompras1.do"/>'>Compras</a>
			      </li>
			      <li class="nav-item" id="listadoCanjes">
			        <a class="nav-link" href='<spring:url value="/listadoCanjes1.do"/>'>Canjes</a>
			      </li>	
			      <li class="nav-item dropdown" id="puntos">
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
			     </sec:authorize>
			    <sec:authorize access="hasRole('COMERCIO')">			        
			        <li class="nav-item dropdown" id="inicio">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          Puntos
				        </a>
				        <div class="dropdown-menu dropdown-default" aria-labelledby="navbarDropdown2">
				        	<a class="dropdown-item" href='<spring:url value="/verCanjearPuntosForm.do"/>'>Canjear</a>
				        	<a class="dropdown-item" href='<spring:url value="/verEmitirPuntosForm.do"/>'>Emitir</a>
				        	<div class="dropdown-divider"></div>
							<a class="dropdown-item"
							href='<spring:url value="/comercio/{idEntidad}/listadoCompras1.do">
					  				<spring:param name="idEntidad" value="${usuarioSesion.idEntidad}" />
					  			  </spring:url>'>Puntos Emitidos</a> 
							<a class="dropdown-item"
							href='<spring:url value="/comercio/{idEntidad}/listadoCanjes1.do">
					  				<spring:param name="idEntidad" value="${usuarioSesion.idEntidad}" />
					  			  </spring:url>'>Puntos Canjeados</a>					
				        </div>
			        </li>
			        <li class="nav-item dropdown" id="verPromocionForm">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          Promociones
				        </a>
				        <div class="dropdown-menu dropdown-default" aria-labelledby="navbarDropdown3">
				        	<a class="dropdown-item" href='<spring:url value="/verPromocionForm.do"/>'>Nueva promoci?n</a>
				        	<div class="dropdown-divider"></div>
				        	<a class="dropdown-item" href='<spring:url value="/listadoPromociones.do"/>'>Mis promociones</a>
				        </div>
			        </li>
					<li class="nav-item" id="verMisEstadisticas"><a class="nav-link"
						href='<spring:url value="/comercio/verMisEstadisticas{idEntidad}.do">
				  				<spring:param name="idEntidad" value="${usuarioSesion.idEntidad}" />
				  			  </spring:url>'>Estad?sticas</a>
					</li>						
			     </sec:authorize>
			     <sec:authorize access="hasRole('CLIENTE')">			     		     
			        <li class="nav-item dropdown" id="inicio">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				         Mis Puntos
				        </a>
				        <div class="dropdown-menu dropdown-default" aria-labelledby="navbarDropdown4">
				        	<a class="dropdown-item" href='<spring:url value="/cliente/verEscanearCodigo.do"/>'>Escanear puntos</a>
				        	<a class="dropdown-item" href='<spring:url value="/cliente/generarCodigoPuntos1.do"/>'>Canjear puntos</a>
				        	<div class="dropdown-divider"></div>
							<a class="dropdown-item" href='<spring:url value="/cliente/{idEntidad}/listadoPuntos1.do">
					  				<spring:param name="idEntidad" value="${usuarioSesion.idEntidad}" />
					  			  </spring:url>'>Puntos acumulados</a>				
				        </div>
			        </li>			     			     
					<li class="nav-item" id="listadoCompras"><a class="nav-link"
						href='<spring:url value="/cliente/{idEntidad}/listadoCompras1.do">
				  				<spring:param name="idEntidad" value="${usuarioSesion.idEntidad}" />
				  			  </spring:url>'>Mis Compras</a>
					</li>
					<li class="nav-item" id="listadoCanjes"><a class="nav-link"
						href='<spring:url value="/cliente/{idEntidad}/listadoCanjes1.do">
				  				<spring:param name="idEntidad" value="${usuarioSesion.idEntidad}" />
				  			  </spring:url>'>Mis Canjes</a>
					</li>										
			     </sec:authorize>
			      			      
			    </ul>
			    <ul class="navbar-nav">
				<%-- Notificaciones Cliente--%>
			    <sec:authorize access="hasRole('CLIENTE')">
				  <li class="nav-item">
				  	<a href="/prefieromizona-public/verNotificaciones.do" class="nav-link waves-effect">
				  		<span class="badge red z-depth-1 mr-1"> 2 </span><em id="navbar-static-cart" title="Notificaciones sin Leer" class="fas fa-bell"></em><span class="sr-only"> Notificaciones </span>
				  	</a>
				  </li>
				  </sec:authorize>
				  
			      <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle"  href="#" id="navbarDropdownMenuLink-333" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          ${usuarioSesion.nombreEntidad} &nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-user-circle fa-lg"></i>
			        </a>
			        <div class="dropdown-menu dropdown-default" aria-labelledby="navbarDropdownMenuLink-333">
			          <a class="dropdown-item" href="#">Mi perfil</a>
			          
						<%-- Notificaciones Cliente--%>
			          <sec:authorize access="hasRole('CLIENTE')">
			          <a class="dropdown-item" href="/prefieromizona-public/verNotificaciones.do">Ver Notificaciones</a>
			          </sec:authorize>
			          
			          <a class="dropdown-item" href='<spring:url value="/logout.do"/>'>Cerrar sesi?n</a>
			        </div>
			      </li>
			    </ul>
			  </div>
			  </div>
			</nav>			
						
			<!-- FIN Men? -->



