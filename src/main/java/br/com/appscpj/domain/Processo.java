package br.com.appscpj.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
@RooJson(deepSerialize = true)
public class Processo {

    private BigDecimal numero;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date dataAbertura;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date dataEncerramento;

    @NotNull
    private String status;

    @NotNull
    private String tipoProcesso;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Parte> partes = new HashSet<Parte>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Advogado> advogados = new HashSet<Advogado>();
}
