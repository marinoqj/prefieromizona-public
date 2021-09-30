package es.golemdr.prefieromizona.controller;

import java.lang.reflect.InvocationTargetException;
import java.sql.Date;
import java.text.MessageFormat;
import java.util.Map;

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
import es.golemdr.prefieromizona.domain.Comercio;
import es.golemdr.prefieromizona.domain.Compra;
import es.golemdr.prefieromizona.domain.form.ComercioForm;
import es.golemdr.prefieromizona.domain.form.PuntosForm;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.service.ClientesService;
import es.golemdr.prefieromizona.service.ComerciosService;
import es.golemdr.prefieromizona.service.ComprasService;

@Controller
public class PuntosController {
	
	private static Logger log = LogManager.getLogger(PuntosController.class);



	@Autowired
	private ComerciosService comerciosService;
	
	@Autowired
	private ClientesService clientesService;
	
	@Autowired
	private ComprasService comprasService;
	
	
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
	public String editar(@Valid PuntosForm formulario, BindingResult result, Model model) {

		

		Cliente cliente = clientesService.findByCodCliente(formulario.getCodCliente());
		
		Comercio comercio = comerciosService.findByCodComercio(formulario.getCodComercio());
		
		Compra compra = new Compra();
		compra.setCliente(cliente);
		compra.setComercio(comercio);
		compra.setFechaCompra(new Date(System.currentTimeMillis()));
		compra.setFechaCanje(null);
		compra.setPuntos(Long.valueOf(formulario.getCantidadPuntos()));
		
		comprasService.insertarCompra(compra);
		
		
		model.addAttribute("mensaje", "generacion.puntos.ok");
		
		return ForwardConstants.FWD_MENSAJE;
	}

}
