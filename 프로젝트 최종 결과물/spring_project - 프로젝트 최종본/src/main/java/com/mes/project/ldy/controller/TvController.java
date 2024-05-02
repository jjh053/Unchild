package com.mes.project.ldy.controller;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.mes.project.jjh.dto.Ss_DTO;

public interface TvController {
	public int insertController(Model model, List<Map> list);
	public String selectProcess(Model model);
	public String selectController(Model model, @ModelAttribute Ss_DTO ssdto);
}
