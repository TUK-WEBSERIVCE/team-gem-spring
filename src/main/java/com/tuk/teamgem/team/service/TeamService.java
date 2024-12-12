package com.tuk.teamgem.team.service;

import com.tuk.teamgem.team.dto.TeamRegisterRequest;
import com.tuk.teamgem.team.repository.TeamRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TeamService {

    private final TeamRepository teamRepository;

    public void register(TeamRegisterRequest request){
    }
}
