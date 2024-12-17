package com.tuk.teamgem.teammember.service;

import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.member.service.MemberService;
import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.team.repository.TeamRepository;
import com.tuk.teamgem.team.service.TeamService;
import com.tuk.teamgem.teammember.domain.ApplicationStatus;
import com.tuk.teamgem.teammember.domain.TeamMember;
import com.tuk.teamgem.teammember.dto.TeamJoinRequest;
import com.tuk.teamgem.teammember.repository.TeamMemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TeamMemberService {

    private final TeamMemberRepository teamMemberRepository;
    private final TeamService teamService;
    private final MemberService memberService;

    @Transactional
    public void joinRequest(Long memberId, Long teamId, TeamJoinRequest teamJoinRequest){
        Member member = memberService.getMember(memberId);
        Team team = teamService.getTeam(teamId);
        TeamMember teamMember = TeamMember.builder()
            .team(team)
            .member(member)
            .field(teamJoinRequest.field())
            .introduction(teamJoinRequest.introduction())
            .applicationStatus(ApplicationStatus.PENDING)
            .build();
        teamMemberRepository.save(teamMember);
    }
}