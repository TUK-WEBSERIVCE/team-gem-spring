package com.tuk.teamgem.team.dto;

import java.time.LocalDateTime;

public record TeamRegisterRequest(
    String name,
    int capacity,
    int field,
    LocalDateTime dueDate,
    String description)
{

}
