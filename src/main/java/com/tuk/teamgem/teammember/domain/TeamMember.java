package com.tuk.teamgem.teammember.domain;

import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.team.domain.Team;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class TeamMember {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn
    private Team team;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn
    private Member member;

    private String field;
    private String introduction;
    @Enumerated(EnumType.STRING)
    private ApplicationStatus applicationStatus;

    @Builder
    public TeamMember(final Team team, final Member member, String field, String introduction,
        final ApplicationStatus applicationStatus) {
        this.team = team;
        this.member = member;
        this.field = field;
        this.introduction = introduction;
        this.applicationStatus = applicationStatus;
    }
}
