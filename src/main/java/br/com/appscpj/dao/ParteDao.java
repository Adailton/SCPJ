package br.com.appscpj.dao;

import br.com.appscpj.domain.Parte;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Parte.class)
public interface ParteDao {
}
