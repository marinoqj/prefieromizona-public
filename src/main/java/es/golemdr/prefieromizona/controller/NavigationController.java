package es.golemdr.prefieromizona.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NavigationController {
	
	@GetMapping(value = "/inicio.do")
	public String inicio() {
		
		return "Home";
	}
	
}
