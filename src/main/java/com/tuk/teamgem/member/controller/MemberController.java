package com.tuk.teamgem.member.controller;

import com.tuk.teamgem.member.dto.MemberRegisterResponse;
import com.tuk.teamgem.member.dto.RegisterRequest;
import com.tuk.teamgem.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;
    @PostMapping
    public MemberRegisterResponse register(@RequestBody RegisterRequest request){
        return memberService.register(request);
    }

    @GetMapping("/register-form")
    public String registerForm(){
        return "join";
    }
}
