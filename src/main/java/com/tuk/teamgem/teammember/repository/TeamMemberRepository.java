package com.tuk.teamgem.teammember.repository;

import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.teammember.domain.TeamMember;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TeamMemberRepository extends JpaRepository<TeamMember,Long> {
    @Query("select tm from TeamMember tm join fetch tm.team where tm.member =:member")
    List<TeamMember> findAllByMember(Member member);
}
