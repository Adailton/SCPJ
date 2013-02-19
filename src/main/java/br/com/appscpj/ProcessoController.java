package br.com.appscpj;

import br.com.appscpj.domain.Processo;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Processo.class)
@Controller
@RequestMapping("/processoes")
@RooWebScaffold(path = "processoes", formBackingObject = Processo.class)
public class ProcessoController {
}
