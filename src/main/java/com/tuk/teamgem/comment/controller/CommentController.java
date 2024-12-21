package com.tuk.teamgem.comment.controller;

import com.tuk.teamgem.comment.dto.CommentSaveRequest;
import com.tuk.teamgem.comment.service.CommentService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/comment")
@RequiredArgsConstructor
public class CommentController {

    private final CommentService commentService;

    @PostMapping
    public String saveComment(HttpServletRequest httpServletRequest,
        @SessionAttribute(name = "memberId") Long memberId,
        CommentSaveRequest request){
        String referer = httpServletRequest.getHeader("Referer");
        commentService.saveComment(memberId,request);
        return "redirect:"+ referer;
    }

}
