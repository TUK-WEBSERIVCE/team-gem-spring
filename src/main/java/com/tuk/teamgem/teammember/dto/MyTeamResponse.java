package com.tuk.teamgem.teammember.dto;

import com.tuk.teamgem.teammember.domain.TeamMember;
import java.util.List;
import lombok.Getter;

@Getter
public class MyTeamResponse{
    List<TeamMember> teamMembers;
    Boolean isHost;

    public MyTeamResponse(final List<TeamMember> teamMembers, final boolean isHost) {
        this.teamMembers = teamMembers;
        this.isHost = isHost;
    }
}

