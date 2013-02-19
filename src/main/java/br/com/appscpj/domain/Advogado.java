package br.com.appscpj.domain;

import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
@RooJson(deepSerialize = true)
public class Advogado {

    @NotNull
    private String nome;

    @NotNull
    private String oab;

    private String rua;

    private String numero;

    private String complemento;

    private String bairro;

    private String cidade;

    private String uf;

    @NotNull
    private String celular;

    @NotNull
    private String email;
}
