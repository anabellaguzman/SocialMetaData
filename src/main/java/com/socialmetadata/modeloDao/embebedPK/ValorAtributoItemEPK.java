package com.socialmetadata.modeloDao.embebedPK;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

import com.socialmetadata.model.AtributoItem;
import com.socialmetadata.model.Item;

@Embeddable
public class ValorAtributoItemEPK implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@ManyToOne
	private Item item;
	
	@ManyToOne
	private AtributoItem atributo;
	
	public  ValorAtributoItemEPK(){}

	public ValorAtributoItemEPK(Item item, AtributoItem atributo) {
		super();
		this.item = item;
		this.atributo = atributo;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public AtributoItem getAtributo() {
		return atributo;
	}

	public void setAtributo(AtributoItem atributo) {
		this.atributo = atributo;
	}
	
	
	
	
	

}
