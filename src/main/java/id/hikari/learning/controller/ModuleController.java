package id.hikari.learning.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.model.Module;
import id.hikari.learning.payload.ApiResponse;
import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.repository.ModuleRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/module")
public class ModuleController {
    private final ModuleRepository moduleRepository;

    @GetMapping
    public ResponseEntity findAllModule() {
        return ResponseEntity.ok(new ApiResponseData<>(moduleRepository.findAllByOrderByIdDesc()));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deleteModule(@PathVariable("id") Long id) {
        Module module = moduleRepository.findById(id).orElse(null);
        moduleRepository.delete(module);
        return ResponseEntity.ok(new ApiResponse());
    }
}
