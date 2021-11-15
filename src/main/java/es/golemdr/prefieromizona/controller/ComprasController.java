package es.golemdr.prefieromizona.controller;



import java.lang.reflect.InvocationTargetException;
import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import es.golemdr.prefieromizona.domain.Compra;
import es.golemdr.prefieromizona.domain.Usuario;
import es.golemdr.prefieromizona.domain.form.CompraForm;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.ext.exceptions.AccessDeniedException;
import es.golemdr.prefieromizona.ext.utils.paginacion.PaginacionBean;
import es.golemdr.prefieromizona.service.ComprasService;



@Controller
public class ComprasController {

	private static Logger log = LogManager.getLogger(ComprasController.class);

	private static final String COMPRAS = "compras";
	private static final String COMPRA = "compra";

	@Autowired
	private ComprasService comprasService;



	@GetMapping(value=UrlConstants.URL_LISTADO_COMPRAS)
	public String list(@PathVariable("inicio") int inicio,Map<String, Object> map, HttpServletRequest request) {

		List<Compra> resultado = null;
        boolean hayFiltro = false;
        boolean misCompras = false;


		PaginacionBean paginacion = new PaginacionBean();
		paginacion.setInicio(inicio - 1);

		resultado = comprasService.getComprasPaginado(paginacion);

		map.put("paginacion", paginacion);
		map.put(COMPRAS, resultado);
		map.put(COMPRA,new CompraForm());
        map.put(Constantes.ATRIBUTO_SESSION_HAY_FILTRO, hayFiltro);
        map.put("misCompras", misCompras);

		return ForwardConstants.FWD_LISTADO_COMPRAS;
	}
	
	/**
	 * Este método es muy similar al de la consulta de compras que hace un comercio, a excepción de que cuando es el ADMIN el que realiza
	 * la consulta deben de aparecer en el listado tanto los datos del comercio, como los del cliente.
	 * @param inicio
	 * @param idComercio
	 * @param map
	 * @param request
	 * @return
	 */
	@GetMapping(value=UrlConstants.URL_LISTADO_COMPRAS_COMERCIO_ADMIN)
	public String listComprasComercioAdmin(@PathVariable("inicio") int inicio, @PathVariable("idComercio") String idComercio, Map<String, Object> map, HttpServletRequest request) {		

		List<Compra> resultado = null;
		String tipoConsulta = "comercio";
		
		PaginacionBean paginacion = new PaginacionBean();
		paginacion.setInicio(inicio - 1);

		resultado = comprasService.getCompras(paginacion, Long.valueOf(idComercio), tipoConsulta);

		map.put("paginacion", paginacion);
		map.put(COMPRAS, resultado);
		map.put(COMPRA, new CompraForm());
		map.put("idComercio", idComercio);
		map.put("tipo", "admin");


		return ForwardConstants.FWD_LISTADO_COMPRAS;
	}	
	
	@GetMapping(value=UrlConstants.URL_LISTADO_COMPRAS_COMERCIO)
	public String listComprasComercio(@PathVariable("inicio") int inicio, @PathVariable("idComercio") String idComercio, Map<String, Object> map, HttpServletRequest request) throws AccessDeniedException {		

		String tipo = "comercio";
		map.put("idEntidad", idComercio);
		map.put("tipo", tipo);
		map.put("inicio", inicio);

		return listCompras(map, request);
	}
	
	@GetMapping(value=UrlConstants.URL_LISTADO_COMPRAS_CLIENTE)
	public String listComprasCliente(@PathVariable("inicio") int inicio, @PathVariable("idCliente") String idCliente, Map<String, Object> map, HttpServletRequest request) throws AccessDeniedException {		

		String tipo = "cliente";
		map.put("idEntidad", idCliente);
		map.put("tipo", tipo);
		map.put("inicio", inicio);

		return listCompras(map, request);
	}	
	
	private String listCompras(Map<String, Object> map, HttpServletRequest request) throws AccessDeniedException {	
		
		
		boolean hayFiltro = false;
		String idEntidad = map.get("idEntidad").toString();
		String tipo = map.get("tipo").toString();
		String inicio = map.get("inicio").toString();
		
		Usuario usuarioLogado = (Usuario) request.getSession(false).getAttribute(Constantes.ATRIBUTO_SESSION_USUARIO);
		
		if(!usuarioLogado.getIdEntidad().equals(Long.valueOf(idEntidad))) {
			throw new AccessDeniedException("Acceso denegado");
		}

		List<Compra> resultado = null;
		
		PaginacionBean paginacion = new PaginacionBean();
		paginacion.setInicio(Integer.parseInt(inicio) - 1);

		resultado = comprasService.getCompras(paginacion, Long.valueOf(idEntidad), tipo);

		map.put("paginacion", paginacion);
		map.put(COMPRAS, resultado);
		map.put(COMPRA, new CompraForm());
		map.put("tipo", tipo);
		map.put("hayFiltro", hayFiltro);


		return ForwardConstants.FWD_LISTADO_COMPRAS;
	}	


	@PostMapping(value=UrlConstants.URL_INSERTAR_COMPRA)
	public String insertar(CompraForm formulario, Model model) {

		Compra entity = new Compra();

		try {

			BeanUtils.copyProperties(entity, formulario);

		} catch (IllegalAccessException | InvocationTargetException e) {

			log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
		}


		comprasService.insertarCompra(entity);

		return ForwardConstants.RED_LISTADO_COMPRAS; 
	}


	@PostMapping(value=UrlConstants.URL_EDITAR_COMPRA)
	public String editar(String idCompra, Map<String, Object> map) {

		Compra entity = comprasService.getById(Long.valueOf(idCompra));

		CompraForm formulario = new CompraForm();

		try {

			BeanUtils.copyProperties(formulario, entity);

		} catch (IllegalAccessException | InvocationTargetException e) {

			log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
		}


		map.put("modo", "actualizar");
		map.put(COMPRA,formulario);

		return ForwardConstants.FWD_COMPRA_FORM;
	}


	@PostMapping(value=UrlConstants.URL_ACTUALIZAR_COMPRA)
	public String actualizar(@Valid CompraForm formulario, BindingResult result, Model model) {


		String destino = null;

		if (result.hasErrors()) {

			model.addAttribute("modo", "actualizar");
			destino = ForwardConstants.FWD_COMPRA_FORM;

		}else{

			Compra entity = new Compra();

			try {

				BeanUtils.copyProperties(entity, formulario);

				comprasService.actualizarCompra(entity);

				destino = ForwardConstants.RED_LISTADO_COMPRAS;


			} catch (IllegalAccessException | InvocationTargetException e) {

				log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
			}

		}

		return destino;
	}


	@PostMapping(value=UrlConstants.URL_BORRAR_COMPRA)
	public String borrar(String idCompra, Map<String, Object> map) {

		comprasService.borrarCompra(Long.valueOf(idCompra));

		return ForwardConstants.RED_LISTADO_COMPRAS;

	}



}

