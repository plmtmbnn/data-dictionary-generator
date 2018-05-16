/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sia.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.sia.dao.AttributeDao;
import org.sia.model.Attribute;
import org.sia.util.HibernateUtil;

/**
 *
 * @author Polma E. Tambunan
 */
public class AttributeDaoImplHibernate implements AttributeDao{

    @Override
    public void saveAttribute(Attribute attribute) {
        Session session = HibernateUtil.getSession();
        session.getTransaction().begin();
        session.save(attribute);
        session.getTransaction().commit();
        HibernateUtil.closeSession();    
    }

    @Override
    public Attribute getAttribute(int id) {
       Session session = HibernateUtil.getSession();
        session.getTransaction().begin();
        Attribute attribute = (Attribute)session.get(Attribute.class,id);
        session.getTransaction().commit();
        HibernateUtil.closeSession();
        return attribute;
    }

    @Override
    public List<Attribute> getAllAttributes() {
        Session session = HibernateUtil.getSession();
        session.getTransaction().begin();
        List<Attribute> attributes = 
                session.createCriteria(Attribute.class).list();
        session.getTransaction().commit();
        return attributes;    
    }

    @Override
    public void deleteAttribute(Attribute attribute) {
                Session session = HibernateUtil.getSession();
                session.getTransaction().begin();
                session.delete(attribute);
                session.getTransaction().commit();
                HibernateUtil.closeSession();
    }

    @Override
    public void updateAttribute(Attribute attribute) {
        for(Attribute att : getAllAttributes())
        {
            if(attribute.getId() == att.getId())
            {
                Session session = HibernateUtil.getSession();
                session.getTransaction().begin();
                attribute.setId(att.getId());
                att = attribute;
                session.update(att);
                session.getTransaction().commit();
                HibernateUtil.closeSession();
                break;
            }
        }
    }
    
}
