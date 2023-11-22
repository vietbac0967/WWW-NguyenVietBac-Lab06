package com.fit.se;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.fit.se.backend.models.Post;
import com.fit.se.backend.models.PostComment;
import com.fit.se.backend.models.User;
import com.fit.se.backend.repositories.PostCommentRepository;
import com.fit.se.backend.repositories.PostRepository;
import net.datafaker.Faker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@SpringBootApplication
public class Lab06Application {

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private PostCommentRepository postCommentRepository;

    public static void main(String[] args) {
        SpringApplication.run(Lab06Application.class, args);
    }


//    @Bean
//    CommandLineRunner commandLineRunner() {
//        return args -> {
//////            String password = "123456";
//////            // Hash the password using BCrypt
//////            String hashedPassword = BCrypt.withDefaults().hashToString(12, password.toCharArray());
//////            System.out.println(hashedPassword + " " + hashedPassword.length());
//////            // Print the hashed password
//////            System.out.println("Hashed Password: " + hashedPassword);
//////
//////            // Verify password with user's password
//////            String passwordUser = "123456";
//////
//////            // Use BCrypt.verifyer().verify method for password verification
//////            if (BCrypt.verifyer().verify(passwordUser.toCharArray(), hashedPassword).verified) {
//////                System.out.println("Password verification successful");
//////            } else {
//////                System.out.println("Password verification failed");
//////            }
//            for (int i = 0; i < 10; i++) {
//            Faker faker = new Faker();
//                Post post = Post.builder()
//                        .createdAt(faker.date().past(365, TimeUnit.DAYS).toInstant())
//                        .metaTitle(faker.lorem().sentence())
//                        .published(faker.bool().bool())
//                        .publishedAt(faker.date().past(365, TimeUnit.DAYS).toInstant())
//                        .summary(faker.lorem().sentence())
//                        .title(faker.lorem().sentence())
//                        .updatedAt(faker.date().past(365, TimeUnit.DAYS).toInstant())
//                        .author(User.builder().id(1L).build())
//                        .content(faker.lorem().paragraph())
//                        .build();
//                postRepository.save(post);
//            }
//            for (long i = 1; i <= 10; i++) {
//                PostComment postComment = PostComment.builder()
//                        .content(faker.lorem().paragraph())
//                        .createdAt(faker.date().past(365, TimeUnit.DAYS).toInstant())
//                        .published(faker.bool().bool())
//                        .title(faker.name().fullName())
//                        .post(Post.builder().id(i).build())
//                        .user(User.builder().id(2L).build())
//                        .build();
//                postCommentRepository.save(postComment);
//            }
//        };
//    }
}
