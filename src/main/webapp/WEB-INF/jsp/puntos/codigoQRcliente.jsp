
<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>


	


	<br>
	<br>
	<br>
	<br>
	<br>

<!-- CONTAINER -->
<div class="container">

	<div class="row">
		<div class="col">
			<div class="alert alert-primary h5-responsive" role="alert">
				<em class="fas fa-info-circle fa-lg pr-2"></em>Código QR con información de los puntos a canjear preparado para ser escaneado por el comercio...
			</div>
		</div>
	</div>
	<br>					



<!--Accordion wrapper-->
<div class="accordion md-accordion" id="accordionCanje" role="tablist" aria-multiselectable="true">

<c:forEach items="${puntos}" var="punto" varStatus="status">
  <!-- Accordion card -->
  <div class="card">

    <!-- Card header -->
    <div class="card-header" role="tab" id="heading${status.count}">
      <a data-toggle="collapse" data-parent="#accordionCanje" href="#collapse${status.count}" aria-expanded="false"
        aria-controls="collapse${status.count}" class="collapsed">
        <h5 class="mb-0">
            <span style="color: #e94647; font-size: 1.8rem; font-weight: 600">${punto.comercio.razonSocial}<i class="fas fa-angle-down rotate-icon"></i></span>
        </h5>
      </a>
    </div>

    <!-- Card body -->

    <div id="collapse${status.count}" class="collapse" role="tabpanel" aria-labelledby="heading${status.count}"
      data-parent="#accordionCanje">
      <div class="card-body">
		<div class="row">
			<div class="col text-center">
				<img class="img-fluid qr-image" src="data:image/png;base64,${codigosQR[status.index]}"></div>
		</div>
      </div>
    </div>

  </div>
  <!-- Accordion card -->
</c:forEach>  

</div>
<!-- Accordion wrapper -->
	

		
</div><!-- ./container -->


