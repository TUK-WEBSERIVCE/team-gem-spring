package com.tuk.teamgem.teammember.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Service;

@Getter
@Setter
public class ApproveRequest {
private Long memberId;
private Long teamId;
}
