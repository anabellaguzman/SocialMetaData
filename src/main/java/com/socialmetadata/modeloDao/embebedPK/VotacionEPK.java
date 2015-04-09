package com.socialmetadata.modeloDao.embebedPK;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class VotacionEPK implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Column
	private int idUsuario;
	@Column
	private int idItem;
	
	public VotacionEPK(int idUsuario, int idItem) {
		super();
		this.idUsuario = idUsuario;
		this.idItem = idItem;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public int getIdItem() {
		return idItem;
	}

	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}
	
	

	
}
