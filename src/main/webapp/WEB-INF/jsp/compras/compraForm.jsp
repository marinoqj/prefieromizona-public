
<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>


	<form:form modelAttribute="compra" action='${modo}Compra.do' method="post">


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
					<li class="breadcrumb-item active"><em class="fas fa-list-alt fa-lg mr-1"></em><em class="fas fa-shopping-cart fa-lg mr-2"></em>
					<c:if test="${modo == 'insertar'}">
					<spring:message code="label.alta.compra"/>
					</c:if>
					<c:if test="${modo == 'actualizar'}">
					<spring:message code="label.editar.compra"/>
					</c:if>
					</li>
				</ol>
			</nav>
		</div>
		</div>

						

							<c:if test="${modo == 'actualizar'}">

								<form:hidden path="idCompra"/>

							</c:if>
							

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="fechaCompra"><spring:message code="label.fechaCompra"/></label> <form:input path="fechaCompra" class="form-control"/><form:errors path="fechaCompra" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="puntos"><spring:message code="label.puntos"/></label> <form:input path="puntos" class="form-control"/><form:errors path="puntos" element="div" id="rojo"/>
									</div>
								</div>					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="idComercio"><spring:message code="label.idComercio"/></label> <form:input path="idComercio" class="form-control"/><form:errors path="idComercio" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="idCliente"><spring:message code="label.idCliente"/></label> <form:input path="idCliente" class="form-control"/><form:errors path="idCliente" element="div" id="rojo"/>
									</div>
								</div>
					


							<a href="./listadoCompras1.do" class="btn btn-secondary btn-sm"><em class="fas fa-times-circle"></em>&nbsp;&nbsp;Cancelar</a>
							<button type="submit" class="btn btn-success btn-sm" ><em class="fas fa-save"></em> &nbsp;&nbsp;Guardar</button>




</div><!-- ./container -->
	</form:form>

