package es.golemdr.prefieromizona.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.zxing.WriterException;

import es.golemdr.prefieromizona.controller.constantes.ForwardConstants;
import es.golemdr.prefieromizona.controller.constantes.UrlConstants;
import es.golemdr.prefieromizona.domain.Canje;
import es.golemdr.prefieromizona.domain.Cliente;
import es.golemdr.prefieromizona.domain.Comercio;
import es.golemdr.prefieromizona.domain.Compra;
import es.golemdr.prefieromizona.domain.Punto;
import es.golemdr.prefieromizona.domain.QRData;
import es.golemdr.prefieromizona.domain.Rol;
import es.golemdr.prefieromizona.domain.Usuario;
import es.golemdr.prefieromizona.domain.form.PuntoForm;
import es.golemdr.prefieromizona.domain.form.PuntosForm;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.ext.utils.paginacion.PaginacionBean;
import es.golemdr.prefieromizona.service.CanjesService;
import es.golemdr.prefieromizona.service.ClientesService;
import es.golemdr.prefieromizona.service.ComerciosService;
import es.golemdr.prefieromizona.service.ComprasService;
import es.golemdr.prefieromizona.service.PuntosService;
import es.golemdr.prefieromizona.utils.QRCodeUtils;

@Controller
public class PuntosController {
	
	private static Logger log = LogManager.getLogger(PuntosController.class);



	@Autowired
	private ComerciosService comerciosService;
	
	@Autowired
	private ClientesService clientesService;
	
	@Autowired
	private ComprasService comprasService;
	
	@Autowired
	private CanjesService canjesService;
	
	@Autowired
	private PuntosService puntosService;
	
	private static final String PUNTOS= "puntos";
	private static final String PUNTO = "punto";
	
	
	@GetMapping(value=UrlConstants.URL_VER_PUNTOS_FORM)
	public String verPuntosForm(@PathVariable("accion") String accion,Map<String, Object> map) {

		map.put("puntosForm",new PuntosForm());
		
		
		if(accion.equals("generar")) {
			map.put("modo", "generar");
			
		}else if(accion.equals("canjear")) {
			map.put("modo", "canjear");
		}

		return ForwardConstants.FWD_PUNTOS_FORM;
	}
	
	// TODO - Quitar este método cuando funcione lo del QR (o dejarlo si se quiere tener el formulario como alternativa)
	@PostMapping(value=UrlConstants.URL_GENERAR_PUNTOS)
	public String generarPuntos(@Valid PuntosForm formulario, BindingResult result, Model model) throws Exception {

		

		Cliente cliente = clientesService.findByCodCliente(formulario.getCodCliente());
		
		Comercio comercio = comerciosService.findByCodComercio(formulario.getCodComercio());

		if(cliente == null || comercio == null) {
			throw new Exception("Cliente o comercio no válidos");
		}
		
		Compra compra = new Compra();
		compra.setCliente(cliente);
		compra.setComercio(comercio);
		compra.setFechaCompra(new Date(System.currentTimeMillis()));
		compra.setPuntos(Long.valueOf(formulario.getCantidadPuntos()));
		
		comprasService.insertarCompra(compra);
		
		
		model.addAttribute("mensaje", "generacion.puntos.ok");
		
		return ForwardConstants.FWD_MENSAJE;
	}
	
	@PostMapping(value=UrlConstants.URL_GUARDAR_PUNTOS)
	public String guardarPuntos(String datosQR, Model model, HttpServletRequest request) throws Exception {

		Usuario usuarioLogado = (Usuario) request.getSession(false).getAttribute(Constantes.ATRIBUTO_SESSION_USUARIO);
		Long idCliente = usuarioLogado.getCliente().getIdCliente();
		Cliente cliente = clientesService.getById(idCliente);
		
		ObjectMapper mapper = new ObjectMapper();
		QRData qrData = mapper.readValue(datosQR, QRData.class);
		
		Comercio comercio = comerciosService.findByCodComercio(qrData.getCodComercio());

		if(cliente == null || comercio == null) {
			throw new Exception("Cliente o comercio no válidos");
		}
		
		Compra compra = new Compra();
		compra.setCliente(cliente);
		compra.setComercio(comercio);
		compra.setFechaCompra(new Date(System.currentTimeMillis()));
		compra.setPuntos(Long.valueOf(qrData.getCantPuntos()));
		
		comprasService.insertarCompra(compra);
		
		model.addAttribute("mensaje", "generacion.puntos.ok");
		
		return ForwardConstants.FWD_MENSAJE;
	}
	
//	@PostMapping(value=UrlConstants.URL_CANJEAR_PUNTOS)
//	public String canjearPuntos(@Valid PuntosForm formulario, BindingResult result, Model model) throws Exception {
//
//
//		Cliente cliente = clientesService.findByCodCliente(formulario.getCodCliente());
//		
//		Comercio comercio = comerciosService.findByCodComercio(formulario.getCodComercio());
//
//		if(cliente == null || comercio == null) {
//			throw new Exception("Cliente o comercio no válidos");
//		}
//		
//		Canje canje = new Canje();
//		canje.setCliente(cliente);
//		canje.setComercio(comercio);
//		canje.setFechaCanje(new Date(System.currentTimeMillis()));
//		canje.setPuntos(Long.valueOf(formulario.getCantidadPuntos()));
//		
//		canjesService.insertarCanje(canje);
//		
//		
//		model.addAttribute("mensaje", "canje.puntos.ok");
//		
//		return ForwardConstants.FWD_MENSAJE;
//	}
	
	
	@PostMapping(value=UrlConstants.URL_CANJEAR_PUNTOS)
	public String canjearPuntos(int numPuntos, String datosQR, Model model, HttpServletRequest request) throws Exception {

		Usuario usuarioLogado = (Usuario) request.getSession(false).getAttribute(Constantes.ATRIBUTO_SESSION_USUARIO);
		
		ObjectMapper mapper = new ObjectMapper();
		QRData qrData = mapper.readValue(datosQR, QRData.class);
		
		if (qrData.getCantPuntos() == 0) {
			model.addAttribute("mensaje", "canje.puntos.zero");
		} else {
			Cliente cliente = clientesService.findByCodCliente(qrData.getCodCliente());
			
			if(cliente == null) {
				throw new Exception("Cliente no válido");
			}		
			
			Comercio comercio = comerciosService.findByCodComercio(qrData.getCodComercio());
			String codComercioQR = comercio.getCodComercio();
			String codComercioLogado = usuarioLogado.getComercio().getCodComercio();
			
			// Si los códigos de comercio no coinciden se lanza una excepción
			if (codComercioQR != null && codComercioLogado != null && ( ! codComercioQR.equals(codComercioLogado))) {
				throw new Exception("Comercio no autorizado para realizar canje.");
			}
			
			Canje canje = new Canje();
			canje.setCliente(cliente);
			canje.setComercio(comercio);
			canje.setFechaCanje(new Date(System.currentTimeMillis()));
			canje.setPuntos(Long.valueOf(numPuntos));
			
			canjesService.insertarCanje(canje);
			
			
			model.addAttribute("mensaje", "canje.puntos.ok");			
		}

		
		return ForwardConstants.FWD_MENSAJE;
	}	

	

		@GetMapping(value=UrlConstants.URL_LISTADO_PUNTOS)
		public String list(@PathVariable("inicio") int inicio,Map<String, Object> map, HttpServletRequest request) {

			List<Punto> resultado = null;
	        boolean hayFiltro = false;


			PaginacionBean paginacion = new PaginacionBean();
			paginacion.setInicio(inicio - 1);

			resultado = puntosService.getPuntos(paginacion);

			map.put("paginacion", paginacion);
			map.put(PUNTOS, resultado);
			map.put(PUNTO,new PuntoForm());
	        map.put(Constantes.ATRIBUTO_SESSION_HAY_FILTRO, hayFiltro);

			return ForwardConstants.FWD_LISTADO_PUNTOS;
		}
		
		@GetMapping(value=UrlConstants.URL_LISTADO_PUNTOS_USUARIO)
		public String lisadoPuntostCliente(@PathVariable("inicio") int inicio,@PathVariable("idCliente") Long idCliente, Map<String, Object> map, HttpServletRequest request) {

			List<Punto> resultado = null;
	        boolean hayFiltro = false;


			PaginacionBean paginacion = new PaginacionBean();
			paginacion.setInicio(inicio - 1);

			resultado = puntosService.getPuntosCliente(paginacion, idCliente);

			map.put("paginacion", paginacion);
			map.put(PUNTOS, resultado);
			map.put(PUNTO,new PuntoForm());
	        map.put(Constantes.ATRIBUTO_SESSION_HAY_FILTRO, hayFiltro);

			return ForwardConstants.FWD_LISTADO_PUNTOS;
		}
		
		
		@GetMapping(value=UrlConstants.URL_GENERAR_CODIGO_PUNTOS_CLIENTE)
		public String generarCodigoQRCanjePuntostCliente(@PathVariable("inicio") int inicio, Map<String, Object> map, HttpServletRequest request) throws Exception {
			
			List<Punto> resultado = null;
			List<String> codigosQR = null;
	        boolean hayFiltro = false;
	        
	        Usuario usuarioLogado = (Usuario) request.getSession(false).getAttribute(Constantes.ATRIBUTO_SESSION_USUARIO);
	        
	        Long idCliente = usuarioLogado.getCliente().getIdCliente();

			PaginacionBean paginacion = new PaginacionBean();
			paginacion.setInicio(inicio - 1);

			resultado = puntosService.getPuntosCliente(paginacion, idCliente);
			
			try {
				codigosQR = puntosService.getPuntosClienteQR(resultado);
			} catch (WriterException | IOException e) {
				throw new Exception("Error al generar código QR con los puntos del cliente");
			}
			
			map.put("paginacion", paginacion);
			map.put(PUNTOS, resultado);
			map.put(PUNTO,new PuntoForm());
	        map.put(Constantes.ATRIBUTO_SESSION_HAY_FILTRO, hayFiltro);
	        map.put("codigosQR", codigosQR);

			return ForwardConstants.FWD_CODIGO_PUNTOS_CLIENTE;
		}		

		
		@GetMapping(value=UrlConstants.URL_VER_EMITIR_PUNTOS_FORM)
		public String verEmitirPuntosForm(Map<String, Object> map) {

			return ForwardConstants.FWD_EMITIR_PUNTOS_FORM;
		}
		
		@GetMapping(value=UrlConstants.URL_GENERAR_CODIGO_PUNTOS)
		public String generarCodigoPuntos(@PathVariable("cantPuntos") int cantPuntos, Map<String, Object> map, HttpServletRequest request) {
			
			Usuario usuarioLogado = (Usuario) request.getSession(false).getAttribute(Constantes.ATRIBUTO_SESSION_USUARIO);
			
			String codComercio = usuarioLogado.getComercio().getCodComercio();


			// Hora en milisegundos (Timestamp)
			long time = ZonedDateTime.now().toInstant().toEpochMilli();
			
			
			QRData qrData = new QRData();
			qrData.setCodComercio(codComercio);
			qrData.setCantPuntos(cantPuntos);
			qrData.setTime(time);

			try {
				ObjectMapper mapper = new ObjectMapper();
				String dataQRCode= mapper.writeValueAsString(qrData);
				String qrBase64 = QRCodeUtils.generateQRCodeBase64(dataQRCode);
				map.put("qrBase64", qrBase64);
			} catch (WriterException | IOException e) {
				map.put("mensaje", "Se ha producido un error al generar el código QR");
				map.put("traza", e.getStackTrace());
			}

			return ForwardConstants.FWD_CODIGO_PUNTOS;
		}
		
		
		@GetMapping(value=UrlConstants.URL_VER_ESCANEAR_CODIGO)
		public String verEscanearCodigoCliente(Map<String, Object> map, HttpServletRequest request) throws Exception {
			
			Usuario usuarioLogado = (Usuario) request.getSession(false).getAttribute(Constantes.ATRIBUTO_SESSION_USUARIO);
			
			List<Rol> rol = usuarioLogado.getRoles();
			
			if (rol != null && rol.size() == 1) {
				map.put("roleUser", rol.get(0).getNombreRol());
			} else {
				throw new Exception("No se puede determinar el Rol del usuario logado");
			}
			
			return ForwardConstants.FWD_ESCANEAR_CODIGO_PUNTOS;
		}		



}
