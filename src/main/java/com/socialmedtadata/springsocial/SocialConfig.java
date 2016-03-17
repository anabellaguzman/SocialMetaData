package com.socialmedtadata.springsocial;

import javax.inject.Inject;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;

@Configuration
public class SocialConfig {

    @Bean
    public ConnectionFactoryLocator connectionFactoryLocator() {
        ConnectionFactoryRegistry registry = new ConnectionFactoryRegistry();
        
        registry.addConnectionFactory(new FacebookConnectionFactory(
            environment.getProperty("facebook.clientId"),
            environment.getProperty("facebook.clientSecret")));
        
//        registry.addConnectionFactory(new TwitterConnectionFactory(
//            environment.getProperty("twitter.consumerKey"),
//            environment.getProperty("twitter.consumerSecret")));
//            
        return registry;
    }

    @Inject
    private Environment environment;
	
}