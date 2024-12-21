package com.tuk.teamgem.teammember.controller;

import com.tuk.teamgem.teammember.domain.TeamMember;
import com.tuk.teamgem.teammember.dto.ApproveRequest;
import com.tuk.teamgem.teammember.dto.MyTeamResponse;
import com.tuk.teamgem.teammember.dto.TeamJoinRequest;
import com.tuk.teamgem.teammember.service.TeamMemberService;
import jakarta.servlet.http.HttpServletRequest;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequiredArgsConstructor
@RequestMapping("/team-members")
public class TeamMemberController {

    private final TeamMemberService teamMemberService;

    @PostMapping("/{teamId}")
    public String joinRequest(
        @SessionAttribute(name = "memberId") Long memberId,
        @PathVariable Long teamId,
        TeamJoinRequest teamJoinRequest){
        teamMemberService.joinRequest(memberId,teamId,teamJoinRequest);
        return "redirect:/team/{teamId}";
    }

    @GetMapping("/join/{teamId}")
    public String joinForm(Model model,@PathVariable Long teamId,@SessionAttribute(name =
        "memberId") Long memberId,HttpServletRequest request){
        request.setAttribute("teamId",teamId);
        model.addAttribute("teamId",teamId);
        teamMemberService.checkDuplication(memberId,teamId);
        return "joinForm";
    }

    @GetMapping("/my-teams")
    public String myTeams(Model model,@SessionAttribute(name = "memberId") Long memberId){
        List<TeamMember> myTeams = teamMemberService.findMyTeams(memberId);
        model.addAttribute("myTeams",myTeams);
        return "myTeamList";
    }

    @GetMapping("/my-team/{teamId}")
    public String myTeam(@PathVariable Long teamId,@SessionAttribute(name = "memberId") Long memberId,Model model){
        MyTeamResponse myTeam = teamMemberService.findMyTeam(teamId, memberId);
        model.addAttribute("myTeam",myTeam);
        return "myTeamPage";
    }

    @PostMapping("/approve")
    public String approve(HttpServletRequest request, ApproveRequest approveRequest){
        teamMemberService.approve(approveRequest);
        String referer = request.getHeader("Referer");
        return "redirect:"+ referer;
    }

    @PostMapping("/reject")
    public String reject(HttpServletRequest request, ApproveRequest approveRequest){
        teamMemberService.reject(approveRequest);
        String referer = request.getHeader("Referer");
        return "redirect:"+ referer;
    }

    @GetMapping("/application")
    public String applicationStatus(@SessionAttribute(name = "memberId") Long memberId, Model model){
        List<TeamMember> applications = teamMemberService.findApplication(memberId);
        model.addAttribute("applications",applications);
        return "applyStatusPage";
    }
}
