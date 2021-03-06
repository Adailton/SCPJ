// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.appscpj.domain;

import br.com.appscpj.dao.AdvogadoDao;
import br.com.appscpj.domain.AdvogadoDataOnDemand;
import br.com.appscpj.domain.AdvogadoIntegrationTest;
import br.com.appscpj.service.AdvogadoService;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AdvogadoIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AdvogadoIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AdvogadoIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: AdvogadoIntegrationTest: @Transactional;
    
    @Autowired
    AdvogadoDataOnDemand AdvogadoIntegrationTest.dod;
    
    @Autowired
    AdvogadoService AdvogadoIntegrationTest.advogadoService;
    
    @Autowired
    AdvogadoDao AdvogadoIntegrationTest.advogadoDao;
    
    @Test
    public void AdvogadoIntegrationTest.testCountAllAdvogadoes() {
        Assert.assertNotNull("Data on demand for 'Advogado' failed to initialize correctly", dod.getRandomAdvogado());
        long count = advogadoService.countAllAdvogadoes();
        Assert.assertTrue("Counter for 'Advogado' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AdvogadoIntegrationTest.testFindAdvogado() {
        Advogado obj = dod.getRandomAdvogado();
        Assert.assertNotNull("Data on demand for 'Advogado' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Advogado' failed to provide an identifier", id);
        obj = advogadoService.findAdvogado(id);
        Assert.assertNotNull("Find method for 'Advogado' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Advogado' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AdvogadoIntegrationTest.testFindAllAdvogadoes() {
        Assert.assertNotNull("Data on demand for 'Advogado' failed to initialize correctly", dod.getRandomAdvogado());
        long count = advogadoService.countAllAdvogadoes();
        Assert.assertTrue("Too expensive to perform a find all test for 'Advogado', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Advogado> result = advogadoService.findAllAdvogadoes();
        Assert.assertNotNull("Find all method for 'Advogado' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Advogado' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AdvogadoIntegrationTest.testFindAdvogadoEntries() {
        Assert.assertNotNull("Data on demand for 'Advogado' failed to initialize correctly", dod.getRandomAdvogado());
        long count = advogadoService.countAllAdvogadoes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Advogado> result = advogadoService.findAdvogadoEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Advogado' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Advogado' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AdvogadoIntegrationTest.testFlush() {
        Advogado obj = dod.getRandomAdvogado();
        Assert.assertNotNull("Data on demand for 'Advogado' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Advogado' failed to provide an identifier", id);
        obj = advogadoService.findAdvogado(id);
        Assert.assertNotNull("Find method for 'Advogado' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAdvogado(obj);
        Integer currentVersion = obj.getVersion();
        advogadoDao.flush();
        Assert.assertTrue("Version for 'Advogado' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AdvogadoIntegrationTest.testUpdateAdvogadoUpdate() {
        Advogado obj = dod.getRandomAdvogado();
        Assert.assertNotNull("Data on demand for 'Advogado' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Advogado' failed to provide an identifier", id);
        obj = advogadoService.findAdvogado(id);
        boolean modified =  dod.modifyAdvogado(obj);
        Integer currentVersion = obj.getVersion();
        Advogado merged = advogadoService.updateAdvogado(obj);
        advogadoDao.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Advogado' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AdvogadoIntegrationTest.testSaveAdvogado() {
        Assert.assertNotNull("Data on demand for 'Advogado' failed to initialize correctly", dod.getRandomAdvogado());
        Advogado obj = dod.getNewTransientAdvogado(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Advogado' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Advogado' identifier to be null", obj.getId());
        advogadoService.saveAdvogado(obj);
        advogadoDao.flush();
        Assert.assertNotNull("Expected 'Advogado' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AdvogadoIntegrationTest.testDeleteAdvogado() {
        Advogado obj = dod.getRandomAdvogado();
        Assert.assertNotNull("Data on demand for 'Advogado' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Advogado' failed to provide an identifier", id);
        obj = advogadoService.findAdvogado(id);
        advogadoService.deleteAdvogado(obj);
        advogadoDao.flush();
        Assert.assertNull("Failed to remove 'Advogado' with identifier '" + id + "'", advogadoService.findAdvogado(id));
    }
    
}
