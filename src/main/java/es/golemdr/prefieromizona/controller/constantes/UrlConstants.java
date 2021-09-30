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

	

	// Clientes
	public static final String URL_LISTADO_CLIENTES = SEGURIDAD_CLIENTES + "/listadoClientes" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_CLIENTES_FILTRADO = SEGURIDAD_CLIENTES + "/listadoClientesFiltrado" + SUFIJO_PAGINACION;
	public static final String URL_ALTA_CLIENTE = SEGURIDAD_CLIENTES + "/altaCliente.do";
	public static final String URL_INSERTAR_CLIENTE = SEGURIDAD_CLIENTES + "/insertarCliente.do";
	public static final String URL_EDITAR_CLIENTE = SEGURIDAD_CLIENTES + "/editarCliente.do";
	public static final String URL_ACTUALIZAR_CLIENTE = SEGURIDAD_CLIENTES + "/actualizarCliente.do";
	public static final String URL_BORRAR_CLIENTE = SEGURIDAD_CLIENTES + "/borrarCliente.do";
    public static final String URL_BUSCAR_CLIENTES = SEGURIDAD_CLIENTES + "/buscarClientes.do";


	

	// Comercios
	public static final String URL_LISTADO_COMERCIOS = SEGURIDAD_COMERCIOS + "/listadoComercios" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_COMERCIOS_FILTRADO = SEGURIDAD_COMERCIOS + "/listadoComerciosFiltrado" + SUFIJO_PAGINACION;
	public static final String URL_ALTA_COMERCIO = SEGURIDAD_COMERCIOS + "/altaComercio.do";
	public static final String URL_INSERTAR_COMERCIO = SEGURIDAD_COMERCIOS + "/insertarComercio.do";
	public static final String URL_EDITAR_COMERCIO = SEGURIDAD_COMERCIOS + "/editarComercio.do";
	public static final String URL_ACTUALIZAR_COMERCIO = SEGURIDAD_COMERCIOS + "/actualizarComercio.do";
	public static final String URL_BORRAR_COMERCIO = SEGURIDAD_COMERCIOS + "/borrarComercio.do";
    public static final String URL_BUSCAR_COMERCIOS = SEGURIDAD_COMERCIOS + "/buscarComercios.do";


	

	// Compras
	public static final String URL_LISTADO_COMPRAS = SEGURIDAD_COMPRAS + "/listadoCompras" + SUFIJO_PAGINACION;
	public static final String URL_LISTADO_COMPRAS_FILTRADO = SEGURIDAD_COMPRAS + "/listadoComprasFiltrado" + SUFIJO_PAGINACION;
	public static final String URL_ALTA_COMPRA = SEGURIDAD_COMPRAS + "/altaCompra.do";
	public static final String URL_INSERTAR_COMPRA = SEGURIDAD_COMPRAS + "/insertarCompra.do";
	public static final String URL_EDITAR_COMPRA = SEGURIDAD_COMPRAS + "/editarCompra.do";
	public static final String URL_ACTUALIZAR_COMPRA = SEGURIDAD_COMPRAS + "/actualizarCompra.do";
	public static final String URL_BORRAR_COMPRA = SEGURIDAD_COMPRAS + "/borrarCompra.do";
    public static final String URL_BUSCAR_COMPRAS = SEGURIDAD_COMPRAS + "/buscarCompras.do";
    
    
    // Puntos
    public static final String URL_VER_PUNTOS_FORM = SEGURIDAD_PUNTOS + "/verPuntosForm{accion}.do";
    public static final String URL_GENERAR_PUNTOS = SEGURIDAD_PUNTOS + "/generarPuntos.do";
    public static final String URL_CANJEAR_PUNTOS = SEGURIDAD_PUNTOS + "/canjearPuntos.do";


	

}
