package workOrder;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/workOrder", "/workOrderDel", "/workOrderRetouch", "/workSafety", "/workSafetyDel", "/workSafetyRetouch", "/workQuality", "/workQualityDel", "/workQualityRetouch", "/facilityUpdate", "/workReport"})
public class WorkOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String local = request.getServletPath();
		System.out.println(local);
		
		WorkOrderDAO dao = new WorkOrderDAO();
		List list = dao.selectTable(local);
		
		request.setAttribute("list", list);

		if( local.equals("/workOrder") ) {
			
			request.getRequestDispatcher("workOrder.jsp").forward(request, response);
		} else if( local.equals("/workSafety") ) {
			
			request.getRequestDispatcher("workSafety.jsp").forward(request, response);
		} else if( local.equals("/workQuality") ) {
			
			request.getRequestDispatcher("workQuality.jsp").forward(request, response);
		}
					
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String local = request.getServletPath();
		System.out.println(local);
		if( local.equals("/workOrder") || local.equals("/workSafety") || local.equals("/workQuality") || local.equals("/facilityUpdate") ) {
			
			String title = request.getParameter("title");
			String detail = request.getParameter("detail");
			String urlImage = request.getParameter("urlImage");
			
			int facilitySeq = Integer.parseInt(request.getParameter("facilitySeq"));
			String facilityDetail = request.getParameter("facilityDetail");
			String sendTime = request.getParameter("sendTime");
			int workerId = Integer.parseInt(request.getParameter("workerId"));
			int unclear = Integer.parseInt(request.getParameter("unclear"));
			
			if( local.equals("/workOrder") || local.equals("/workSafety") ) {
				
				if(urlImage.equals(null)) {
					
					urlImage = "https://image.spreadshirtmedia.net/image-server/v1/compositions/T996A1PA2179PT10X17Y18D172654919W7098H6789/views/1,width=550,height=550,appearanceId=1,backgroundColor=FFFFFF,noPt=true/pixel-art-fox-fox-podstawki.jpg";
				}
			}
			
			WorkOrderDTO dto = new WorkOrderDTO();
			
			if( local.equals("/workOrder") || local.equals("/workSafety") || local.equals("/workQuality") ) {
				
				dto.setTitle(title);
				dto.setDetail(detail);
				dto.setUrlImage(urlImage);
			} else if( local.equals("/facilityUpdate") ) {
				
				dto.setFacilitySeq(facilitySeq);
				dto.setFacilityDetail(facilityDetail);
				dto.setSendTime(sendTime);
				dto.setWorkerId(workerId);
				dto.setUnclear(unclear);
			}
			
			WorkOrderDAO dao = new WorkOrderDAO();
			dao.insertInfo(dto, local);
			
			if( local.equals("/facilityUpdate") ) {
				dao.retouchColumn(dto, local);
			}
			
			if( local.equals("/workOrder") ) {
				
				response.sendRedirect("workOrder");
			} else if( local.equals("/workSafety") ) {
				
				response.sendRedirect("workSafety");
			} else if( local.equals("/workQuality") ) {
				
				response.sendRedirect("workQuality");
			} else if( local.equals("/facilityUpdate") ) {
				
				response.sendRedirect("workQuality");
			}
			
		} else if( local.equals("/workOrderDel") || local.equals("/workSafetyDel") || local.equals("/workQualityDel") ) {
			
			String[] seqArr = request.getParameterValues("delCheck");

			for(int i = 0; i < seqArr.length; i++) {
				
				WorkOrderDTO dto = new WorkOrderDTO();
				dto.setSeq(Integer.parseInt(seqArr[i]));
				
				WorkOrderDAO dao = new WorkOrderDAO();
				dao.deleteColumn(dto);
			}
			
			if( local.equals("/workOrderDel") ) {
				
				response.sendRedirect("workOrder");
			} else if( local.equals("/workSafetyDel") ) {
				
				response.sendRedirect("workSafety");
			} else if( local.equals("/workQualityDel") ) {
				
				response.sendRedirect("/workQuality");
			}
			
		} else if( local.equals("/workOrderRetouch") || local.equals("/workSafetyRetouch") || local.equals("/workQualityRetouch") || local.equals("/facilityUpdate") ) {
			
			String check = request.getParameter("checkValue");
			String title = request.getParameter("title");
			String detail = request.getParameter("detail");
			String urlImage = request.getParameter("urlImage");
			System.out.println(check);
			if(urlImage == null) {
				
				urlImage = "https://image.spreadshirtmedia.net/image-server/v1/compositions/T996A1PA2179PT10X17Y18D172654919W7098H6789/views/1,width=550,height=550,appearanceId=1,backgroundColor=FFFFFF,noPt=true/pixel-art-fox-fox-podstawki.jpg";
			}
			
			WorkOrderDTO dto = new WorkOrderDTO();
			dto.setSeq(Integer.parseInt(check));
			dto.setTitle(title);
			dto.setDetail(detail);
			dto.setUrlImage(urlImage);
			
			WorkOrderDAO dao = new WorkOrderDAO();
			dao.retouchColumn(dto, local);
			
			if( local.equals("/workOrderRetouch") ) {
				
				response.sendRedirect("workOrder");
			} else if( local.equals("/workSafetyRetouch") ) {
				
				response.sendRedirect("workSafety");
			} else if( local.equals("/workQualityRetouch") ) {
				
				response.sendRedirect("workQuality");
			}
		}
		
	}

}
