package br.com.appscpj.dao;

import br.com.appscpj.domain.Advogado;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Advogado.class)
public interface AdvogadoDao {
}
