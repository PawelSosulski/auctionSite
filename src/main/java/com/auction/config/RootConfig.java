package com.auction.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan(basePackages = "com.auction.core",
        excludeFilters = {
                @ComponentScan.Filter(
                        type = FilterType.ANNOTATION,
                        value = EnableWebMvc.class
                ),
                @ComponentScan.Filter(
                        type = FilterType.ANNOTATION,
                        value = EnableWebSecurity.class
                )
        })

public class RootConfig {

}
