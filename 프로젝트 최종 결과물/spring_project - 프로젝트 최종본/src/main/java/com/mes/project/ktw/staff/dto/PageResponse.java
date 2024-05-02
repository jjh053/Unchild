package com.mes.project.ktw.staff.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PageResponse<T> {
    private List<T> items;
    private int totalItems;
    private int totalPages;
}
