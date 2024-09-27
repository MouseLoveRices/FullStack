package com.example.goidangki;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TestConfig {
    @Bean
    public Meo test1(){
        return new Meo();
    }
}
