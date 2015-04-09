package com.socialmetadata.model;



import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.socialmetadata.modeloDao.embebedPK.ValorAtributoItemEPK;

@Entity
@Table (name="valoratributoitem")
@AssociationOverrides({
	@AssociationOverride(name = "pk.item", 
		joinColumns = @JoinColumn(name = "idItem")),
	@AssociationOverride(name = "pk.atributo", 
		joinColumns = @JoinColumn(name = "idAtributoItem")) })
public class ValorAtributoItem {
	
	@EmbeddedId
	private ValorAtributoItemEPK pk;
	@Column
	private String valor;
	
	
	public ValorAtributoItem() {}
//	@Override
//	public String toString() {
//		// TODO Auto-generated method stub
//		return "HOLA";
////		super.toString();
//	}
	
	public ValorAtributoItem(ValorAtributoItemEPK pk, String valor) {
		super();
		this.pk = pk;
		this.valor = valor;
	}



	public ValorAtributoItemEPK getPk() {
		return pk;
	}
	public void setPk(ValorAtributoItemEPK pk) {
		this.pk = pk;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	
	
	@Transient
	public Item getItem() {
		return getPk().getItem();
	}
	public void setItem(Item item) {
		getPk().setItem(item);
	}
	
	@Transient
	public AtributoItem getAtributoItem(){
		return getPk().getAtributo();
	}
	public void setAtributoItem(AtributoItem atributo){
		getPk().setAtributo(atributo);
	}
	
	
}
