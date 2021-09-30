
<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>


	<form:form modelAttribute="puntosForm" action='${modo}Puntos.do' method="post">


	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="row">
		<div class="col-md-12">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item active"><em class="fas fa-list-alt fa-lg mr-1"></em><em class="fas fa-users fa-lg mr-2"></em>
					<c:if test="${modo == 'generar'}">
						Generar puntos
					</c:if>
					<c:if test="${modo == 'canjear'}">
						Canjear puntos
					</c:if>
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



		
		<button type="submit" class="btn btn-success btn-sm" ><em class="fas fa-save"></em> &nbsp;&nbsp;Confirmar</button>





	</form:form>

