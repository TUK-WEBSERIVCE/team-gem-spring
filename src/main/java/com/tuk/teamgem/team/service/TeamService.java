package com.tuk.teamgem.team.service;

import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.team.dto.TeamRegisterRequest;
import com.tuk.teamgem.team.repository.TeamRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TeamService {

    private final TeamRepository teamRepository;

    public void register(TeamRegisterRequest request){
        Team team = Team.builder()
            .capacity(request.capacity())
            .name(request.name())
            .field(request.field())
            .dueDate(request.dueDate())
            .description(request.description())
            .build();
        teamRepository.save(team);
    }
}
