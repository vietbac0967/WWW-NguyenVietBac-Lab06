package com.fit.se.frontend.controllers;

import com.fit.se.backend.models.Post;
import com.fit.se.backend.models.PostComment;
import com.fit.se.backend.models.User;
import com.fit.se.backend.repositories.PostCommentRepository;
import com.fit.se.backend.repositories.PostRepository;
import com.fit.se.backend.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.Instant;

@Controller
@RequiredArgsConstructor
public class PostCommentController {

    private final UserRepository userRepository;
    private final PostRepository postRepository;
    private final PostCommentRepository postCommentRepository;

    @PostMapping("/insert-comment/{id}")
    public String addPostComment(
            @RequestParam("email") String email,
            @RequestParam("content") String content,
            @PathVariable("id") long id) {
        PostComment postComment = new PostComment();
        postComment.setContent(content);
        postComment.setCreatedAt(Instant.now());
        postComment.setPublishedAt(Instant.now()); // You may omit this line if not needed
        User user = userRepository.getUserByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("Not found email " + email));
        // Retrieve the existing post from the database
        Post post = postRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Post not found with id " + id));
        System.out.println("User is: " + user);
        System.out.println("Post is: " + post);
        postComment.setUser(user);
        postComment.setPost(post);
        postComment.setTitle(user.getFullName());
        // Save the postComment to the database (you need to implement this)
        postCommentRepository.save(postComment);
        return "redirect:/show-blog-detail/{id}";
    }

}
