package es.golemdr.prefieromizona.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import es.golemdr.prefieromizona.controller.constantes.ForwardConstants;
import es.golemdr.prefieromizona.controller.constantes.UrlConstants;

@Controller
public class PublicNavigationController {
	

	@GetMapping(value=UrlConstants.URL_VER_COMO_FUNCIONA)
	public String verComoFunciona() {

		return ForwardConstants.FWD_COMO_FUNCIONA;
	}

	@GetMapping(value=UrlConstants.URL_VER_ESTABLECIMIENTOS)
	public String verEstablecimientos() {

		return ForwardConstants.FWD_ESTABLECIMIENTOS;
	}

	@GetMapping(value=UrlConstants.URL_VER_OFERTAS)
	public String verOfertas() {

		return ForwardConstants.FWD_OFERTAS;
	}
	
	@GetMapping(value=UrlConstants.URL_VER_NOTICIAS)
	public String verNoticias() {

		return ForwardConstants.FWD_NOTICIAS;
	}

}
