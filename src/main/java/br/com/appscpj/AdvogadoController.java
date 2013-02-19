package br.com.appscpj;

import br.com.appscpj.domain.Advogado;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Advogado.class)
@Controller
@RequestMapping("/advogadoes")
@RooWebScaffold(path = "advogadoes", formBackingObject = Advogado.class)
public class AdvogadoController {
}
