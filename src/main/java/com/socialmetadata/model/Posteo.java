package com.socialmetadata.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;


@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="tipo", discriminatorType=DiscriminatorType.INTEGER)
public abstract class Posteo {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO) //for autonumber
	private int idPosteo;
	@Column
	private String titulo;
	@Lob
	@Column(columnDefinition = "TEXT")
	private String comentario;
	@Column
	private String fecha;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idItem")
	private Item item;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idUsuario")
	private Usuario usuario;
	
	public Posteo(){}
	
	public Posteo(String titulo, String fecha, Item item, Usuario usuario) {
//		super();
		this.titulo = titulo;
		this.fecha = fecha;
		this.item = item;
		this.usuario = usuario;
	}

	public int getIdPosteo() {
		return idPosteo;
	}

	public void setIdPosteo(int idPosteo) {
		this.idPosteo = idPosteo;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
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
	
	
	
	

}