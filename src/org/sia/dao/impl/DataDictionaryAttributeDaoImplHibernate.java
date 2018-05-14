/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sia.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.sia.dao.DataDictionaryAttributeDao;
import org.sia.model.Attribute;
import org.sia.model.DataDictionaryAttribute;
import org.sia.model.DataDictonary;
import org.sia.util.HibernateUtil;

/**
 *
 * @author Polma E. Tambunan
 */
public class DataDictionaryAttributeDaoImplHibernate implements DataDictionaryAttributeDao{

    @Override
    public void saveDataDictionaryAttribute(DataDictionaryAttribute dataDictionaryAttribute) {
        Session session = HibernateUtil.getSession();
        session.getTransaction().begin();
        session.save(dataDictionaryAttribute);
        session.getTransaction().commit();
        HibernateUtil.closeSession();    
    }

    @Override
    public DataDictionaryAttribute getDataDictionaryAttribute(int id) {
        Session session = HibernateUtil.getSession();
        session.getTransaction().begin();
        DataDictionaryAttribute dataDictionaryAttribute = (DataDictionaryAttribute)session.get(DataDictionaryAttribute.class,id);
        session.getTransaction().commit();
        HibernateUtil.closeSession();
        return dataDictionaryAttribute;
    }

    @Override
    public List<DataDictionaryAttribute> getAllDataDictionaryAttributes() {
        Session session = HibernateUtil.getSession();
        session.getTransaction().begin();
        List<DataDictionaryAttribute> dataDictionaryAttributes = 
                session.createCriteria(DataDictionaryAttribute.class).list();
        session.getTransaction().commit();
        return dataDictionaryAttributes;    
    }

    @Override
    public void deleteDataDictionaryAttribute(DataDictionaryAttribute dataDictionaryAttribute) {
                Session session = HibernateUtil.getSession();
                session.getTransaction().begin();
                session.delete(dataDictionaryAttribute);
                session.getTransaction().commit();
                HibernateUtil.closeSession();
    }

    @Override
    public void updateDataDictionaryAttribute(DataDictionaryAttribute dataDictionaryAttribute) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
