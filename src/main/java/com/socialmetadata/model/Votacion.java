package com.socialmetadata.model;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.socialmetadata.modeloDao.embebedPK.VotacionEPK;

@Entity
@Table( name ="UsuarioItemPuntaje")
public class Votacion {
	
	@EmbeddedId
	private VotacionEPK votacionPK;
	@Column
	private double puntaje;
	
	public Votacion(){}
	
	public Votacion(VotacionEPK votacionPK, double puntaje) {
		super();
		this.votacionPK = votacionPK;
		this.puntaje = puntaje;
	}

	public VotacionEPK getVotacionPK() {
		return votacionPK;
	}

	public void setVotacionPK(VotacionEPK votacionPK) {
		this.votacionPK = votacionPK;
	}

	public double getPuntaje() {
		return puntaje;
	}

	public void setPuntaje(double puntaje) {
		this.puntaje = puntaje;
	}
	
	
	
}
