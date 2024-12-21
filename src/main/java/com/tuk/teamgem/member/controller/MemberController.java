package com.tuk.teamgem.member.controller;

import com.tuk.teamgem.member.dto.LoginRequest;
import com.tuk.teamgem.member.dto.LoginResponse;
import com.tuk.teamgem.member.dto.RegisterRequest;
import com.tuk.teamgem.member.service.MemberService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @PostMapping("/register")
    public String register(RegisterRequest registerRequest){
        try{
            memberService.register(registerRequest);
        }catch (IllegalStateException e){
            return "duplicationLoginId";
        }
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(LoginRequest loginRequest, HttpServletRequest request,
        HttpServletResponse response){
        LoginResponse loginResponse = memberService.login(loginRequest);
        HttpSession session = request.getSession();
        session.setAttribute("memberId",loginResponse.memberId());
        session.setMaxInactiveInterval(36000);
        return "redirect:/";
    }

    @GetMapping("/register-form")
    public String registerForm(){
        return "join";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
}
