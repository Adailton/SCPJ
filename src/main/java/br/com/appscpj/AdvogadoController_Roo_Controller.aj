// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.appscpj;

import br.com.appscpj.AdvogadoController;
import br.com.appscpj.domain.Advogado;
import br.com.appscpj.service.AdvogadoService;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AdvogadoController_Roo_Controller {
    
    @Autowired
    AdvogadoService AdvogadoController.advogadoService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AdvogadoController.create(@Valid Advogado advogado, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, advogado);
            return "advogadoes/create";
        }
        uiModel.asMap().clear();
        advogadoService.saveAdvogado(advogado);
        return "redirect:/advogadoes/" + encodeUrlPathSegment(advogado.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AdvogadoController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Advogado());
        return "advogadoes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AdvogadoController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("advogado", advogadoService.findAdvogado(id));
        uiModel.addAttribute("itemId", id);
        return "advogadoes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AdvogadoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("advogadoes", advogadoService.findAdvogadoEntries(firstResult, sizeNo));
            float nrOfPages = (float) advogadoService.countAllAdvogadoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("advogadoes", advogadoService.findAllAdvogadoes());
        }
        return "advogadoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AdvogadoController.update(@Valid Advogado advogado, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, advogado);
            return "advogadoes/update";
        }
        uiModel.asMap().clear();
        advogadoService.updateAdvogado(advogado);
        return "redirect:/advogadoes/" + encodeUrlPathSegment(advogado.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AdvogadoController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, advogadoService.findAdvogado(id));
        return "advogadoes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AdvogadoController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Advogado advogado = advogadoService.findAdvogado(id);
        advogadoService.deleteAdvogado(advogado);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/advogadoes";
    }
    
    void AdvogadoController.populateEditForm(Model uiModel, Advogado advogado) {
        uiModel.addAttribute("advogado", advogado);
    }
    
    String AdvogadoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
