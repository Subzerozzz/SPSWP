package com.fall25.sp.swp.quanly.entity;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Task {
    private Integer id;
    private String taskName;
    private Integer eventId;
    private String taskDescription;
    private Integer accountId;
    private Date createDate;
    private Date updateDate;

}
