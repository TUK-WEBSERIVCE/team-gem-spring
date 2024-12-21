package com.tuk.teamgem;

import com.tuk.teamgem.exception.AdminAuthenticationFailedException;
import com.tuk.teamgem.exception.LoginException;
import com.tuk.teamgem.exception.RegisterException;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

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
    public String loginException(RegisterException ex, Model model) {
        model.addAttribute("errorMessage",ex.getLocalizedMessage());
        return "registerError";
    }
}
