package com.socialmetadata.dao;

import java.util.List;
import java.util.Set;

import org.springframework.util.MultiValueMap;

import com.socialmetadata.model.SocialUser;

public interface SocialUserDAO {
	
	 List<SocialUser> findByUserId(String userId);

	  List<SocialUser> findByUserIdAndProviderId(String userId, String providerId);

	  List<SocialUser> findByUserIdAndProviderUserIds(String userId, MultiValueMap<String, String> providerUserIds);

	  SocialUser get(String userId, String providerId, String providerUserId);

	  List<SocialUser> findPrimaryByUserIdAndProviderId(String userId, String providerId);

	  Integer selectMaxRankByUserIdAndProviderId(String userId, String providerId);

	  List<String> findUserIdsByProviderIdAndProviderUserId(String providerId, String providerUserId);

	  List<String> findUserIdsByProviderIdAndProviderUserIds(String providerId, Set<String> providerUserIds);

}
