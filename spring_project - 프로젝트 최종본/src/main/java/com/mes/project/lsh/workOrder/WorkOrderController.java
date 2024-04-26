package com.mes.project.lsh.workOrder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mes.project.lsh.file.FileController;

@Controller
public class WorkOrderController {
	
	@Autowired
	private WorkOrderService workOrderService;
	@Autowired
	private FileController fileController;

	// 조회
	@RequestMapping(value="/workOrder", method= {RequestMethod.GET})
	public String selctController(Model model) {

		List<WorkOrderDTO> list = workOrderService.selectService();

		model.addAttribute("selectList", workOrderService.selectService());
		return "workOrder";
	}
	
	// 추가
	@RequestMapping(value="/workOrder", method= {RequestMethod.POST})
	public String insertController(@ModelAttribute WorkOrderDTO workOrderDTO) {
		
		workOrderService.insertService(workOrderDTO);
		return "redirect:workOrder";
	}
	
	// 수정
	@RequestMapping(value="/workOrder/update", method= {RequestMethod.POST})
	public String updateController(@ModelAttribute WorkOrderDTO workOrderDTO) {

		workOrderService.updateService(workOrderDTO);
		return "redirect:/workOrder";
	}
	
	// 삭제
	@RequestMapping(value="/workOrder/delete", method= {RequestMethod.POST})
	public String deleteController(@ModelAttribute WorkOrderDTO workOrderDTO) {
		
		workOrderService.deleteService(workOrderDTO);
		return "redirect:/workOrder";
	}
}
