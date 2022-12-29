package id.hikari.learning.utils;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import id.hikari.learning.model.User;
import id.hikari.learning.repository.UserRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UtilService {

    private final UserRepository userRepository;

    public Boolean validateInstructurOfStudentOnly(Integer studentId, String createBy) {
        Optional<User> userById = userRepository.findById(Long.valueOf(studentId.longValue()));
        if (userById.isPresent()) {
            User user = userById.get();
            if (user.getInstructurId() != null && user.getInstructurId() == Integer.parseInt(createBy)) {
                return true;
            }
        }
        return false;
    }

    public Boolean validateStudentOfInstructurOnly(Integer instructurId, String createBy) {
        List<User> instructurs = userRepository.findAllByInstructurIdOrderByIdDesc(instructurId);
        List<User> collect = instructurs.stream().filter(item -> item.getId().equals(Long.parseLong(createBy)))
                .collect(Collectors.toList());
        if (!collect.isEmpty())
            return true;
        return false;
    }

    public Boolean checkIsCreatedByAdmin(String createBy) {
        Optional<User> userById = userRepository.findById(Long.valueOf(createBy));
        if (userById.isPresent()) {
            User user = userById.get();
            if (user.getRole().equals(StaticValue.ROLE_ADMIN)) {
                return true;
            }
        }
        return false;
    }

    public Boolean onlyOwnInstructur(Long id, String createdBy) {
        if (id.equals(Long.parseLong(createdBy)))
            return true;
        return false;
    }
}
