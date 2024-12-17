package com.tuk.teamgem.comment.repository;

import com.tuk.teamgem.comment.domain.Comment;
import com.tuk.teamgem.team.domain.Team;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository extends JpaRepository<Comment,Long> {
    @Query("select c from Comment c join fetch c.member where c.team =:team order by c.createdAt "
        + "desc")
    List<Comment> findAllByTeam(Team team);
}
