package com.tuk.teamgem.team.domain;

import com.tuk.teamgem.member.domain.Member;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import java.time.LocalDateTime;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Team {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private int capacity;
    private String field;
    private LocalDateTime dueDate;
    private String description;
    @OneToOne
    private Member hostMember;

    @Builder
    public Team(final String name, final int capacity, final String field,
        final LocalDateTime dueDate,
        final String description, Member hostMember) {
        this.name = name;
        this.capacity = capacity;
        this.field = field;
        this.dueDate = dueDate;
        this.description = description;

        this.hostMember = hostMember;
    }
}
