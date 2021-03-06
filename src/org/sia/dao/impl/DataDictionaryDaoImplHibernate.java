/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sia.dao.impl;

import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.sia.dao.AttributeDao;
import org.sia.dao.DataDictionaryDao;
import org.sia.model.Attribute;
import org.sia.model.DataDictonary;
import org.sia.util.HibernateUtil;

/**
 *
 * @author Polma E. Tambunan
 */
public class DataDictionaryDaoImplHibernate implements DataDictionaryDao{

    @Override
    public DataDictonary saveDataDictonary(DataDictonary dataDictonary) {
        Session session = HibernateUtil.getSession();
        session.getTransaction().begin();
        session.save(dataDictonary);
        session.getTransaction().commit();
        HibernateUtil.closeSession();   
        return dataDictonary;
    }

    @Override
    public DataDictonary getAttribute(int id) {
        Session session = HibernateUtil.getSession();
        session.getTransaction().begin();
        DataDictonary dataDictonary = (DataDictonary)session.get(DataDictonary.class,id);
        session.getTransaction().commit();
        HibernateUtil.closeSession();
        return dataDictonary;
    }

    @Override
    public List<DataDictonary> getAllDataDictonaries() {
        Session session = HibernateUtil.getSession();
        session.getTransaction().begin();
        List<DataDictonary> DataDictonaries = 
                session.createCriteria(DataDictonary.class).list();
        session.getTransaction().commit();
        return DataDictonaries;    
    }

    @Override
    public void deleteDataDictonary(DataDictonary dataDictonary) {
                Session session = HibernateUtil.getSession();
                session.getTransaction().begin();
                session.delete(dataDictonary);
                session.getTransaction().commit();
                HibernateUtil.closeSession();
    }

    @Override
    public DataDictonary updateDataDictonary(DataDictonary dataDictonary) {
       DataDictonary dDictionary = null;
        for(DataDictonary dd : getAllDataDictonaries())
        {
            if(dataDictonary.getDataDictionaryCode().equalsIgnoreCase(dd.getDataDictionaryCode()))
            {
                Session session = HibernateUtil.getSession();
                session.getTransaction().begin();
                dataDictonary.setId(dd.getId());
                dd = dataDictonary;
                session.update(dd);
                dDictionary = dd;
                session.getTransaction().commit();
                HibernateUtil.closeSession();
                break;
            }
        }
       return dDictionary;
    }

    @Override
    public DataDictonary getLastDataDictionary() {
        Session session = HibernateUtil.getSession();
        session.getTransaction().begin();
        DataDictonary dataDictonary = null;
        session.getTransaction().commit();
        HibernateUtil.closeSession();
        return dataDictonary;
    }
    
}
