package org.sia.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import java.util.ArrayList;

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
    @Column(name = "kodeDataDictionary")    
    private String kodeDataDictionary;
    @Column(name = "dokumentName")    
    private String dokumentName;
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

    public DataDictonary() {
    }

    
    public DataDictonary(int id, String kodeDataDictionary, String dokumentName, String processCode, String processName, String activity, String actor, String relation, String description) {
        this.id = id;
        this.kodeDataDictionary = kodeDataDictionary;
        this.dokumentName = dokumentName;
        this.processCode = processCode;
        this.processName = processName;
        this.activity = activity;
        this.actor = actor;
        this.relation = relation;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKodeDataDictionary() {
        return kodeDataDictionary;
    }

    public void setKodeDataDictionary(String kodeDataDictionary) {
        this.kodeDataDictionary = kodeDataDictionary;
    }

    public String getDokumentName() {
        return dokumentName;
    }

    public void setDokumentName(String dokumentName) {
        this.dokumentName = dokumentName;
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

    
    
}
