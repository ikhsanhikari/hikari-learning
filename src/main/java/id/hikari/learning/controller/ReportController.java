package id.hikari.learning.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.model.Pattern;
import id.hikari.learning.model.User;
import id.hikari.learning.payload.StudentQuizResponse;
import id.hikari.learning.repository.PatternRepository;
import id.hikari.learning.repository.ResponseReportStudent;
import id.hikari.learning.repository.UserRepository;
import id.hikari.learning.service.QuizService;
import id.hikari.learning.service.ReportService;
import lombok.RequiredArgsConstructor;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@RequiredArgsConstructor
@RestController
@RequestMapping("/report")
public class ReportController {

    private final ReportService reportService;

    private final PatternRepository patternRepository;

    private final QuizService quizService;

    private final UserRepository userRepository;

    @GetMapping("/users-bck")
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

    @GetMapping("/pattern-bck")
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

    @GetMapping("/student-bck/{instructur}")
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

    @GetMapping("/quiz-bck/{id}")
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
        List<ResponseReportStudent> reportStudent = userRepository.getReportStudent(39);
        reportStudent.forEach((item)->System.out.println(item));
        return "berhasil";
    }

    @GetMapping(value = "/pattern", produces = MediaType.APPLICATION_PDF_VALUE)
    public ResponseEntity<byte[]> downloadPattern() throws JRException, IOException {

        List<Pattern> dataReport = patternRepository.findAllByOrderByIdDesc();
        JRBeanCollectionDataSource beanCollectionDataSource = new JRBeanCollectionDataSource(dataReport, false);

        Map<String, Object> parameters = new HashMap<>();
        parameters.put("title", "All pattern ");

        JasperReport compileReport = JasperCompileManager
                .compileReport(new FileInputStream("src/main/resources/list_pattern_report.jrxml"));

        JasperPrint jasperPrint = JasperFillManager.fillReport(compileReport, parameters, beanCollectionDataSource);

        byte data[] = JasperExportManager.exportReportToPdf(jasperPrint);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=list_pattern.pdf");

        return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF).body(data);
    }

    @GetMapping(value = "/quiz/{id}", produces = MediaType.APPLICATION_PDF_VALUE)
    public ResponseEntity<byte[]> downloadQuiz(@PathVariable("id") Integer id) throws JRException, IOException {

        List<StudentQuizResponse> dataReport = quizService.getStudentQuizByQuiz(id);
        JRBeanCollectionDataSource beanCollectionDataSource = new JRBeanCollectionDataSource(dataReport, false);

        Map<String, Object> parameters = new HashMap<>();
        parameters.put("title", "List Quiz of student ");

        JasperReport compileReport = JasperCompileManager
                .compileReport(new FileInputStream("src/main/resources/list_quiz_report.jrxml"));

        JasperPrint jasperPrint = JasperFillManager.fillReport(compileReport, parameters, beanCollectionDataSource);

        byte data[] = JasperExportManager.exportReportToPdf(jasperPrint);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=list_quiz.pdf");

        return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF).body(data);
    }

    @GetMapping(value = "/users", produces = MediaType.APPLICATION_PDF_VALUE)
    public ResponseEntity<byte[]> downloadUser() throws JRException, IOException {

        List<User> dataReport = userRepository.findAll();
        JRBeanCollectionDataSource beanCollectionDataSource = new JRBeanCollectionDataSource(dataReport, false);

        Map<String, Object> parameters = new HashMap<>();
        parameters.put("title", "All Users ");

        JasperReport compileReport = JasperCompileManager
                .compileReport(new FileInputStream("src/main/resources/list_user_report.jrxml"));

        JasperPrint jasperPrint = JasperFillManager.fillReport(compileReport, parameters, beanCollectionDataSource);

        byte data[] = JasperExportManager.exportReportToPdf(jasperPrint);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=list_users.pdf");

        return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF).body(data);
    }

    @GetMapping(value = "/student/{instructur}", produces = MediaType.APPLICATION_PDF_VALUE)
    public ResponseEntity<byte[]> downloadStudentInstructur(@PathVariable("instructur") Integer instructur) throws JRException, IOException {

        List<ResponseReportStudent> dataReport = userRepository.getReportStudent(instructur);
        JRBeanCollectionDataSource beanCollectionDataSource = new JRBeanCollectionDataSource(dataReport, false);

        Map<String, Object> parameters = new HashMap<>();
        parameters.put("title", "Summary Users ");

        JasperReport compileReport = JasperCompileManager
                .compileReport(new FileInputStream("src/main/resources/summary_user_report.jrxml"));

        JasperPrint jasperPrint = JasperFillManager.fillReport(compileReport, parameters, beanCollectionDataSource);

        byte data[] = JasperExportManager.exportReportToPdf(jasperPrint);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=summary_users.pdf");

        return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF).body(data);
    }
}
