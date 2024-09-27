package com.example.buoi2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@SpringBootApplication
@RestController 
public class Buoi2Application {

	public static void main(String[] args) {
		SpringApplication.run(Buoi2Application.class, args);
	}
	@GetMapping("/hello")
	public String getHello(@RequestParam (defaultValue = "World") String name) {
		return String.format("Hello %s!", name);
	}
	
	@GetMapping("/city")
	public City getCityinfor() {
		return new City(59,"Ho Chi Minh City", "21");
	}
	

}
