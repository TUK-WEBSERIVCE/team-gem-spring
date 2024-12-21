package com.tuk.teamgem.team.controller;

import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.team.dto.TeamRegisterRequest;
import com.tuk.teamgem.team.service.TeamService;
import jakarta.servlet.http.HttpServletRequest;
import java.net.URI;
import java.util.HashMap;
import java.util.Map;
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
import org.springframework.web.util.UriBuilder;


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
    public String getTeams(@RequestParam(defaultValue = "0") int page, Model model,
        HttpServletRequest request) {
        int itemsPerPage = 6; // 페이지당 데이터 개수
        Pageable pageable = PageRequest.of(page, itemsPerPage);
        Page<Team> teamPage = teamService.getTeams(pageable);
        model.addAttribute("teams", teamPage.getContent());
        model.addAttribute("currentPage", page + 1); // 현재 페이지 (1부터 시작)
        model.addAttribute("totalPages", teamPage.getTotalPages());
        return "mainPage";
    }


    @GetMapping("/team/{teamId}")
    public String getTeam(@PathVariable Long teamId, Model model,HttpServletRequest request){
        String referer = request.getHeader("Referer");
        String query = URI.create(referer).getQuery();
        Map<String, String> queryParams = parseQueryParams(query);
        String page = queryParams.get("page");
        int pageValue = page == null ? 0 : Integer.parseInt(page);
        request.setAttribute("page",pageValue);
        Team team = teamService.getTeam(teamId);
        teamService.checkOutDated(team);
        model.addAttribute("team",team);
        return "detailTeamPage";
    }

    private Map<String, String> parseQueryParams(String query) {
        Map<String, String> queryParams = new HashMap<>();
        if (query != null) {
            String[] pairs = query.split("&");
            for (String pair : pairs) {
                String[] keyValue = pair.split("=");
                if (keyValue.length == 2) {
                    queryParams.put(keyValue[0], keyValue[1]);
                }
            }
        }
        return queryParams;
    }

    @DeleteMapping("/team/{teamId}")
    public String deleteTeam(@PathVariable Long teamId){
        teamService.deleteTeam(teamId);
        return "redirect:/admin";
    }
}
