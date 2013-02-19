package br.com.appscpj.domain;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
@RooJson(deepSerialize = true)
public class Parte {

    @NotNull
    private String nome;

    @NotNull
    @Max(11L)
    private int rg;

    @NotNull
    @Max(11L)
    private int cpf;

    @NotNull
    private String rua;

    @NotNull
    private String numero;

    private String complemento;

    @NotNull
    private String bairro;

    @NotNull
    private String cidade;

    @NotNull
    private String uf;

    @NotNull
    private String celular;

    private String email;
}
