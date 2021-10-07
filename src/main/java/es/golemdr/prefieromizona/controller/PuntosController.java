package es.golemdr.prefieromizona.controller;

import java.sql.Date;
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

import es.golemdr.prefieromizona.controller.constantes.ForwardConstants;
import es.golemdr.prefieromizona.controller.constantes.UrlConstants;
import es.golemdr.prefieromizona.domain.Canje;
import es.golemdr.prefieromizona.domain.Cliente;
import es.golemdr.prefieromizona.domain.Comercio;
import es.golemdr.prefieromizona.domain.Compra;
import es.golemdr.prefieromizona.domain.Punto;
import es.golemdr.prefieromizona.domain.form.PuntoForm;
import es.golemdr.prefieromizona.domain.form.PuntosForm;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.ext.utils.paginacion.PaginacionBean;
import es.golemdr.prefieromizona.service.CanjesService;
import es.golemdr.prefieromizona.service.ClientesService;
import es.golemdr.prefieromizona.service.ComerciosService;
import es.golemdr.prefieromizona.service.ComprasService;
import es.golemdr.prefieromizona.service.PuntosService;

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
	public String list(@PathVariable("accion") String accion,Map<String, Object> map) {

		map.put("puntosForm",new PuntosForm());
		
		
		if(accion.equals("generar")) {
			map.put("modo", "generar");
			
		}else if(accion.equals("canjear")) {
			map.put("modo", "canjear");
		}

		return ForwardConstants.FWD_PUNTOS_FORM;
	}
	
	
	@PostMapping(value=UrlConstants.URL_GENERAR_PUNTOS)
	public String generarPuntos(@Valid PuntosForm formulario, BindingResult result, Model model) throws Exception {

		

		Cliente cliente = clientesService.findByCodCliente(formulario.getCodCliente());
		
		Comercio comercio = comerciosService.findByCodComercio(formulario.getCodComercio());

		if(cliente == null || comercio == null) {
			throw new Exception("Cliente o comercio no v�lidos");
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
	
	@PostMapping(value=UrlConstants.URL_CANJEAR_PUNTOS)
	public String canjearPuntos(@Valid PuntosForm formulario, BindingResult result, Model model) throws Exception {

		

		Cliente cliente = clientesService.findByCodCliente(formulario.getCodCliente());
		
		Comercio comercio = comerciosService.findByCodComercio(formulario.getCodComercio());

		if(cliente == null || comercio == null) {
			throw new Exception("Cliente o comercio no v�lidos");
		}
		
		Canje canje = new Canje();
		canje.setCliente(cliente);
		canje.setComercio(comercio);
		canje.setFechaCanje(new Date(System.currentTimeMillis()));
		canje.setPuntos(Long.valueOf(formulario.getCantidadPuntos()));
		
		canjesService.insertarCanje(canje);
		
		
		model.addAttribute("mensaje", "canje.puntos.ok");
		
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
//
//
//		@PostMapping(value=UrlConstants.URL_INSERTAR_PUNTO)
//		public String insertar(PuntoForm formulario, Model model) {
//
//			Punto entity = new Punto();
//
//			try {
//
//				BeanUtils.copyProperties(entity, formulario);
//
//			} catch (IllegalAccessException | InvocationTargetException e) {
//
//				log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
//			}
//
//
//			puntosService.insertarPunto(entity);
//
//			return ForwardConstants.RED_LISTADO_PUNTOS; 
//		}
//
//
//		@PostMapping(value=UrlConstants.URL_EDITAR_PUNTO)
//		public String editar(String idPunto, Map<String, Object> map) {
//
//			Punto entity = puntosService.getById(Long.valueOf(idPunto));
//
//			PuntoForm formulario = new PuntoForm();
//
//			try {
//
//				BeanUtils.copyProperties(formulario, entity);
//
//			} catch (IllegalAccessException | InvocationTargetException e) {
//
//				log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
//			}
//
//
//			map.put("modo", "actualizar");
//			map.put(PUNTO,formulario);
//
//			return ForwardConstants.FWD_PUNTO_FORM;
//		}
//
//
//		@PostMapping(value=UrlConstants.URL_ACTUALIZAR_PUNTO)
//		public String actualizar(@Valid PuntoForm formulario, BindingResult result, Model model) {
//
//
//			String destino = null;
//
//			if (result.hasErrors()) {
//
//				model.addAttribute("modo", "actualizar");
//				destino = ForwardConstants.FWD_PUNTO_FORM;
//
//			}else{
//
//				Punto entity = new Punto();
//
//				try {
//
//					BeanUtils.copyProperties(entity, formulario);
//
//					puntosService.actualizarPunto(entity);
//
//					destino = ForwardConstants.RED_LISTADO_PUNTOS;
//
//
//				} catch (IllegalAccessException | InvocationTargetException e) {
//
//					log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
//				}
//
//			}
//
//			return destino;
//		}
//
//
//		@PostMapping(value=UrlConstants.URL_BORRAR_PUNTO)
//		public String borrar(String idPunto, Map<String, Object> map) {
//
//			puntosService.borrarPunto(Long.valueOf(idPunto));
//
//			return ForwardConstants.RED_LISTADO_PUNTOS;
//
//		}
	

}