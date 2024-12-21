package com.tuk.teamgem.teammember.repository;

import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.teammember.domain.ApplicationStatus;
import com.tuk.teamgem.teammember.domain.TeamMember;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface TeamMemberRepository extends JpaRepository<TeamMember,Long> {
    @Query("select tm from TeamMember tm join fetch tm.team where tm.member =:member and tm"
        + ".applicationStatus =:status")
    List<TeamMember> findAllByMember(Member member, ApplicationStatus status);

    @Query("select tm from TeamMember tm join fetch tm.team where tm.member =:member")
    List<TeamMember> findApplicationByMember(Member member);

    @Query("select tm from TeamMember tm join fetch tm.team join fetch tm.member where tm"
        + ".team=:team")
    List<TeamMember> findByTeam(Team team);

    Optional<TeamMember> findByMemberAndTeam(Member member,Team team);

    @Modifying
    @Query("delete from TeamMember tm where tm.team.id = :teamId")
    void deleteAllByTeamId(Long teamId);

    boolean existsByMemberAndTeam(Member member, Team team);
}
