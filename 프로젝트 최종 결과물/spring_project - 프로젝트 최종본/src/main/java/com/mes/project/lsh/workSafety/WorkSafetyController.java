package com.mes.project.lsh.workSafety;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mes.project.lsh.file.FileController;

@Controller
public class WorkSafetyController {
	
	@Autowired
	private WorkSafetyService workSafetyService;
	@Autowired
	private FileController fileController;

	// 조회
	@RequestMapping(value="/workSafety", method= {RequestMethod.GET})
	public String selctController(Model model) {

		List<WorkSafetyDTO> list = workSafetyService.selectService();

		model.addAttribute("selectList", workSafetyService.selectService());
		return "workSafety";
	}
	
	// 추가
	@RequestMapping(value="/workSafety", method= {RequestMethod.POST})
	public String insertController(@ModelAttribute WorkSafetyDTO workSafetyDTO) {
		
		workSafetyService.insertService(workSafetyDTO);
		return "redirect:workSafety";
	}
	
	// 수정
	@RequestMapping(value="/workSafety/update", method= {RequestMethod.POST})
	public String updateController(@ModelAttribute WorkSafetyDTO workSafetyDTO) {

		workSafetyService.updateService(workSafetyDTO);
		return "redirect:/workSafety";
	}
	
	// 삭제
	@RequestMapping(value="/workSafety/delete", method= {RequestMethod.POST})
	public String deleteController(@ModelAttribute WorkSafetyDTO workSafetyDTO) {
		
		workSafetyService.deleteService(workSafetyDTO);
		return "redirect:/workSafety";
	}
}
