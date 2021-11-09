package es.golemdr.prefieromizona.controller.constantes;


public class UrlConstants {
	
	
	private UrlConstants() {
		throw new IllegalStateException("UrlConstants class");
	}


	public static final String SUFIJO_PAGINACION = 	"{inicio}.do";
	public static final String URL_LOGIN = "/login.do";
	public static final String URL_DENIED = "/denied.do";
	public static final String URL_LOGIN_CONTROLLER = "/loginController.do";
	public static final String URL_LOGIN_FAILURE = "/login-failure.do";	
	public static final String URL_HOME = "/home.do";
	public static final String URL_ACCESO_OK = "/accesook.do";
	public static final String URL_ENTRADA_APLICACION = "/inicio.do";


	public static final String URL_VER_LOGIN = "/login.do";
	public static final String URL_CAMBIAR_PASSWORD="/cambiarPassword.do";

	
	public static final String SEGURIDAD_CLIENTES =  "";	
	public static final String SEGURIDAD_COMERCIOS =  "";	
	public static final String SEGURIDAD_COMPRAS =  "";		
	public static final String SEGURIDAD_PUNTOS =  "";
	public static final String SEGURIDAD_CANJES =  "";	

	
	// Zona pública
	public static final String URL_VER_COMO_FUNCIONA = "/pub/verComoFunciona.do";
	public static final String URL_VER_ESTABLECIMIENTOS = "/pub/verEstablecimientos.do";
	public static final String URL_VER_OFERTAS = "/pub/verOfertas.do";
	public static final String URL_VER_NOTICIAS = "/pub/verNoticias.do";

	// Clientes
	public static final String URL_LISTADO_CLIENTES = SEGURIDAD_CLIENTES + "/listadoClientes" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_CLIENTES_FILTRADO = SEGURIDAD_CLIENTES + "/listadoClientesFiltrado" + SUFIJO_PAGINACION;
	public static final String URL_ALTA_CLIENTE = SEGURIDAD_CLIENTES + "/altaCliente.do";
	public static final String URL_INSERTAR_CLIENTE = SEGURIDAD_CLIENTES + "/insertarCliente.do";
	public static final String URL_EDITAR_CLIENTE = SEGURIDAD_CLIENTES + "/editarCliente.do";
	public static final String URL_ACTUALIZAR_CLIENTE = SEGURIDAD_CLIENTES + "/actualizarCliente.do";
	public static final String URL_BORRAR_CLIENTE = SEGURIDAD_CLIENTES + "/borrarCliente.do";
    public static final String URL_BUSCAR_CLIENTES = SEGURIDAD_CLIENTES + "/buscarClientes.do";
    public static final String URL_VER_NOTIFICACIONES = SEGURIDAD_CLIENTES + "/verNotificaciones.do";


	

	// Comercios
	public static final String URL_LISTADO_COMERCIOS = SEGURIDAD_COMERCIOS + "/listadoComercios" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_COMERCIOS_FILTRADO = SEGURIDAD_COMERCIOS + "/listadoComerciosFiltrado" + SUFIJO_PAGINACION;
	public static final String URL_ALTA_COMERCIO = SEGURIDAD_COMERCIOS + "/altaComercio.do";
	public static final String URL_INSERTAR_COMERCIO = SEGURIDAD_COMERCIOS + "/insertarComercio.do";
	public static final String URL_EDITAR_COMERCIO = SEGURIDAD_COMERCIOS + "/editarComercio.do";
	public static final String URL_ACTUALIZAR_COMERCIO = SEGURIDAD_COMERCIOS + "/actualizarComercio.do";
	public static final String URL_BORRAR_COMERCIO = SEGURIDAD_COMERCIOS + "/borrarComercio.do";
    public static final String URL_BUSCAR_COMERCIOS = SEGURIDAD_COMERCIOS + "/buscarComercios.do";
    public static final String URL_VER_PROMOCION_FORM = SEGURIDAD_COMERCIOS + "/verPromocionForm.do";
    public static final String URL_VER_LISTADO_PROMOCIONES = SEGURIDAD_COMERCIOS + "/listadoPromociones.do";
    public static final String URL_VER_ESTADISTICAS_COMERCIO = SEGURIDAD_COMERCIOS + "/comercio/verMisEstadisticas{idEntidad}.do";


	

	// Compras
	public static final String URL_LISTADO_COMPRAS = SEGURIDAD_COMPRAS + "/listadoCompras" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_COMPRAS_FILTRADO = SEGURIDAD_COMPRAS + "/listadoComprasFiltrado" + SUFIJO_PAGINACION;
	public static final String URL_ALTA_COMPRA = SEGURIDAD_COMPRAS + "/altaCompra.do";
	public static final String URL_INSERTAR_COMPRA = SEGURIDAD_COMPRAS + "/insertarCompra.do";
	public static final String URL_EDITAR_COMPRA = SEGURIDAD_COMPRAS + "/editarCompra.do";
	public static final String URL_ACTUALIZAR_COMPRA = SEGURIDAD_COMPRAS + "/actualizarCompra.do";
	public static final String URL_BORRAR_COMPRA = SEGURIDAD_COMPRAS + "/borrarCompra.do";
    public static final String URL_BUSCAR_COMPRAS = SEGURIDAD_COMPRAS + "/buscarCompras.do";
	public static final String URL_LISTADO_COMPRAS_COMERCIO_ADMIN = SEGURIDAD_COMPRAS + "/admin/comercio/{idComercio}/listadoCompras" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_COMPRAS_COMERCIO = SEGURIDAD_COMPRAS + "/comercio/{idComercio}/listadoCompras" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_COMPRAS_CLIENTE = SEGURIDAD_COMPRAS + "/cliente/{idCliente}/listadoCompras" + SUFIJO_PAGINACION;
    
    
	// Canjes
	public static final String URL_LISTADO_CANJES = SEGURIDAD_CANJES + "/listadoCanjes" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_CANJES_FILTRADO = SEGURIDAD_CANJES + "/listadoCanjesFiltrado" + SUFIJO_PAGINACION;
	public static final String URL_ALTA_CANJE = SEGURIDAD_CANJES + "/altaCanje.do";
	public static final String URL_INSERTAR_CANJE = SEGURIDAD_CANJES + "/insertarCanje.do";
	public static final String URL_EDITAR_CANJE = SEGURIDAD_CANJES + "/editarCanje.do";
	public static final String URL_ACTUALIZAR_CANJE = SEGURIDAD_CANJES + "/actualizarCanje.do";
	public static final String URL_BORRAR_CANJE = SEGURIDAD_CANJES + "/borrarCanje.do";
    public static final String URL_BUSCAR_CANJES = SEGURIDAD_CANJES + "/buscarCanjes.do";
	public static final String URL_LISTADO_CANJES_COMERCIO = SEGURIDAD_CANJES + "/comercio/{idComercio}/listadoCanjes" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_CANJES_CLIENTE = SEGURIDAD_CANJES + "/cliente/{idCliente}/listadoCanjes" + SUFIJO_PAGINACION;
    


	

	// Puntos
	public static final String URL_LISTADO_PUNTOS = SEGURIDAD_PUNTOS + "/listadoPuntos" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_PUNTOS_USUARIO = SEGURIDAD_PUNTOS + "/cliente/{idCliente}/listadoPuntos" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_PUNTOS_FILTRADO = SEGURIDAD_PUNTOS + "/listadoPuntosFiltrado" + SUFIJO_PAGINACION;
	public static final String URL_ALTA_PUNTO = SEGURIDAD_PUNTOS + "/altaPunto.do";
	public static final String URL_INSERTAR_PUNTO = SEGURIDAD_PUNTOS + "/insertarPunto.do";
	public static final String URL_EDITAR_PUNTO = SEGURIDAD_PUNTOS + "/editarPunto.do";
	public static final String URL_ACTUALIZAR_PUNTO = SEGURIDAD_PUNTOS + "/actualizarPunto.do";
	public static final String URL_BORRAR_PUNTO = SEGURIDAD_PUNTOS + "/borrarPunto.do";
    public static final String URL_BUSCAR_PUNTOS = SEGURIDAD_PUNTOS + "/buscarPuntos.do";

    public static final String URL_VER_PUNTOS_FORM = SEGURIDAD_PUNTOS + "/verPuntosForm{accion}.do";
    public static final String URL_VER_EMITIR_PUNTOS_FORM = SEGURIDAD_PUNTOS + "/verEmitirPuntosForm.do";
    public static final String URL_VER_CANJEAR_PUNTOS_FORM = SEGURIDAD_PUNTOS + "/verCanjearPuntosForm.do";
    public static final String URL_GENERAR_CODIGO_PUNTOS = SEGURIDAD_PUNTOS + "/generarCodigoPuntos{cantPuntos}.do";
    public static final String URL_GENERAR_CODIGO_PUNTOS_CLIENTE = SEGURIDAD_PUNTOS + "/cliente/generarCodigoPuntos" + SUFIJO_PAGINACION;;
    public static final String URL_VER_ESCANEAR_CODIGO_CLIENTE = SEGURIDAD_PUNTOS + "/cliente/verEscanearCodigo.do";
    public static final String URL_VER_ESCANEAR_CODIGO_COMERCIO = SEGURIDAD_PUNTOS + "/comercio/verEscanearCodigo.do";
    public static final String URL_GENERAR_PUNTOS = SEGURIDAD_PUNTOS + "/generarPuntos.do";
    public static final String URL_CANJEAR_PUNTOS = SEGURIDAD_PUNTOS + "/comercio/canjearPuntos.do";
    public static final String URL_GUARDAR_PUNTOS = SEGURIDAD_PUNTOS + "/cliente/guardarPuntos.do";



	

}
