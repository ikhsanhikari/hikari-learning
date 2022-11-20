package id.hikari.learning.payload;

import id.hikari.learning.model.ERole;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AuthResponse {
    private String accessToken;
    private String tokenType = "Bearer";
    private String email;
    private ERole role;
    private String name;

    public AuthResponse(String accessToken) {
        this.accessToken = accessToken;
    }
}
