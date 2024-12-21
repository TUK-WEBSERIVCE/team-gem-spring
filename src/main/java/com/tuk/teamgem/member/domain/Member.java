package com.tuk.teamgem.member.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String loginId;
    private String password;
    private String nickname;
    private Role role;

    @Builder
    public Member(final String loginId, final String password, final String nickname) {
        this.loginId = loginId;
        this.password = password;
        this.nickname = nickname;
        if(password.equals("teamgem")){
            this.role = Role.ADMIN;
        }else{
            this.role = Role.USER;
        }
    }

    public boolean isAdmin(){
        return this.role.equals(Role.ADMIN);
    }
}
