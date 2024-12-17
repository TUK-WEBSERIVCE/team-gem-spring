package com.tuk.teamgem.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/login-page") // 로그인
    public String login(){ return "login";}

    @GetMapping("/apply-page") // 지원현황
    public String apply() { return "applyStatusPage"; }

    @GetMapping("/registerMember-page") // 모집 페이지
    public String registerMember() { return "registerMemberForm"; }

    @GetMapping("/detailTeam-page") // 지원가능 팀 상세 페이지
    public String detailTeam() { return "detailTeamPage"; }

    @GetMapping("/joinForm-page") // 참여 폼 작성 페이지
    public String joinForm() { return "joinForm"; }

    @GetMapping("/myTeam-page") // 내 팀 페이지
    public String myTeam() { return "myTeamPage"; }
}
