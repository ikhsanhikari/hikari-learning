package id.hikari.learning.controller;

import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.service.ReportService;
import lombok.RequiredArgsConstructor;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;

@RequiredArgsConstructor
@RestController
@RequestMapping("/report")
public class ReportController {

    private final ReportService reportService;

    @GetMapping("/users")
    public void userReport(HttpServletResponse response) {
        try {
            JasperPrint report = reportService.generateReport("list_user.jasper", null);
            response.setContentType("application/x-download");
            response.setHeader("Content-Disposition", String.format("attachment; filename=\"users.pdf\""));
            JasperExportManager.exportReportToPdfStream(report, response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @GetMapping("/pattern")
    public void patternReport(HttpServletResponse response) {
        try {
            JasperPrint report = reportService.generateReport("list_pattern.jasper", null);
            response.setContentType("application/x-download");
            response.setHeader("Content-Disposition", String.format("attachment; filename=\"patterns.pdf\""));
            JasperExportManager.exportReportToPdfStream(report, response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @GetMapping("/student/{instructur}")
    public void studentReport(HttpServletResponse response, @PathVariable("instructur") Integer instructur) {
        try {
            Map<String, Object> param = new HashMap<>();
            param.put("instructur", instructur);
            JasperPrint report = reportService.generateReport("summary_of_student.jasper", param);
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", String.format("attachment; filename=\"summary.pdf\""));
            JasperExportManager.exportReportToPdfStream(report, response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @GetMapping("/quiz/{id}")
    public void quizReport(HttpServletResponse response, @PathVariable("id") Integer id) {
        try {
            Map<String, Object> param = new HashMap<>();
            param.put("id", id);
            JasperPrint report = reportService.generateReport("list_quiz.jasper", param);
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", String.format("attachment; filename=\"list_quiz.pdf\""));
            JasperExportManager.exportReportToPdfStream(report, response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @GetMapping("/belajar")
    public String getBelajar(HttpServletResponse response) throws FileNotFoundException, JRException {
        reportService.exportReport(response);
        return "berhasil";
    }

}
