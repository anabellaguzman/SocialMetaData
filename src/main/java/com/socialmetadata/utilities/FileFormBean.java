package com.socialmetadata.utilities;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileFormBean {
	
	CommonsMultipartFile fichero;
	
	CommonsMultipartFile portrait;
	
	public CommonsMultipartFile getPortrait() {
		return portrait;
	}
 
	public void setPortrait(CommonsMultipartFile portrait) {
		this.portrait = portrait;
	}	
	 
	public CommonsMultipartFile getFichero() {
		return fichero;
	}
 
	public void setFichero(CommonsMultipartFile fichero) {
		this.fichero = fichero;
	}	

}
