<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>

<script>

$(document).ready(function(){
    $(".selector").click(function(){       	
    var idCapa = $(this).data('id');          
        $("#" + idCapa).toggle();
        
        return false;
    });
});

</script>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<div class="row">
	  <div class="col-2">&nbsp;</div>
	  <div class="col-8 text-center">
	  			<div class="alert alert-danger">									
					<span><i class="fas fa-info-circle fa-2x"></i></span>&nbsp;&nbsp;&nbsp;<b><spring:message code="excepcion.acceso.denegado" />:</b>
				</div>					

	  </div>
	  <div class="col-2">&nbsp;</div>
    </div>	

<br>

	