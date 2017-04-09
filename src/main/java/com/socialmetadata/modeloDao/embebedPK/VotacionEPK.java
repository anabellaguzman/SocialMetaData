package com.socialmetadata.modeloDao.embebedPK;

import java.io.Serializable;


import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

import com.socialmetadata.model.Item;
import com.socialmetadata.model.Usuario;

@Embeddable
public class VotacionEPK implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@ManyToOne
	private Item item;
	@ManyToOne
	private Usuario usuario;
	
	

	public VotacionEPK() {
	
	}

	public VotacionEPK(Item item, Usuario usuario) {
		super();
		this.item = item;
		this.usuario = usuario;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	
	
	
	
//	public VotacionEPK(int idUsuario, int idItem) {
//		super();
//		this.idUsuario = idUsuario;
//		this.idItem = idItem;
//	}
//
//	public int getIdUsuario() {
//		return idUsuario;
//	}
//
//	public void setIdUsuario(int idUsuario) {
//		this.idUsuario = idUsuario;
//	}
//
//	public int getIdItem() {
//		return idItem;
//	}
//
//	public void setIdItem(int idItem) {
//		this.idItem = idItem;
//	}
//	
//	

	
}
