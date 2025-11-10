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

public class RequestJoinEvent {
    private Integer id;
    private Integer accountId;
    private Integer eventId;
    private Date created_at;
    private String status;
}
