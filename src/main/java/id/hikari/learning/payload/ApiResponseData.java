package id.hikari.learning.payload;

import org.springframework.http.HttpStatus;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ApiResponseData<T> {
    private HttpStatus status;
    private T data;

    public ApiResponseData(T data) {
        this.status = HttpStatus.OK;
        this.data = data;
    }

}
