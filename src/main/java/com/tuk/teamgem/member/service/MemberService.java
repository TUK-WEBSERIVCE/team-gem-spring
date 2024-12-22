package com.tuk.teamgem.member.service;

import com.tuk.teamgem.comment.repository.CommentRepository;
import com.tuk.teamgem.exception.AdminAuthenticationFailedException;
import com.tuk.teamgem.exception.LoginException;
import com.tuk.teamgem.exception.RegisterException;
import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.member.dto.LoginRequest;
import com.tuk.teamgem.member.dto.LoginResponse;
import com.tuk.teamgem.member.dto.MemberRegisterResponse;
import com.tuk.teamgem.member.dto.RegisterRequest;
import com.tuk.teamgem.member.repository.MemberRepository;
import com.tuk.teamgem.team.repository.TeamRepository;
import com.tuk.teamgem.teammember.repository.TeamMemberRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;
    private final CommentRepository commentRepository;
    private final TeamMemberRepository teamMemberRepository;
    private final TeamRepository teamRepository;

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
            throw new RegisterException("중복된 아이디입니다😜");
        }
    }

    public LoginResponse login(LoginRequest request){
        Member member = memberRepository.findByLoginIdAndPassword(request.loginId(),
                request.password())
            .orElseThrow(() -> new LoginException("아이디와 비밀번호가 일치하지 않습니다😕"));
        return new LoginResponse(member.getId());
    }

    public Member getMember(Long memberId){
        return memberRepository.findById(memberId).orElseThrow(()-> new IllegalArgumentException(
            "회원을 찾을 수 없습니다."));
    }

    public boolean isAdmin(Long memberId){
        Member member = getMember(memberId);
        if(!member.isAdmin()){
            throw new AdminAuthenticationFailedException();
        }
        return true;
    }

    public List<Member> getAllMember(){
        return memberRepository.findAll();
    }

    @Transactional
    public void deleteMember(Long memberId){
        commentRepository.deleteAllMemberId(memberId);
        teamMemberRepository.deleteAllByMemberId(memberId);
        memberRepository.deleteById(memberId);
        teamRepository.deleteByMember(memberId);
    }
}
