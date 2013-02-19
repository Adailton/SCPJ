package br.com.appscpj.dao;

import br.com.appscpj.domain.Processo;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Processo.class)
public interface ProcessoDao {
}
