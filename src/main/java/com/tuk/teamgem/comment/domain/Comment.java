package com.tuk.teamgem.comment.domain;

import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.team.domain.Team;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import java.time.LocalDateTime;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Member member;
    private String content;
    private LocalDateTime createdAt;
    @ManyToOne
    private Team team;

    public Comment(final String content,
        Member member,
        final Team team) {
        this.member = member;
        this.content = content;
        this.createdAt = LocalDateTime.now();
        this.team = team;
    }
}
