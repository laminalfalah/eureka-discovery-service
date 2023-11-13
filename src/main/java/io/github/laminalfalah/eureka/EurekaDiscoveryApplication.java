package io.github.laminalfalah.eureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@EnableEurekaServer
@EnableDiscoveryClient
@SpringBootApplication
public class EurekaDiscoveryApplication {

  public static void main(String[] args) {
    SpringApplication.run(EurekaDiscoveryApplication.class, args);
  }

}
