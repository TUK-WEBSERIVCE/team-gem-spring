package com.tuk.teamgem.admin.dto;

import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.team.domain.Team;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AdminManageResponse {
    List<Member> members;
    List<Team> teams;

}
