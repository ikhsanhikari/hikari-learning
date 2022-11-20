package id.hikari.learning.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import id.hikari.learning.exeption.ResourceNotFoundException;
import id.hikari.learning.model.User;
import id.hikari.learning.repository.UserRepository;
import id.hikari.learning.security.CurrentUser;
import id.hikari.learning.security.UserPrincipal;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class UserController {
    private final UserRepository userRepository;

    @GetMapping("/user/me")
    public User getCurrentUser(@CurrentUser UserPrincipal userPrincipal) {
        return userRepository.findById(userPrincipal.getId())
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", userPrincipal.getId()));
    }
}
