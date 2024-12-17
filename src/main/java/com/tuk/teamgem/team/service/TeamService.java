package com.tuk.teamgem.team.service;

import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.member.service.MemberService;
import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.team.dto.TeamRegisterRequest;
import com.tuk.teamgem.team.repository.TeamRepository;
import com.tuk.teamgem.teammember.domain.ApplicationStatus;
import com.tuk.teamgem.teammember.domain.TeamMember;
import com.tuk.teamgem.teammember.repository.TeamMemberRepository;
import com.tuk.teamgem.teammember.service.TeamMemberService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TeamService {

    private final TeamRepository teamRepository;
    private final MemberService memberService;
    private final TeamMemberRepository teamMemberRepository;

    @Transactional
    public void register(TeamRegisterRequest request,Long memberId){
        Member member = memberService.getMember(memberId);
        Team team = Team.builder()
            .capacity(request.capacity())
            .name(request.name())
            .field(request.field())
            .dueDate(request.dueDate())
            .description(request.description())
            .hostMember(member)
            .build();
        TeamMember teamMember = TeamMember.builder()
            .team(team)
            .member(member)
            .applicationStatus(ApplicationStatus.APPROVED)
            .build();
        teamMemberRepository.save(teamMember);
        teamRepository.save(team);
    }

    public List<Team> getTeams(){
        return teamRepository.findAll();
    }

    public Team getTeam(Long teamId){
        return teamRepository.findById(teamId).orElseThrow(()->new RuntimeException("없는 팀"));
    }
}
