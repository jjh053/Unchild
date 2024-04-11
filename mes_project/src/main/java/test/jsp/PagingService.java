package test.jsp;

import java.util.List;


public class PagingService {

	Paging_DAO pagingDAO = new Paging_DAO();

	List<PagingDTO> listPaging(int pageNum, int countPerPage, String name) {
		int start = 0;
		int end = 0;
		// start : ( ( 2 - 1 ) * 5 ) + 1
		// end : 2 * 5

		start = ((pageNum - 1) * countPerPage) + 1;
		end = pageNum * countPerPage;
		List list = pagingDAO.selectPost(start, end, name);

		return list;

	}

	static int getTotalPaging() {
		return Paging_DAO.selectTotalEmp();

	}
}
