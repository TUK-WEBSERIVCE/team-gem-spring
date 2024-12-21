package com.tuk.teamgem.admin.controller;

import com.tuk.teamgem.admin.dto.AdminManageResponse;
import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.member.service.MemberService;
import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.team.service.TeamService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final MemberService memberService;
    private final TeamService teamService;

    @GetMapping
    public String admin(@SessionAttribute(name = "memberId")Long memberId, Model model){
        memberService.isAdmin(memberId);
        List<Member> members = memberService.getAllMember();
        List<Team> teams = teamService.getAllTeam();
        AdminManageResponse adminManageResponse = new AdminManageResponse(members, teams);
        model.addAttribute("res",adminManageResponse);
        return "adminPage";
    }
}
