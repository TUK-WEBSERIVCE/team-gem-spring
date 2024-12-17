package com.tuk.teamgem.team.domain;

import com.tuk.teamgem.member.domain.Member;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import java.time.LocalDateTime;
import java.util.Objects;
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
    @ManyToOne
    private Member hostMember;
    private int numberOfParticipant;

    @Builder
    public Team(final String name, final int capacity, final String field,
        final LocalDateTime dueDate,
        final String description, Member hostMember, int numberOfParticipant) {
        this.name = name;
        this.capacity = capacity;
        this.field = field;
        this.dueDate = dueDate;
        this.description = description;
        this.hostMember = hostMember;
        this.numberOfParticipant = 1;
    }

    public void participateOne(){
        this.numberOfParticipant++;
    }

    public boolean isHost(Long memberId){
        return Objects.equals(hostMember.getId(), memberId);
    }
}
