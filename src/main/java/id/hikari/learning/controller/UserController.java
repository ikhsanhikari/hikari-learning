package id.hikari.learning.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.exeption.ResourceNotFoundException;
import id.hikari.learning.model.User;
import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.SignUpRequest;
import id.hikari.learning.repository.UserRepository;
import id.hikari.learning.security.CurrentUser;
import id.hikari.learning.security.UserPrincipal;
import id.hikari.learning.service.UserService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserRepository userRepository;

    private final UserService userService;

    @GetMapping("/me")
    public User getCurrentUser(@CurrentUser UserPrincipal userPrincipal) {
        return userRepository.findById(userPrincipal.getId())
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", userPrincipal.getId()));
    }

    @GetMapping("")
    public ResponseEntity getAllUser(@PageableDefault Pageable pageable) {
        return ResponseEntity.ok(new ApiResponseData<>(userRepository.findAll(pageable)));
    }

    @GetMapping("/by-instructur")
    public ResponseEntity getAllUserByInstructurId(@CurrentUser UserPrincipal principal) {
        return ResponseEntity
                .ok(new ApiResponseData<>(
                        userRepository.findAllByInstructurIdOrderByIdDesc(principal.getId().intValue())));
    }


    @GetMapping("/instructur/{type}")
    public ResponseEntity getInstructur(@PathVariable("type") String type) {
        return userService.getInstructur(type);
    }

    @PostMapping
    public ResponseEntity createUser(@RequestBody SignUpRequest request) {
        return userService.createUser(request);
    }
}
