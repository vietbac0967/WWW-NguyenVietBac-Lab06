package com.fit.se.frontend.controllers;

import com.fit.se.backend.models.Post;
import com.fit.se.backend.models.PostComment;
import com.fit.se.backend.models.User;
import com.fit.se.backend.repositories.PostCommentRepository;
import com.fit.se.backend.repositories.PostRepository;
import com.fit.se.backend.services.PostService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
@RequiredArgsConstructor
public class PostController {
    private final PostService postService;

    private final PostRepository postRepository;

    private final PostCommentRepository postCommentRepository;

    @GetMapping("/post")
    public String showPostListPaging(Model model, @RequestParam("page") Optional<Integer> page, @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(2);
        Page<Post> postPage = postService.findPaginated(PageRequest.of(currentPage - 1, pageSize));

        model.addAttribute("postPage", postPage);
        model.addAttribute("currentPage", postPage.getNumber() + 1);
        model.addAttribute("pageSize", size);
        int totalPages = postPage.getTotalPages();
        if (totalPages > 0) {
            List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages).boxed().collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }
        return "post/post-page";
    }

    @GetMapping("/blogs")
    public String showBlogs(Model model, @RequestParam("page") Optional<Integer> page, @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(5);
        Page<Post> blogPage = postService.findPaginated(PageRequest.of(currentPage - 1, pageSize));
        model.addAttribute("blogPage", blogPage);
        model.addAttribute("currentPage", blogPage.getNumber() + 1);
        model.addAttribute("pageSize", size);
        int totalPages = blogPage.getTotalPages();
        if (totalPages > 0) {
            List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages).boxed().collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }
        return "post/blog-page";
    }

    @GetMapping("/show-blog-detail/{id}")
    public String showBlogDetail(@PathVariable("id") long id, Model model, HttpSession session) {
        Post post = postRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        PostComment postComment = new PostComment();
        List<PostComment> postComments = postCommentRepository.getPostCommentsByPostId(id);
        model.addAttribute("postComments", postComments);
        session.setAttribute("postId", id);
        model.addAttribute("blog", post);
        return "post/blog-detail";
    }

    @GetMapping("/insert-form")
    public String showInsertBlogForm(Model model) {
        Post post = new Post();
        model.addAttribute("post", post);
        return "post/insert-blog";
    }

    @PostMapping("/insert")
    public String addPost(@ModelAttribute("post") Post post, String authorId) {
        post.setCreatedAt(Instant.now());
        long authorID = Long.parseLong(authorId);
        post.setAuthor(User.builder().id(authorID).build());
        postRepository.save(post);
        return "redirect:/blogs";
    }

    @GetMapping("/edit-form/{id}")
    public String showUpdateForm(@PathVariable("id") long id, Model model) {
        Post post = postRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        model.addAttribute("post", post);
        return "post/edit-post-page";
    }

    @PostMapping("/updatePost/{id}")
    public String updatePost(@PathVariable("id") long id, @Validated Post post,
                             BindingResult result) {
        if (result.hasErrors()) {
            post.setId(id);
            return "redirect:/edit-form";
        }
        postRepository.save(post);
        return "redirect:/blogs";
    }
}
