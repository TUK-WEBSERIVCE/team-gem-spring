package com.tuk.teamgem.member.service;

import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.member.dto.RegisterRequest;
import com.tuk.teamgem.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;

    public Long register(RegisterRequest request){
        Member member = Member.builder()
            .loginId(request.loginId())
            .password(request.password())
            .nickname(request.nickname())
            .build();

        memberRepository.save(member);
        return member.getId();
    }
}
