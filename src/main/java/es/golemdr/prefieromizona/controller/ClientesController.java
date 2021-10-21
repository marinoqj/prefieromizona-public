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
import es.golemdr.prefieromizona.domain.Cliente;
import es.golemdr.prefieromizona.domain.Usuario;
import es.golemdr.prefieromizona.domain.form.ClienteForm;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.ext.utils.paginacion.PaginacionBean;
import es.golemdr.prefieromizona.service.ClientesService;



@Controller
public class ClientesController {

	private static Logger log = LogManager.getLogger(ClientesController.class);

	private static final String CLIENTES = "clientes";
	private static final String CLIENTE = "cliente";

	@Autowired
	private ClientesService clientesService;



	@GetMapping(value=UrlConstants.URL_LISTADO_CLIENTES)
	public String list(@PathVariable("inicio") int inicio,Map<String, Object> map, HttpServletRequest request) {

		List<Cliente> resultado = null;
        boolean hayFiltro = false;


		PaginacionBean paginacion = new PaginacionBean();
		paginacion.setInicio(inicio - 1);

		resultado = clientesService.getClientesPaginados(paginacion);

		map.put("paginacion", paginacion);
		map.put(CLIENTES, resultado);
		map.put(CLIENTE,new ClienteForm());
        map.put(Constantes.ATRIBUTO_SESSION_HAY_FILTRO, hayFiltro);

		return ForwardConstants.FWD_LISTADO_CLIENTES;
	}


	@PostMapping(value=UrlConstants.URL_INSERTAR_CLIENTE)
	public String insertar(ClienteForm formulario, Model model) {

		Cliente entity = new Cliente();

		try {

			BeanUtils.copyProperties(entity, formulario);

		} catch (IllegalAccessException | InvocationTargetException e) {

			log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
		}


		clientesService.insertarCliente(entity);

		return ForwardConstants.RED_LISTADO_CLIENTES; 
	}


	@PostMapping(value=UrlConstants.URL_EDITAR_CLIENTE)
	public String editar(String idCliente, Map<String, Object> map) {

		Cliente entity = clientesService.getById(Long.valueOf(idCliente));

		ClienteForm formulario = new ClienteForm();

		try {

			BeanUtils.copyProperties(formulario, entity);

		} catch (IllegalAccessException | InvocationTargetException e) {

			log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
		}


		map.put("modo", "actualizar");
		map.put(CLIENTE,formulario);

		return ForwardConstants.FWD_CLIENTE_FORM;
	}


	@PostMapping(value=UrlConstants.URL_ACTUALIZAR_CLIENTE)
	public String actualizar(@Valid ClienteForm formulario, BindingResult result, Model model) {


		String destino = null;

		if (result.hasErrors()) {

			model.addAttribute("modo", "actualizar");
			destino = ForwardConstants.FWD_CLIENTE_FORM;

		}else{

			Cliente entity = new Cliente();

			try {

				BeanUtils.copyProperties(entity, formulario);

				clientesService.actualizarCliente(entity);

				destino = ForwardConstants.RED_LISTADO_CLIENTES;


			} catch (IllegalAccessException | InvocationTargetException e) {

				log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
			}

		}

		return destino;
	}


	@PostMapping(value=UrlConstants.URL_BORRAR_CLIENTE)
	public String borrar(String idCliente, Map<String, Object> map) {

		clientesService.borrarCliente(Long.valueOf(idCliente));

		return ForwardConstants.RED_LISTADO_CLIENTES;

	}

	@GetMapping(value=UrlConstants.URL_VER_NOTIFICACIONES)
	public String verNotificaciones(HttpServletRequest request) {
		
		Usuario usuarioLogado = (Usuario) request.getSession(false).getAttribute(Constantes.ATRIBUTO_SESSION_USUARIO);
		Long idCliente = usuarioLogado.getCliente().getIdCliente();

		return ForwardConstants.FWD_VER_NOTIFICACIONES;

	}





}

