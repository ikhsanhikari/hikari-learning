package id.hikari.learning;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.scheduling.annotation.EnableAsync;

import id.hikari.learning.config.AppProperties;
import id.hikari.learning.utils.FileStorageProperties;

@SpringBootApplication
@EnableConfigurationProperties({ AppProperties.class, FileStorageProperties.class })
@EnableAsync
@EnableFeignClients

public class HikariLearningApplication {

	public static void main(String[] args) {
		SpringApplication.run(HikariLearningApplication.class, args);
	}

}
