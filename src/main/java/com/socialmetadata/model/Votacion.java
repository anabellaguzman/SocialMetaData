package com.socialmetadata.model;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import com.socialmetadata.modeloDao.embebedPK.VotacionEPK;

@Entity
@Table( name ="usuarioitempuntaje")
@AssociationOverrides({
	@AssociationOverride(name = "votacionPK.item", 
		joinColumns = @JoinColumn(name = "idItem")),
	@AssociationOverride(name = "votacionPK.usuario", 
		joinColumns = @JoinColumn(name = "idUsuario")) })
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
