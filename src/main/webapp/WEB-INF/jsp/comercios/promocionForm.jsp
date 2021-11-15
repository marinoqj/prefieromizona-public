
<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>





	<br>
	<br>
	<br>
	<br>
	<br>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item active"><em class="fas fa-plus-circle fa-lg mr-1"></em><em class="fas fa-shopping-bag fa-lg mr-2"></em>
						Crear nueva promoción
					</li>
				</ol>
			</nav>
		</div>
	</div>

	<div class="row">
	<div class="col-md-12">
		<!-- Extended default form grid -->
		<form>
		
			<!-- Text Area -->
			<div class="media mt-3">
				<div class="media-body">
					<h5 class="mt-0 grey-text">Texto promoci&oacute;n</h5>
					<div class="form-group basic-textarea rounded-corners">
						<textarea class="form-control shadow-sm" id="exampleFormControlTextarea345" rows="3" placeholder="Escriba aquí el texto de la promoción..."></textarea>
					</div>
				</div>
			</div>

			<br>
		
		    <div class="row">
		        <div class="col-12 col-sm-6 pb-2">
		            <div class="estado p-1" id="todo">
		                <p class="cabecera">DISPONIBLES</p>
		                <div class="tarea shadow-sm my-1" id="tarea-01">
		                    Mejores Clientes
		                </div>
		                <div class="tarea shadow-sm my-1" id="tarea-02">
		                    Clientes habituales
		                </div>
		                <div class="tarea shadow-sm my-1" id="tarea-03">
		                    Clientes poco frecuentes
		                </div>		                
		                <div class="tarea shadow-sm my-1" id="tarea-04">
		                    Clientes de una sola vez
		                </div>		                
		            </div>
		        </div>
		        <div class="col-12 col-sm-6 pb-2">
		            <div class="estado p-1" id="doing">
		                <p class="cabecera">LISTAS PARA ENVIAR</p>
		            </div>
		        </div>
		    </div>
		    <input name="info-kanban" id="info-kanban" type="hidden">
			
			<br>
			
			 <button type="button" class="btn btn-success btn-rounded btn-sm"><i class="fas fa-save pr-2"></i>Guardar</button>
<!-- 			 <button type="button" class="btn btn-secondary btn-rounded btn-sm"><i class="fas fa-envelope pr-2"></i>Enviar</button> -->
		</form>
		<!-- Extended default form grid -->
	</div>



</div>

<!-- Default form subscription -->

</div><!-- FIN CONTAINER -->
<br><br>



<!-- jQueryUI -->
<script type="text/javascript" src='<spring:url value="/static/js/jquery-ui.min.js"/>'></script>
<!-- Support for mobile devices (touch event) -->
<script type="text/javascript" src='<spring:url value="/static/js/jquery.ui.touch-punch.min.js"/>'></script>

<script>
    $( '.tarea' ).draggable({
        helper: 'clone',
        stop: function(event, ui) {
            guardarKanban();
        }
    });

    $( '.estado' ).droppable({
        accept: '.tarea',
        hoverClass: 'hovering',
        drop: function( ev, ui ) {
            ui.draggable.detach();
            $( this ).append( ui.draggable );
        }
    });

    function guardarKanban() {
        let kanbanBoardInfo = '';
        let estadoObj = null;
        let tareasList = null;

        for(let i = 0; i < document.getElementsByClassName('estado').length; i++) {
            estadoObj = document.getElementsByClassName('estado')[i];
            tareasList = estadoObj.getElementsByClassName('tarea');

            for(let z = 0; z < tareasList.length; z++) {
                if (tareasList[z].id.length != 0) {
                    kanbanBoardInfo = kanbanBoardInfo + estadoObj.id + ':' + tareasList[z].id + ';';
                }
            }
        }

        let infoKanban = document.getElementById('info-kanban');
        infoKanban.value = kanbanBoardInfo;

        console.log(infoKanban.value);

        // document.forms[0].submit();
    }
    
    
    $('#widget').draggable({
        scroll: false,
        containment: "#bg-container",
        
        start: function( event, ui ) {
            console.log("start top is :" + ui.position.top)
            console.log("start left is :" + ui.position.left)
        },
        drag: function(event, ui) {
            console.log('draging.....');    
        },
        stop: function( event, ui ) {
            console.log("stop top is :" + ui.position.top)
            console.log("stop left is :" + ui.position.left)

            alert('left:'+ui.position.left + ' top:'+ui.position.top)
        }    
    });    
    
</script>
