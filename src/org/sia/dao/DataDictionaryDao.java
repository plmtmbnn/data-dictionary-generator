/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sia.dao;

import java.util.List;
import org.sia.model.DataDictonary;

/**
 *
 * @author Polma E. Tambunan
 */
public interface DataDictionaryDao {
    public void saveDataDictonary(DataDictonary dataDictonary);
    public DataDictonary getAttribute(int id);
    public List<DataDictonary> getAllDataDictonaries();
    public void deleteDataDictonary(DataDictonary dataDictonary);
    public void updateDataDictonary(DataDictonary dataDictonary);
    public DataDictonary getLastDataDictionary();
}
