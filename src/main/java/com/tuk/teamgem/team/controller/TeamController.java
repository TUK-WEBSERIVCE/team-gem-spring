package com.tuk.teamgem.team.controller;

import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.team.dto.TeamRegisterRequest;
import com.tuk.teamgem.team.service.TeamService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class TeamController {

    private final TeamService teamService;

    @PostMapping("/team")
    public String register(TeamRegisterRequest request,@CookieValue Long memberId){
        teamService.register(request,memberId);
        return "redirect:/";
    }

    @GetMapping
    public String getTeams(Model model){
        List<Team> teams = teamService.getTeams();
        model.addAttribute("teams",teams);
        return "mainPage";
    }
}
