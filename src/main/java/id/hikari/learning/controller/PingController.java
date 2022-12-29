package id.hikari.learning.controller;

import java.io.FileNotFoundException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.service.ReportService;
import lombok.RequiredArgsConstructor;
import net.sf.jasperreports.engine.JRException;

@RequiredArgsConstructor
@RestController
public class PingController {

    private final ReportService reportService;

    @GetMapping("/ping")
    public String ping() throws FileNotFoundException, JRException {
        
        return reportService.findAllUser("pdf");
    }
}
