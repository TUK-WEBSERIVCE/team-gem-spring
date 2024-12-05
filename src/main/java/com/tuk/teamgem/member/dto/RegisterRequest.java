package com.tuk.teamgem.member.dto;

public record RegisterRequest(
    String loginId,
    String password,
    String nickname
) {

}
