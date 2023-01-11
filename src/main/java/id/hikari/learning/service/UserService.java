package id.hikari.learning.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import id.hikari.learning.model.AuthProvider;
import id.hikari.learning.model.User;
import id.hikari.learning.payload.ApiResponse;
import id.hikari.learning.payload.ApiResponseData;
import id.hikari.learning.payload.FilterResponse;
import id.hikari.learning.payload.LovResponse;
import id.hikari.learning.payload.SignUpRequest;
import id.hikari.learning.repository.UserRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public ResponseEntity getInstructur(String type) {
        List<User> instructurs = userRepository.findAllByRoleOrderById("ROLE_INSTRUKTUR");

        if (type.equals("lov")) {
            return ResponseEntity.ok(new ApiResponseData<>(instructurs.stream().map(item -> LovResponse.builder()
                    .value(Integer.valueOf(item.getId().intValue()))
                    .label(item.getEmail())
                    .build()).collect(Collectors.toList())));
        } else {
            return ResponseEntity.ok(new ApiResponseData<>(instructurs.stream().map(item -> FilterResponse.builder()
                    .value(item.getEmail())
                    .text(item.getEmail())
                    .build()).collect(Collectors.toList())));
        }

    }

    public ResponseEntity createUser(SignUpRequest request) {
        userRepository.save(User.builder()
                .id(request.getId())
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .name(request.getName())
                .instructurId(request.getInstructurId())
                .role(request.getRole())
                .provider(AuthProvider.local)
                .emailVerified(false)
                .build());
        return ResponseEntity.ok(new ApiResponse("Success Create User!"));
    }
}
