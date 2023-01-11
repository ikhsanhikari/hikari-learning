package id.hikari.learning.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import id.hikari.learning.model.User;
import id.hikari.learning.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Service
@RequiredArgsConstructor
public class ReportService {

    private final DataSource dataSource;

    private final UserRepository userRepository;

    private Connection getCon() {
        try {
            return dataSource.getConnection();
        } catch (Exception e) {
            System.out.println("Connection error ? " + e);
            e.printStackTrace();
            return null;
            // TODO: handle exception
        }
    }

    // @Qualifier("jdbcTemplate")
    // private final JdbcTemplate jdbcTemplate;

    public JasperPrint generateReport(String name, Map<String, Object> param) throws SQLException {
        // Connection connection = DataSourceUtils.getConnection(dataSource);
        try {
            return JasperFillManager.fillReport(
                    ResourceUtils.getFile("classpath:" + name)
                            .getAbsolutePath(),
                    param, getCon()

            );
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

            return null;
        } catch (JRException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        } finally {
            // getCon().close();
        }
    }

    public String exportReport(HttpServletResponse response)
            throws FileNotFoundException, JRException {
        // String path = "C:\\Users\\basan\\Desktop\\Report";
        List<User> employees = userRepository.findAll();
        // load file and compile it
        File file = ResourceUtils.getFile("classpath:list_user.jrxml");
        JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(employees);
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("createdBy", "Java Techie");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);

        // if (reportFormat.equalsIgnoreCase("html")) {
        // JasperExportManager.exportReportToHtmlFile(jasperPrint, path +
        // "\\employees.html");
        // }
        // if (reportFormat.equalsIgnoreCase("pdf")) {
        // JasperExportManager.exportReportToPdfFile(jasperPrint, path +
        // "\\employees.pdf");
        // }
        try {
            response.setContentType("application/x-download");
            response.setHeader("Content-Disposition", String.format("attachment; filename=\"list_user.pdf\""));
            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "report generated in path : ";
    }
}
