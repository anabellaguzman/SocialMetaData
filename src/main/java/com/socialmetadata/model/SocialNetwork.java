package com.socialmetadata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SocialNetwork {
	
	@Id
	@Column	
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer idSocialNetwork;

	@Column
	private String name;

	public Integer getIdSocialNetwork() {
		return idSocialNetwork;
	}

	public void setIdSocialNetwork(Integer idSocialNetwork) {
		this.idSocialNetwork = idSocialNetwork;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
