package com.tuk.teamgem.member.controller;

import com.tuk.teamgem.member.dto.RegisterRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

    @PostMapping
    public void register(@RequestBody RegisterRequest request){

    }
}
