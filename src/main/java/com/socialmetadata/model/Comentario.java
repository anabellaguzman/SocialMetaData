package com.socialmetadata.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue(value="1")
public class Comentario extends Posteo {
	
	

}
