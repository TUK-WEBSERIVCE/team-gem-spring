package com.tuk.teamgem.team.controller;

import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.team.dto.TeamRegisterRequest;
import com.tuk.teamgem.team.service.TeamService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;


@Controller
@RequiredArgsConstructor
public class TeamController {

    private final TeamService teamService;

    @PostMapping("/team")
    public String register(TeamRegisterRequest request,@SessionAttribute(name = "memberId") Long memberId){
        teamService.register(request,memberId);
        return "redirect:/";
    }

    @GetMapping
    public String getTeams(@RequestParam(defaultValue = "0") int page, Model model) {
        int itemsPerPage = 6; // 페이지당 데이터 개수
        Pageable pageable = PageRequest.of(page, itemsPerPage);
        Page<Team> teamPage = teamService.getTeams(pageable);

        model.addAttribute("teams", teamPage.getContent());
        model.addAttribute("currentPage", page + 1); // 현재 페이지 (1부터 시작)
        model.addAttribute("totalPages", teamPage.getTotalPages());
        return "mainPage";
    }


    @GetMapping("/team/{teamId}")
    public String getTeam(@PathVariable Long teamId, Model model){
        Team team = teamService.getTeam(teamId);
        model.addAttribute("team",team);
        return "detailTeamPage";
    }

    @DeleteMapping("/team/{teamId}")
    public String deleteTeam(@PathVariable Long teamId){
        teamService.deleteTeam(teamId);
        return "redirect:/admin";
    }
}
