package com.fall25.sp.swp.quanly.entity;

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
public class RequestForm {
    private Integer id;
    private Integer clubID;
    private Integer accountIdReq;
    private Integer presidentIdNew;

    @Builder.Default
    private ReasonType typeReason = ReasonType.OTHER;

    private String description;
    private String status;

    public enum ReasonType {
        GRADUATION,
        TRANSFER,
        PERSONAL,
        PERFORMANCE,
        ELECTION,
        OTHER;

        public static ReasonType fromString(String value) {
            if (value == null) return OTHER;
            try {
                return ReasonType.valueOf(value.toUpperCase());
            } catch (IllegalArgumentException e) {
                return OTHER;
            }
        }
    }
}