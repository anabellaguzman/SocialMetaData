package com.socialmetadata.springsocial;

import java.util.List;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionKey;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.util.MultiValueMap;

public class SocialUserConnectionRepositoryImpl implements ConnectionRepository {

	@Override
	public void addConnection(Connection<?> arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MultiValueMap<String, Connection<?>> findAllConnections() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Connection<?>> findConnections(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <A> List<Connection<A>> findConnections(Class<A> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MultiValueMap<String, Connection<?>> findConnectionsToUsers(
			MultiValueMap<String, String> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <A> Connection<A> findPrimaryConnection(Class<A> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Connection<?> getConnection(ConnectionKey arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <A> Connection<A> getConnection(Class<A> arg0, String arg1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <A> Connection<A> getPrimaryConnection(Class<A> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeConnection(ConnectionKey arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeConnections(String arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateConnection(Connection<?> arg0) {
		// TODO Auto-generated method stub
		
	}

}
