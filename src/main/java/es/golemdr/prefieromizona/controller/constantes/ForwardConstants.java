package es.golemdr.prefieromizona.controller.constantes;


public class ForwardConstants {
	
	private ForwardConstants() {
		throw new IllegalStateException("ForwardConstants class");
	}

	public static final String FWD_HOME = "Home";
	public static final String FWD_LOGIN = "Login";
	public static final String FWD_ACCESO_DENEGADO = "AccesoDenegado";
	public static final String FWD_MENSAJE = "Mensaje";
	
	// Clientes
	public static final String FWD_LISTADO_CLIENTES = "ListadoClientes";	
	public static final String RED_LISTADO_CLIENTES = "redirect:listadoClientes1.do";
	public static final String FWD_CLIENTE_FORM = "ClienteForm";
	
	// Comercios
	public static final String FWD_LISTADO_COMERCIOS = "ListadoComercios";	
	public static final String RED_LISTADO_COMERCIOS = "redirect:listadoComercios1.do";
	public static final String FWD_COMERCIO_FORM = "ComercioForm";
	
	// Compras
	public static final String FWD_LISTADO_COMPRAS = "ListadoCompras";	
	public static final String RED_LISTADO_COMPRAS = "redirect:listadoCompras1.do";
	public static final String FWD_COMPRA_FORM = "CompraForm";
	

}
