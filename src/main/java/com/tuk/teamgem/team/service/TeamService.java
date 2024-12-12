package com.tuk.teamgem.team.service;

import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.member.service.MemberService;
import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.team.dto.TeamRegisterRequest;
import com.tuk.teamgem.team.repository.TeamRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TeamService {

    private final TeamRepository teamRepository;
    private final MemberService memberService;

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
        teamRepository.save(team);
    }

    public List<Team> getTeams(){
        return teamRepository.findAll();
    }
}
