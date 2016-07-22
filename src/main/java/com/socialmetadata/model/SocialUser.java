package com.socialmetadata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name="idUsuario")
public class SocialUser extends Usuario {
	
	
	private SocialNetwork socialNetwork;
	
	@Column 
	private String socialNetworkUserId;

	public SocialUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SocialUser(String username, String nombre, String apellido,
			String email, String password, SocialNetwork socialNetwork, String socialNetworkUserId) {
		super(username, nombre, apellido, email, password);
		this.socialNetwork = socialNetwork;
		this.socialNetworkUserId = socialNetworkUserId;
	}
	
	
	
	

}
