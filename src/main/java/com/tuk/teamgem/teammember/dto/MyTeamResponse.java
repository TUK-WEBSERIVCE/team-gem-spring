package com.tuk.teamgem.teammember.dto;

import com.tuk.teamgem.comment.domain.Comment;
import com.tuk.teamgem.teammember.domain.TeamMember;
import java.util.List;
import lombok.Getter;

@Getter
public class MyTeamResponse{
    List<TeamMember> teamMembers;
    Boolean isHost;
    List<Comment> comments;

    public MyTeamResponse(final List<TeamMember> teamMembers, final boolean isHost, final List<Comment> comments) {
        this.teamMembers = teamMembers;
        this.isHost = isHost;
        this.comments = comments;
    }
}
