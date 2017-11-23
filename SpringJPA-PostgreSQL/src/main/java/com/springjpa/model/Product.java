package com.springjpa.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product implements Serializable {
	


	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8269408873691752550L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="pid")
	private Integer pid;
	
	@Column(name="pname")
	private String pname;
	
	@Column(name = "catalog")
	private String catalog;
 
	@Column(name = "price")
	private double price;

	@Column(name = "photo")
	private String photo;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "detail")
	private String detail;

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getCatalog() {
		return catalog;
	}

	public void setCatalog(String catalog) {
		this.catalog = catalog;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}


	
	
	
 
	
}