package org.sia.dao;

/**
 *
 * @author Polma E. Tambunan
 */
import java.util.List;
import org.sia.model.DataDictionaryAttribute;

public interface DataDictionaryAttributeDao {
    public void saveDataDictionaryAttribute(DataDictionaryAttribute dataDictionaryAttribute);
    public DataDictionaryAttribute getDataDictionaryAttribute(int id);
    public List<DataDictionaryAttribute> getAllDataDictionaryAttributes();
    public void deleteDataDictionaryAttribute(DataDictionaryAttribute dataDictionaryAttribute);
    public void updateDataDictionaryAttribute(DataDictionaryAttribute dataDictionaryAttribute);
}
