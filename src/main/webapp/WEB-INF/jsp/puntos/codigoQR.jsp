
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
			<div class="alert alert-primary h6-responsive" role="alert">
				<em class="fas fa-info-circle fa-lg pr-2"></em>Código QR con información de los puntos preparado para ser escaneado por el cliente...
			</div>
		</div>
	</div>
						
	<div class="row">
		<div class="col text-center">
			<img class="img-fluid qr-image" src="data:image/png;base64,${qrBase64}" width="40%">
		</div>
	</div>
	<br>					

	

		
		




</div><!-- ./container -->


