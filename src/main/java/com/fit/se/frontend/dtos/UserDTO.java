package com.fit.se.frontend.dtos;

import lombok.Data;

@Data
public class UserDTO {
    private String email;
    private String passwordHash;
}
