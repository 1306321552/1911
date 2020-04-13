package com.xpd;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan(basePackages = "com.xpd.dao")
@EnableTransactionManagement
public class XpdCrmApplication {

	public static void main(String[] args) {
		SpringApplication.run(XpdCrmApplication.class, args);
	}

}
