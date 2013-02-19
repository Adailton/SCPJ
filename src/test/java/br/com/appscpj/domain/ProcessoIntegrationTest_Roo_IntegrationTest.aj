// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.appscpj.domain;

import br.com.appscpj.dao.ProcessoDao;
import br.com.appscpj.domain.ProcessoDataOnDemand;
import br.com.appscpj.domain.ProcessoIntegrationTest;
import br.com.appscpj.service.ProcessoService;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProcessoIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ProcessoIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ProcessoIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ProcessoIntegrationTest: @Transactional;
    
    @Autowired
    ProcessoDataOnDemand ProcessoIntegrationTest.dod;
    
    @Autowired
    ProcessoService ProcessoIntegrationTest.processoService;
    
    @Autowired
    ProcessoDao ProcessoIntegrationTest.processoDao;
    
    @Test
    public void ProcessoIntegrationTest.testCountAllProcessoes() {
        Assert.assertNotNull("Data on demand for 'Processo' failed to initialize correctly", dod.getRandomProcesso());
        long count = processoService.countAllProcessoes();
        Assert.assertTrue("Counter for 'Processo' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ProcessoIntegrationTest.testFindProcesso() {
        Processo obj = dod.getRandomProcesso();
        Assert.assertNotNull("Data on demand for 'Processo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Processo' failed to provide an identifier", id);
        obj = processoService.findProcesso(id);
        Assert.assertNotNull("Find method for 'Processo' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Processo' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ProcessoIntegrationTest.testFindAllProcessoes() {
        Assert.assertNotNull("Data on demand for 'Processo' failed to initialize correctly", dod.getRandomProcesso());
        long count = processoService.countAllProcessoes();
        Assert.assertTrue("Too expensive to perform a find all test for 'Processo', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Processo> result = processoService.findAllProcessoes();
        Assert.assertNotNull("Find all method for 'Processo' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Processo' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ProcessoIntegrationTest.testFindProcessoEntries() {
        Assert.assertNotNull("Data on demand for 'Processo' failed to initialize correctly", dod.getRandomProcesso());
        long count = processoService.countAllProcessoes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Processo> result = processoService.findProcessoEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Processo' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Processo' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ProcessoIntegrationTest.testFlush() {
        Processo obj = dod.getRandomProcesso();
        Assert.assertNotNull("Data on demand for 'Processo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Processo' failed to provide an identifier", id);
        obj = processoService.findProcesso(id);
        Assert.assertNotNull("Find method for 'Processo' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyProcesso(obj);
        Integer currentVersion = obj.getVersion();
        processoDao.flush();
        Assert.assertTrue("Version for 'Processo' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProcessoIntegrationTest.testUpdateProcessoUpdate() {
        Processo obj = dod.getRandomProcesso();
        Assert.assertNotNull("Data on demand for 'Processo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Processo' failed to provide an identifier", id);
        obj = processoService.findProcesso(id);
        boolean modified =  dod.modifyProcesso(obj);
        Integer currentVersion = obj.getVersion();
        Processo merged = processoService.updateProcesso(obj);
        processoDao.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Processo' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProcessoIntegrationTest.testSaveProcesso() {
        Assert.assertNotNull("Data on demand for 'Processo' failed to initialize correctly", dod.getRandomProcesso());
        Processo obj = dod.getNewTransientProcesso(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Processo' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Processo' identifier to be null", obj.getId());
        processoService.saveProcesso(obj);
        processoDao.flush();
        Assert.assertNotNull("Expected 'Processo' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ProcessoIntegrationTest.testDeleteProcesso() {
        Processo obj = dod.getRandomProcesso();
        Assert.assertNotNull("Data on demand for 'Processo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Processo' failed to provide an identifier", id);
        obj = processoService.findProcesso(id);
        processoService.deleteProcesso(obj);
        processoDao.flush();
        Assert.assertNull("Failed to remove 'Processo' with identifier '" + id + "'", processoService.findProcesso(id));
    }
    
}