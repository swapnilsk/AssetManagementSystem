package com.wip.asset;

import com.wip.asset.model.User;
import com.wip.asset.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WebApplication implements CommandLineRunner {
	
	@Autowired
	private UserService userService;
	 
    public static void main(String[] args) throws Exception {
        SpringApplication.run(WebApplication.class, args);
    }
    
    @Override
	public void run(String... args) throws Exception {
    	User user = new User();user.setUsername("a");user.setPassword("a");
    	userService.save(user);
	}
}
