package id.hikari.learning;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import id.hikari.learning.config.AppProperties;

@SpringBootApplication
@EnableConfigurationProperties(AppProperties.class)
public class HikariLearningApplication {

	public static void main(String[] args) {
		SpringApplication.run(HikariLearningApplication.class, args);
	}

}
