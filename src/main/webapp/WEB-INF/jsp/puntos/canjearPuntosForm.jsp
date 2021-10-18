<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>



<script>
    function verCanjearPuntos(numPuntos) {
        $('#numPuntos').val(numPuntos);
		document.formulario.action="comercio/verEscanearCodigo.do";
		document.formulario.submit();		
    }
</script>


	<br>
	<br>
	<br>
	<br>
	<br>

<!-- CONTAINER -->
<div class="container">

	<form name="formulario" method="post">
		<input type="hidden" name="numPuntos" id="numPuntos"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	
	<div class="row">
		<div class="col-md-12">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item active"><em class="fas fa-gift fa-lg mr-2"></em>
						Escanear puntos
					</li>
				</ol>
			</nav>
		</div>
		</div>	

    <div class="row">
        <div class="col-md-4 text-center">
            <a href="javascript: verCanjearPuntos(1)" title="Canjear 1 punto">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/1-canje.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: verCanjearPuntos(2)" title="Canjear 2 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/2-canje.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: verCanjearPuntos(3)" title="Canjear 3 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/3-canje.png"/>' style="max-width: 200px">
            </a>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-4 text-center">
            <a href="javascript: verCanjearPuntos(4)" title="Canjear 4 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/4-canje.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: verCanjearPuntos(5)" title="Canjear 5 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/5-canje.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: verCanjearPuntos(6)" title="Canjear 6 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/6-canje.png"/>' style="max-width: 200px">
            </a>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-4 text-center">
            <a href="javascript: verCanjearPuntos(7)" title="Canjear 7 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/7-canje.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: verCanjearPuntos(8)" title="Canjear 8 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/8-canje.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: verCanjearPuntos(9)" title="Canjear 9 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/9-canje.png"/>' style="max-width: 200px">
            </a>
        </div>
    </div>
    <br><br><br><br><br>

</div><!-- ./container -->