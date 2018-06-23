/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sia.model;

/**
 *
 * @author Polma E. Tambunan
 */
import java.util.Date;
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
@Table(name = "attribute")

public class Attribute {

    @Id
    @Column(name = "idAttribute")
    private int id;
    @Column(name = "field")
    private String field;
    @Column(name = "dataType")
    private String dataType;
    @Column(name = "length")
    private String length;
    @Column(name = "description")
    private String description;
    @Column(name = "alias")
    private String alias;    
    @Column(name = "createdAt")
    private Date createdAt;
    @Column(name = "updatedAt")
    private Date updatedAt;
    
    public Attribute() {
    }

    public Attribute(int id, String field, String dataType, String length, String description, String alias, Date createdAt, Date updatedAt) {
        this.id = id;
        this.field = field;
        this.dataType = dataType;
        this.length = length;
        this.description = description;
        this.alias = alias;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
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
