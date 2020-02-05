package com.auction.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {


    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dm = new DriverManagerDataSource();
        dm.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dm.setUrl("jdbc:mysql://localhost:3306/auction_db?serverTimeZone=UTC");
        dm.setUsername("root");
        dm.setPassword("root");
        return dm;
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/").permitAll();
    }
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

    }
}
