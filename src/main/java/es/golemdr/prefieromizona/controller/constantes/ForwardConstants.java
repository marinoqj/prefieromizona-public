package es.golemdr.prefieromizona.controller.constantes;


public class ForwardConstants {
	
	private ForwardConstants() {
		throw new IllegalStateException("ForwardConstants class");
	}

	public static final String FWD_HOME_PUBLICA = "HomePublica";
	public static final String FWD_HOME_PRIVADA = "HomePrivada";
	public static final String FWD_LOGIN = "Login";
	public static final String FWD_ACCESO_DENEGADO = "AccesoDenegado";
	public static final String FWD_MENSAJE = "Mensaje";
	
	
	// Zona p?blica
	public static final String FWD_COMO_FUNCIONA = "ComoFunciona";
	public static final String FWD_ESTABLECIMIENTOS = "Establecimientos";
	public static final String FWD_OFERTAS = "Ofertas";	
	public static final String FWD_NOTICIAS = "Noticias";
	
	// Clientes
	public static final String FWD_LISTADO_CLIENTES = "ListadoClientes";	
	public static final String RED_LISTADO_CLIENTES = "redirect:listadoClientes1.do";
	public static final String FWD_CLIENTE_FORM = "ClienteForm";
	public static final String FWD_VER_NOTIFICACIONES = "Notificaciones";
	
	// Comercios
	public static final String FWD_LISTADO_COMERCIOS = "ListadoComercios";	
	public static final String RED_LISTADO_COMERCIOS = "redirect:listadoComercios1.do";
	public static final String FWD_COMERCIO_FORM = "ComercioForm";
	public static final String FWD_PROMOCION_FORM = "PromocionForm";
	public static final String FWD_LISTADO_PROMOCIONES = "ListadoPromociones";
	public static final String FWD_ESTADISTICAS_COMERCIO = "EstadisticasComercio";
	
	// Compras
	public static final String FWD_LISTADO_COMPRAS = "ListadoCompras";
	public static final String RED_LISTADO_COMPRAS = "redirect:listadoCompras1.do";
	public static final String FWD_COMPRA_FORM = "CompraForm";

	// Canjes
	public static final String FWD_LISTADO_CANJES = "ListadoCanjes";	
	public static final String RED_LISTADO_CANJES = "redirect:listadoCanjes1.do";
	public static final String FWD_CANJE_FORM = "CanjeForm";
	
	// Puntos
	public static final String FWD_LISTADO_PUNTOS = "ListadoPuntos";	
	public static final String RED_LISTADO_PUNTOS = "redirect:listadoPuntos1.do";
	public static final String FWD_PUNTOS_FORM = "PuntosForm";
	public static final String FWD_EMITIR_PUNTOS_FORM = "EmitirPuntosForm";
	public static final String FWD_CANJEAR_PUNTOS_FORM = "CanjearPuntosForm";
	public static final String FWD_CODIGO_PUNTOS = "CodigoPuntos";
	public static final String FWD_CODIGO_PUNTOS_CLIENTE = "CodigoPuntosCliente";
	public static final String FWD_ESCANEAR_CODIGO_PUNTOS = "EscanearCodigoPuntos";
	
	

}
