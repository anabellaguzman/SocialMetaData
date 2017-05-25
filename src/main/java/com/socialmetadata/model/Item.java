package com.socialmetadata.model;



import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Where;



@Entity
public class Item {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idItem;
	@Column
	private String titulo;
	@Column(name = "año")
	private Integer year;
	@Column 
	private Double puntaje;
	@Column
	private Integer cantidadVotos;
	@Column
	private String imagen; //Es el path de la imagen.
	@Column
	private String descripcion;
	@Column 
	private boolean enabled;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Idioma")
	private Idioma idioma;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tipo")
	private TipoItem tipo; 
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "creator")
	private Usuario creator;
	
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY )
    @JoinTable(
            name = "ItemTema",
            joinColumns = @JoinColumn(name = "idItem"),
            inverseJoinColumns = @JoinColumn(name = "idTema")
    )	
	private Set<Tema> setTemas;
    
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
            name = "ItemAutor",
            joinColumns = @JoinColumn(name = "idItem"),
            inverseJoinColumns = @JoinColumn(name = "idAutor")
    )	
	private Set<Autor> autores;
    
    
    @OneToMany
//    (fetch=FetchType.EAGER)
    @JoinColumn(name="idItem", insertable=false, updatable=false)
    private Set<Posteo> posteos;

    @OneToMany
    @JoinColumn(name="idItem", insertable=false, updatable=false)
    @Where(clause="tipo='1'")
    private Set<Comentario> comentarios;

    @OneToMany
    @JoinColumn(name="idItem", insertable=false, updatable=false)
    @Where(clause="tipo='2'")
    private Set<Error> errores;
    
    @OneToMany
    @JoinColumn(name="idItem", insertable=false, updatable=false)
    @Where(clause="tipo='3'")
    private Set<Archivo> archivos;

    
//   ---------------------------------------- 
//    @OneToMany(mappedBy="item", fetch = FetchType.LAZY)
//    private Set<Posteo> posteos;
//    
//   
////    private Set<Comentario> comentarios;
////    private Set<Error> errores;
    
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.item", cascade=CascadeType.ALL)
    private Set<ValorAtributoItem> valorAtributoPropio;
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "votacionPK.item", cascade=CascadeType.ALL)
    private Set<Votacion> listadoVotos;
//    
    
    
	public int getIdItem() {
		return idItem;
	}
	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public double getPuntaje() {
		return puntaje;
	}
	public void setPuntaje(double puntaje) {
		this.puntaje = puntaje;
	}
	public Integer getCantidadVotos() {
		return cantidadVotos;
	}
	public void setCantidadVotos(Integer cantidadVotos) {
		this.cantidadVotos = cantidadVotos;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Idioma getIdioma() {
		return idioma;
	}
	public void setIdioma(Idioma idioma) {
		this.idioma = idioma;
	}
	public TipoItem getTipo() {
		return tipo;
	}
	public void setTipo(TipoItem tipo) {
		this.tipo = tipo;
	}
	public Set<Tema> getSetTemas() {
		return setTemas;
	}
	public void setSetTemas(Set<Tema> setTemas) {
		this.setTemas = setTemas;
	}
	public Set<Autor> getAutores() {
		return autores;
	}
	public void setAutores(Set<Autor> autores) {
		this.autores = autores;
	}
	public Set<Posteo> getPosteos() {
		return posteos;
	}
	public void setPosteos(Set<Posteo> posteos) {
		this.posteos = posteos;
	}
	public Set<ValorAtributoItem> getValorAtributoPropio() {
		return valorAtributoPropio;
	}
	public void setValorAtributoPropio(Set<ValorAtributoItem> valorAtributoPropio) {
		this.valorAtributoPropio = valorAtributoPropio;
		
		
		
	}
	public Set<Votacion> getListadoVotos() {
		
		return listadoVotos;
	}
	public void setListadoVotos(Set<Votacion> listadoVotos) {
		this.listadoVotos = listadoVotos;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public Usuario getCreator() {
		return creator;
	}
	public void setCreator(Usuario creator) {
		this.creator = creator;
	}
	public void setPuntaje(Double puntaje) {
		this.puntaje = puntaje;
	}
//	public Set<Posteo> getComentarios() {
//		return comentarios;
//	}
//	public void setComentarios(Set<Posteo> comentarios) {
//		this.comentarios = comentarios;
//	}
//	public Set<Posteo> getErrores() {
//		return errores;
//	}
//	public void setErrores(Set<Posteo> errores) {
//		this.errores = errores;
//	}
//	---------------------------
	public Set<Comentario> getComentarios() {
		return comentarios;
	}
	public void setComentarios(Set<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	public Set<Error> getErrores() {
		return errores;
	}
	public void setErrores(Set<Error> errores) {
		this.errores = errores;
	}
	public Set<Archivo> getArchivos() {
		return archivos;
	}
	public void setArchivos(Set<Archivo> archivos) {
		this.archivos = archivos;
	}
	
	
	
	
	
	
}