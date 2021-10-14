<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>



<br>
<br>
<br>
<br>
<br>
<br>


<div class="row">
	<div class="col-md-3 col-lg-4">&nbsp;</div>
	<div class="col-md-6 col-lg-4">
		
 		<form class="shadow p-3 mb-5 bg-white rounded text-center border" action="login.do" method="post">	
 		<div class="p-4">

			<span class="h4 mb-4">Acceso a la aplicaci�n</span>
			<br><br>
			<img src='<spring:url value="/static/imagenes/user-circle-solid.png"/>' height="100" width="100">
			<br><br>
			<!-- Name -->
			<input type="text" class="form-control mb-4" name="username" placeholder="Usuario">

			<!-- Password -->
			<input type="password" name="password" class="form-control mb-4" placeholder="Password">

			<!-- Sign in button -->
			<button class="btn btn-primary btn-block btn-sm" type="submit">Entrar</button>	

		</div>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		
		
	</div>
	<div class="col-md-3 col-lg-4">&nbsp;</div>


</div>


<!-- Modal -->
<div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Usuarios y contrase�as</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<table class="table">
		  <thead class="black white-text">
		    <tr>
		      <th scope="col">Entidad</th>
		      <th scope="col">Usuario</th>
		      <th scope="col">Password</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">CervePub</th>
		      <td>a</td>
		      <td>1</td>
		    </tr>
		    <tr>
		      <th scope="row">Librer�a La Luz</th>
		      <td>b</td>
		      <td>1</td>
		    </tr>
		    <tr>
		      <th scope="row">Ana Mar�a</th>
		      <td>c</td>
		      <td>1</td>
		    </tr>
		    <tr>
		      <th scope="row">Pedro</th>
		      <td>d</td>
		      <td>1</td>
		    </tr>
		    <tr>
		      <th scope="row">Administrador</th>
		      <td>z</td>
		      <td>1</td>
		    </tr>
		  </tbody>
		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>


<c:if test="${not empty mensaje}">
<div class="row">
	<div class="col-md-3 col-lg-4">&nbsp;</div>
	<div class="col-md-6 col-lg-4 align-middle alert alert-danger"><div id="rojo"><span><i class="fas fa-info-circle fa-2x"></i> ${mensaje}</div></div>
	<div class="col-md-3 col-lg-4">&nbsp;</div>
</div>
</c:if>


<br>
<br>
<br>
<br>