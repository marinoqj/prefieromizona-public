
<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>


	<form:form modelAttribute="puntosForm" action='${modo}Puntos.do' method="post">


	<br>
	<br>
	<br>
	<br>
	<br>

<!-- CONTAINER -->
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				
				<c:set var="iconoPrevio" value="fas fa-plus-circle" />
				<c:set var="accion" value="Generar" />
				<c:if test="${modo == 'canjear'}">
						<c:set var="iconoPrevio" value="fas fa-smile-wink" />
						<c:set var="accion" value="Canjear" />
				</c:if>
					<li class="breadcrumb-item active"><em class="${iconoPrevio} fa-lg mr-1"></em><em class="fas fa-gift fa-lg mr-2"></em>
						<c:out value="${accion}" />&nbsp; puntos
					</li>
				</ol>
			</nav>
		</div>
		</div>

						


							

			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="codigoCliente"><spring:message code="label.codigo.cliente"/></label> <form:input path="codCliente" class="form-control"/><form:errors path="codCliente" element="div" id="rojo"/>
				</div>
			</div>


			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="codComercio"><spring:message code="label.codigo.comercio"/></label> <form:input path="codComercio" class="form-control"/><form:errors path="codComercio" element="div" id="rojo"/>
				</div>
			</div>



			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="cantidadPuntos"><spring:message code="label.puntos"/></label> <form:input path="cantidadPuntos" class="form-control"/><form:errors path="cantidadPuntos" element="div" id="rojo"/>
				</div>
			</div>



		
		<button type="submit" class="btn btn-success btn-rounded btn-sm" ><em class="fas fa-save"></em> &nbsp;&nbsp;Confirmar</button>




</div><!-- ./container -->
	</form:form>

