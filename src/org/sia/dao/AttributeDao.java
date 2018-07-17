package org.sia.dao;

import java.util.List;
import org.sia.model.Attribute;


public interface AttributeDao {
    public void saveAttribute(Attribute attribute);
    public Attribute getAttribute(int id);
    public List<Attribute> getAllAttributes();
    public void deleteAttribute(Attribute attribute);
    public void updateAttribute(Attribute attribute);

}
