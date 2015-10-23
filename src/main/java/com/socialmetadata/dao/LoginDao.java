package com.socialmetadata.dao;

import com.socialmetadata.model.Users;


public interface LoginDao {
	Users findByUserName(String username);

}
