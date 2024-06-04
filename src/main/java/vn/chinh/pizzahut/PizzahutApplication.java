package vn.chinh.pizzahut;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class PizzahutApplication {

	public static void main(String[] args) {
		SpringApplication.run(PizzahutApplication.class, args);
	}

}
