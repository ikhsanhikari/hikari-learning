package id.hikari.learning.feign;

import java.util.Map;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(value = "codeCompiler", url = "http://localhost:3333")
public interface CLientApi {

    @PostMapping("/")
    Map<String,String> compile(@RequestBody CodexRequest codexRequest);

}
