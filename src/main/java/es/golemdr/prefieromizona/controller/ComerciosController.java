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
import es.golemdr.prefieromizona.domain.Comercio;
import es.golemdr.prefieromizona.domain.form.ComercioForm;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.ext.utils.paginacion.PaginacionBean;
import es.golemdr.prefieromizona.service.ComerciosService;



@Controller
public class ComerciosController {

	private static Logger log = LogManager.getLogger(ComerciosController.class);

	private static final String COMERCIOS = "comercios";
	private static final String COMERCIO = "comercio";

	@Autowired
	private ComerciosService comerciosService;



	@GetMapping(value=UrlConstants.URL_LISTADO_COMERCIOS)
	public String list(@PathVariable("inicio") int inicio, Map<String, Object> map, HttpServletRequest request) {

		List<Comercio> resultado = null;
        boolean hayFiltro = false;


		PaginacionBean paginacion = new PaginacionBean();
		paginacion.setInicio(inicio - 1);

		resultado = comerciosService.getComerciosPaginados(paginacion);

		map.put("paginacion", paginacion);
		map.put(COMERCIOS, resultado);
		map.put(COMERCIO,new ComercioForm());
        map.put(Constantes.ATRIBUTO_SESSION_HAY_FILTRO, hayFiltro);

		return ForwardConstants.FWD_LISTADO_COMERCIOS;
	}


	@PostMapping(value=UrlConstants.URL_INSERTAR_COMERCIO)
	public String insertar(ComercioForm formulario, Model model) {

		Comercio entity = new Comercio();

		try {

			BeanUtils.copyProperties(entity, formulario);

		} catch (IllegalAccessException | InvocationTargetException e) {

			log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
		}


		comerciosService.insertarComercio(entity);

		return ForwardConstants.RED_LISTADO_COMERCIOS; 
	}


	@PostMapping(value=UrlConstants.URL_EDITAR_COMERCIO)
	public String editar(String idComercio, Map<String, Object> map) {

		Comercio entity = comerciosService.getById(Long.valueOf(idComercio));

		ComercioForm formulario = new ComercioForm();

		try {

			BeanUtils.copyProperties(formulario, entity);

		} catch (IllegalAccessException | InvocationTargetException e) {

			log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
		}


		map.put("modo", "actualizar");
		map.put(COMERCIO,formulario);

		return ForwardConstants.FWD_COMERCIO_FORM;
	}


	@PostMapping(value=UrlConstants.URL_ACTUALIZAR_COMERCIO)
	public String actualizar(@Valid ComercioForm formulario, BindingResult result, Model model) {


		String destino = null;

		if (result.hasErrors()) {

			model.addAttribute("modo", "actualizar");
			destino = ForwardConstants.FWD_COMERCIO_FORM;

		}else{

			Comercio entity = new Comercio();

			try {

				BeanUtils.copyProperties(entity, formulario);

				comerciosService.actualizarComercio(entity);

				destino = ForwardConstants.RED_LISTADO_COMERCIOS;


			} catch (IllegalAccessException | InvocationTargetException e) {

				log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
			}

		}

		return destino;
	}


	@PostMapping(value=UrlConstants.URL_BORRAR_COMERCIO)
	public String borrar(String idComercio, Map<String, Object> map) {

		comerciosService.borrarComercio(Long.valueOf(idComercio));

		return ForwardConstants.RED_LISTADO_COMERCIOS;

	}
	
	@GetMapping(value=UrlConstants.URL_VER_PROMOCION_FORM)
	public String verEstablecimientos() {

		return ForwardConstants.FWD_PROMOCION_FORM;
	}

	@GetMapping(value=UrlConstants.URL_VER_ESTADISTICAS_COMERCIO)
	public String verMisEstadisticas(@PathVariable("idEntidad") Long idEntidad, Map<String, Object> map, HttpServletRequest request) {

		return ForwardConstants.FWD_ESTADISTICAS_COMERCIO;
	}



}

