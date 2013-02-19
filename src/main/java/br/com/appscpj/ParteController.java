package br.com.appscpj;

import br.com.appscpj.domain.Parte;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Parte.class)
@Controller
@RequestMapping("/partes")
@RooWebScaffold(path = "partes", formBackingObject = Parte.class)
public class ParteController {
}
