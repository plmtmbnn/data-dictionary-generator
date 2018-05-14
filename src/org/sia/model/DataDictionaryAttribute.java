/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sia.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Polma E. Tambunan
 */
@Entity
@Table(name = "datadictionary_attribute")
public class DataDictionaryAttribute {

    @Id
    @Column(name = "idDataDictionaryAttribute")
    private int id;
    @Column(name = "dataDictionaryId")
    private int dataDictionaryId;
    @Column(name = "attributeId")
    private int attributeId;

    public DataDictionaryAttribute() {
    }

    public DataDictionaryAttribute(int id, int dataDictionaryId, int attributeId) {
        this.id = id;
        this.dataDictionaryId = dataDictionaryId;
        this.attributeId = attributeId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDataDictionaryId() {
        return dataDictionaryId;
    }

    public void setDataDictionaryId(int dataDictionaryId) {
        this.dataDictionaryId = dataDictionaryId;
    }

    public int getAttributeId() {
        return attributeId;
    }

    public void setAttributeId(int attributeId) {
        this.attributeId = attributeId;
    }
}
