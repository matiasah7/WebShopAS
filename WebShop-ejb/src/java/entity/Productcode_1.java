/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Matias
 */
@Entity
@Table(name = "PRODUCTCODE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Productcode_1.findAll", query = "SELECT p FROM Productcode_1 p"),
    @NamedQuery(name = "Productcode_1.findByProdCode", query = "SELECT p FROM Productcode_1 p WHERE p.prodCode = :prodCode"),
    @NamedQuery(name = "Productcode_1.findByDiscountCode", query = "SELECT p FROM Productcode_1 p WHERE p.discountCode = :discountCode"),
    @NamedQuery(name = "Productcode_1.findByDescription", query = "SELECT p FROM Productcode_1 p WHERE p.description = :description")})
public class Productcode_1 implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "PROD_CODE")
    private String prodCode;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DISCOUNT_CODE")
    private Character discountCode;
    @Size(max = 10)
    @Column(name = "DESCRIPTION")
    private String description;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productCode")
    private Collection<Book> bookCollection;

    public Productcode_1() {
    }

    public Productcode_1(String prodCode) {
        this.prodCode = prodCode;
    }

    public Productcode_1(String prodCode, Character discountCode) {
        this.prodCode = prodCode;
        this.discountCode = discountCode;
    }

    public String getProdCode() {
        return prodCode;
    }

    public void setProdCode(String prodCode) {
        this.prodCode = prodCode;
    }

    public Character getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(Character discountCode) {
        this.discountCode = discountCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public Collection<Book> getBookCollection() {
        return bookCollection;
    }

    public void setBookCollection(Collection<Book> bookCollection) {
        this.bookCollection = bookCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (prodCode != null ? prodCode.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Productcode_1)) {
            return false;
        }
        Productcode_1 other = (Productcode_1) object;
        if ((this.prodCode == null && other.prodCode != null) || (this.prodCode != null && !this.prodCode.equals(other.prodCode))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Productcode_1[ prodCode=" + prodCode + " ]";
    }
    
}
