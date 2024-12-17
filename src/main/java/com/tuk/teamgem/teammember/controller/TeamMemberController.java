package com.tuk.teamgem.teammember.controller;

import com.tuk.teamgem.teammember.dto.TeamJoinRequest;
import com.tuk.teamgem.teammember.service.TeamMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/team-members")
public class TeamMemberController {

    private final TeamMemberService teamMemberService;

    @PostMapping("/{teamId}")
    public String joinRequest(
        @CookieValue Long memberId,
        @PathVariable Long teamId,
        TeamJoinRequest teamJoinRequest){
        teamMemberService.joinRequest(memberId,teamId,teamJoinRequest);
        return "redirect:/team/{teamId}";
    }

    @GetMapping("/join/{teamId}")
    public String joinForm(Model model,@PathVariable Long teamId){
        model.addAttribute("teamId",teamId);
        return "joinForm";
    }
}
