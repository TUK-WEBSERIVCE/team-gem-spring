package com.tuk.teamgem.member.repository;

import com.tuk.teamgem.member.domain.Member;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberRepository extends JpaRepository<Member,Long> {
    Optional<Member> findByLoginIdAndPassword(String loginId,String password);
}
