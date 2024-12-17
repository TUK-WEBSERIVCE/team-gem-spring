package com.tuk.teamgem.teammember.repository;

import com.tuk.teamgem.teammember.domain.TeamMember;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeamMemberRepository extends JpaRepository<TeamMember,Long> {

}
