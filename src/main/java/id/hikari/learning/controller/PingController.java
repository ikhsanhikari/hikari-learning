package id.hikari.learning.controller;

import java.io.FileNotFoundException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.sf.jasperreports.engine.JRException;

@RequiredArgsConstructor
@RestController
public class PingController {


    @GetMapping("/ping")
    public String ping() throws FileNotFoundException, JRException {

        return "pong";
    }
}
