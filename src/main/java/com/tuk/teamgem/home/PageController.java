package com.tuk.teamgem.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping
    public String home(){
        return "mainPage";
    }

    @GetMapping("/login-page") // 로그인
    public String login(){ return "login";}

    @GetMapping("/apply-page") // 지원현황
    public String apply() { return "applyStatusPage"; }

    @GetMapping("/myTeam-page") // 내 팀
    public String myTeam() { return "myTeamList"; }

    @GetMapping("/registerMember-page") // 모집 페이지
    public String registerMember() { return "registerMemberForm"; }
}
