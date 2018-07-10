package org.sia.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Polma E. Tambunan
 */
@Entity
@Table(name = "datadictonary")

public class DataDictonary {
    @Id
    @Column(name = "idDataDictionary")    
    private int id;
    @Column(name = "dataDictionaryCode")    
    private String dataDictionaryCode;
    @Column(name = "documentName")    
    private String documentName;
    @Column(name = "dataForm")    
    private String dataForm;
    @Column(name = "processCode")    
    private String processCode;
    @Column(name = "processName")    
    private String processName;
    @Column(name = "activity")    
    private String activity;
    @Column(name = "actor")    
    private String actor;
    @Column(name = "relation")    
    private String relation;
    @Column(name = "description")    
    private String description;          
    @Column(name = "createdAt")
    private Date createdAt;
    @Column(name = "updatedAt")
    private Date updatedAt;

    public DataDictonary() {
    }

    public DataDictonary(int id, String dataDictionaryCode, String documentName, String dataForm, String processCode, String processName, String activity, String actor, String relation, String description, Date createdAt, Date updatedAt) {
        this.id = id;
        this.dataDictionaryCode = dataDictionaryCode;
        this.documentName = documentName;
        this.dataForm = dataForm;
        this.processCode = processCode;
        this.processName = processName;
        this.activity = activity;
        this.actor = actor;
        this.relation = relation;
        this.description = description;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDataDictionaryCode() {
        return dataDictionaryCode;
    }

    public void setDataDictionaryCode(String dataDictionaryCode) {
        this.dataDictionaryCode = dataDictionaryCode;
    }

    public String getDocumentName() {
        return documentName;
    }

    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    public String getDataForm() {
        return dataForm;
    }

    public void setDataForm(String dataForm) {
        this.dataForm = dataForm;
    }

    public String getProcessCode() {
        return processCode;
    }

    public void setProcessCode(String processCode) {
        this.processCode = processCode;
    }

    public String getProcessName() {
        return processName;
    }

    public void setProcessName(String processName) {
        this.processName = processName;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    
}
