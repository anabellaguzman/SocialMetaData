package com.socialmetadata.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.RolDAO;
import com.socialmetadata.model.Rol;



@Service
public class RolService {
	
	
	@Autowired
	private RolDAO rolDAO;

	@Transactional
	public Rol getRol(int idRol) {
		return rolDAO.getRol(idRol);
	}

}
