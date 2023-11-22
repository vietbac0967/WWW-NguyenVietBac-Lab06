package com.fit.se.frontend.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import at.favre.lib.crypto.bcrypt.BCrypt.Result;
import com.fit.se.backend.models.User;
import com.fit.se.backend.repositories.UserRepository;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class UserController {


    private final Logger logger = LoggerFactory.getLogger(UserController.class);
    private final UserRepository userRepository;

    @GetMapping("/login-form")
    public String getLoginForm() {
        return "user/login-page";
    }

    @GetMapping("/register-form")
    public String getRegisterForm(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "user/register-page";
    }

    @PostMapping("/register")
    public String addUser(@ModelAttribute("user") User user) {
        byte[] hashedBytes = BCrypt.withDefaults().hash(12, user.getPasswordHash().toCharArray());
        // Take a subset of the byte array, e.g., the first 32 bytes
        // Convert the byte array to a string
        user.setPasswordHash(new String(hashedBytes));
        user.setIntro("Hello world");
        user.setLastLogin(Instant.now());
        long daysBetween = ChronoUnit.DAYS.between(user.getLastLogin(), Instant.now());
        Instant registeredAt = Instant.now().minus(Duration.ofDays(daysBetween));
        user.setRegisteredAt(registeredAt);
        user.setProfile("Blog of " + user.getFirstName() + " " + user.getMiddleName() + " " + user.getLastName());
        userRepository.save(user);
        return "redirect:/login-form";
    }

    @PostMapping("/login")
    public String getAccount(@RequestParam String email, @RequestParam String password, HttpSession session) {
        Optional<User> userOptional = userRepository.getUserByEmail(email);

        if (userOptional.isPresent()) {
            User user = userOptional.get();
            String storedHash = user.getPasswordHash();
            System.out.println("Stored Hash: " + storedHash);
            try {
                if (BCrypt.verifyer().verify(password.toCharArray(), storedHash).verified) {
                    session.setAttribute("name",user.getLastName());
                    session.setAttribute("loginUser",user);
                    System.out.println("Login success");
                    return "redirect:/post";
                }
            } catch (Exception e) {
                logger.error(e.getMessage());
            }
        }
        System.out.println("Login failed");
        return "redirect:/login-form";
    }
}
