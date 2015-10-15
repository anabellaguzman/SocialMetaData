package com.socialmetadata.dao;


import com.socialmetadata.model.Usuario;

public interface LoginDAO {
	Usuario findByUserName(String username);

}
