package com.fall25.sp.swp.quanly.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class RequestJoinClub {

    private Integer id;
    private Integer accountId;
    private Integer clubId;
    private String self;
    private String reason;
    private String status;
    private Date created_at;
}
