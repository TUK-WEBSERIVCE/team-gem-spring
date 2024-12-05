package com.tuk.teamgem.member.controller;

import com.tuk.teamgem.member.dto.LoginRequest;
import com.tuk.teamgem.member.dto.LoginResponse;
import com.tuk.teamgem.member.dto.MemberRegisterResponse;
import com.tuk.teamgem.member.dto.RegisterRequest;
import com.tuk.teamgem.member.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;
    @PostMapping("/register")
    public String register(RegisterRequest registerRequest){
        memberService.register(registerRequest);
        return "mainPage";
    }

    @PostMapping("/login")
    public String login(LoginRequest loginRequest, HttpServletRequest request){
        LoginResponse loginResponse = memberService.login(loginRequest);
        HttpSession session = request.getSession();
        session.setAttribute("id",loginResponse.memberId());
        return "mainPage";
    }

    @GetMapping("/register-form")
    public String registerForm(){
        return "join";
    }
}
