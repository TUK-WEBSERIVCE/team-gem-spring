package com.tuk.teamgem;

import com.tuk.teamgem.exception.AdminAuthenticationFailedException;
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
}
