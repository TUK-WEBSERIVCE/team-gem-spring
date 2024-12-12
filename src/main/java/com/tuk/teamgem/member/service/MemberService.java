package com.tuk.teamgem.member.service;

import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.member.dto.LoginRequest;
import com.tuk.teamgem.member.dto.LoginResponse;
import com.tuk.teamgem.member.dto.MemberRegisterResponse;
import com.tuk.teamgem.member.dto.RegisterRequest;
import com.tuk.teamgem.member.repository.MemberRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;

    public MemberRegisterResponse register(RegisterRequest request){
        duplicationLoginId(request.loginId());
        Member member = Member.builder()
            .loginId(request.loginId())
            .password(request.password())
            .nickname(request.nickname())
            .build();
        memberRepository.save(member);
        return new MemberRegisterResponse(member.getId());
    }

    private void duplicationLoginId(String loginId){
        if(memberRepository.existsByLoginId(loginId)){
            throw new IllegalStateException("중복된 아이디입니다.");
        }
    }

    public LoginResponse login(LoginRequest request){
        Member member = memberRepository.findByLoginIdAndPassword(request.loginId(),
                request.password())
            .orElseThrow(() -> new IllegalStateException("아이디와 비밀번호가 일치하지 않습니다."));
        return new LoginResponse(member.getId());
    }

    public Member getMember(Long memberId){
        return memberRepository.findById(memberId).orElseThrow(()-> new IllegalArgumentException(
            "회원을 찾을 수 없습니다."));
    }
}
