package es.golemdr.prefieromizona.controller;



import java.lang.reflect.InvocationTargetException;
import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.beanutils.BeanUtils;
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
import es.golemdr.prefieromizona.domain.form.CanjeForm;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.ext.utils.paginacion.PaginacionBean;
import es.golemdr.prefieromizona.service.CanjesService;



@Controller
public class CanjesController {

	private static Logger log = LogManager.getLogger(CanjesController.class);

	private static final String CANJES = "canjes";
	private static final String CANJE = "canje";

	@Autowired
	private CanjesService canjesService;



	@GetMapping(value=UrlConstants.URL_LISTADO_CANJES)
	public String list(@PathVariable("inicio") int inicio,Map<String, Object> map, HttpServletRequest request) {

		List<Canje> resultado = null;
        boolean hayFiltro = false;


		PaginacionBean paginacion = new PaginacionBean();
		paginacion.setInicio(inicio - 1);

		resultado = canjesService.getCanjes(paginacion);

		map.put("paginacion", paginacion);
		map.put(CANJES, resultado);
		map.put(CANJE,new CanjeForm());
        map.put(Constantes.ATRIBUTO_SESSION_HAY_FILTRO, hayFiltro);

		return ForwardConstants.FWD_LISTADO_CANJES;
	}
	
	@GetMapping(value=UrlConstants.URL_LISTADO_CANJES_COMERCIO)
	public String listCanjesComercio(@PathVariable("inicio") int inicio, @PathVariable("idComercio") String idComercio, Map<String, Object> map, HttpServletRequest request) {		

		List<Canje> resultado = null;
		String tipo = "comercio";
		
		PaginacionBean paginacion = new PaginacionBean();
		paginacion.setInicio(inicio - 1);

		resultado = canjesService.getCanjes(paginacion, Long.valueOf(idComercio), tipo);

		map.put("paginacion", paginacion);
		map.put(CANJES, resultado);
		map.put(CANJE, new CanjeForm());
		map.put("idComercio", idComercio);
		map.put("tipo", tipo);


		return ForwardConstants.FWD_LISTADO_CANJES;
	}	
	
	@GetMapping(value=UrlConstants.URL_LISTADO_CANJES_CLIENTE)
	public String listCanjesCliente(@PathVariable("inicio") int inicio, @PathVariable("idCliente") String idCliente, Map<String, Object> map, HttpServletRequest request) {		

		List<Canje> resultado = null;
		String tipo = "cliente";
		
		PaginacionBean paginacion = new PaginacionBean();
		paginacion.setInicio(inicio - 1);
		resultado = canjesService.getCanjes(paginacion, Long.valueOf(idCliente), tipo);
		

		map.put("paginacion", paginacion);
		map.put(CANJES, resultado);
		map.put(CANJE, new CanjeForm());
		map.put("idCliente", idCliente);
		map.put("tipo", tipo);


		return ForwardConstants.FWD_LISTADO_CANJES;
	}	


	@PostMapping(value=UrlConstants.URL_INSERTAR_CANJE)
	public String insertar(CanjeForm formulario, Model model) {

		Canje entity = new Canje();

		try {

			BeanUtils.copyProperties(entity, formulario);

		} catch (IllegalAccessException | InvocationTargetException e) {

			log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
		}


		canjesService.insertarCanje(entity);

		return ForwardConstants.RED_LISTADO_CANJES; 
	}


	@PostMapping(value=UrlConstants.URL_EDITAR_CANJE)
	public String editar(String idCanje, Map<String, Object> map) {

		Canje entity = canjesService.getById(Long.valueOf(idCanje));

		CanjeForm formulario = new CanjeForm();

		try {

			BeanUtils.copyProperties(formulario, entity);

		} catch (IllegalAccessException | InvocationTargetException e) {

			log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
		}


		map.put("modo", "actualizar");
		map.put(CANJE,formulario);

		return ForwardConstants.FWD_CANJE_FORM;
	}


	@PostMapping(value=UrlConstants.URL_ACTUALIZAR_CANJE)
	public String actualizar(@Valid CanjeForm formulario, BindingResult result, Model model) {


		String destino = null;

		if (result.hasErrors()) {

			model.addAttribute("modo", "actualizar");
			destino = ForwardConstants.FWD_CANJE_FORM;

		}else{

			Canje entity = new Canje();

			try {

				BeanUtils.copyProperties(entity, formulario);

				canjesService.actualizarCanje(entity);

				destino = ForwardConstants.RED_LISTADO_CANJES;


			} catch (IllegalAccessException | InvocationTargetException e) {

				log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
			}

		}

		return destino;
	}


	@PostMapping(value=UrlConstants.URL_BORRAR_CANJE)
	public String borrar(String idCanje, Map<String, Object> map) {

		canjesService.borrarCanje(Long.valueOf(idCanje));

		return ForwardConstants.RED_LISTADO_CANJES;

	}




}

