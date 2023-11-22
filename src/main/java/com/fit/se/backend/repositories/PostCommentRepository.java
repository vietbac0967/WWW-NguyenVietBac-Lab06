package com.fit.se.backend.repositories;

import com.fit.se.backend.models.PostComment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostCommentRepository extends JpaRepository<PostComment,Long> {

    List<PostComment> getPostCommentsByPostId(long id);
}
