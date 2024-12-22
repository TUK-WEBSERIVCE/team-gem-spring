package com.tuk.teamgem.team.repository;

import com.tuk.teamgem.team.domain.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface TeamRepository extends JpaRepository<Team,Long> {
    @Modifying
    @Query("delete Team t where t.hostMember.id = :memberId ")
    void deleteByMember(Long memberId);
}
