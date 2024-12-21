package com.tuk.teamgem;

import com.tuk.teamgem.exception.AdminAuthenticationFailedException;
import com.tuk.teamgem.exception.DuplicationException;
import com.tuk.teamgem.exception.LoginException;
import com.tuk.teamgem.exception.OutDatedException;
import com.tuk.teamgem.exception.RegisterException;
import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.team.service.TeamService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
@RequiredArgsConstructor
public class GlobalExceptionHandler {

    private final TeamService teamService;

    @ExceptionHandler(ServletRequestBindingException.class)
    public String handleServletRequestBindingException(ServletRequestBindingException ex) {
        return "sessionError";
    }

    @ExceptionHandler(AdminAuthenticationFailedException.class)
    public String adminAuthenticationFailedException(AdminAuthenticationFailedException ex) {
        return "adminError";
    }

    @ExceptionHandler(LoginException.class)
    public String loginException(LoginException ex, Model model) {
        model.addAttribute("errorMessage",ex.getLocalizedMessage());
        return "loginError";
    }

    @ExceptionHandler(RegisterException.class)
    public String registerException(RegisterException ex, Model model) {
        model.addAttribute("errorMessage",ex.getLocalizedMessage());
        return "registerError";
    }

    @ExceptionHandler(DuplicationException.class)
    public String duplicationException(DuplicationException ex, Model model,
        HttpServletRequest request) {
        model.addAttribute("errorMessage",ex.getLocalizedMessage());
        Long teamId = (Long) request.getAttribute("teamId");
        Team team = teamService.getTeam(teamId);
        model.addAttribute("team",team);
        return "joinFormError";
    }

    @ExceptionHandler(OutDatedException.class)
    public String outDatedException(OutDatedException ex, Model model,HttpServletRequest request) {
        int itemsPerPage = 6; // 페이지당 데이터 개수
        Pageable pageable = PageRequest.of(0, itemsPerPage);
        Page<Team> teamPage = teamService.getTeams(pageable);

        model.addAttribute("teams", teamPage.getContent());
        model.addAttribute("currentPage", 1); // 현재 페이지 (1부터 시작)
        model.addAttribute("totalPages", teamPage.getTotalPages());
        model.addAttribute("errorMessage",ex.getLocalizedMessage());
        return "mainPageError";
    }
}
