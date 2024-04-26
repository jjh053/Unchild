package com.mes.project.jjh.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mes.project.jjh.dao.Rodi_DAO;
import com.mes.project.jjh.dto.Rodi_DTO;
import com.mes.project.lsh.file.FileUpload;

@Service
public class Rodi_Service {
	@Autowired
	Rodi_DAO rodiDAO;
	@Autowired
	private FileUpload fileUpload;
//	- 작업자 - 품목선택 페이지
	public List select1(Rodi_DTO rodi_dto) {

		List list = rodiDAO.select1(rodi_dto);
//		System.out.println("rodi_Service list1 : " + list);
		return list;

	}

	public List select2(Rodi_DTO rodi_dto) {

		List list = rodiDAO.select2(rodi_dto);
		System.out.println("rodi_Service list2 : " + list);

		return list;

	}

	// - 작업자 - 관리자에게 주문요청
	public int insert1(Rodi_DTO dto) {
		try {
			dto.setItemImg( fileUpload.upload(dto.getImgFileName()));
			
			System.out.println("dto.getItemImg() >> ?? : " + dto.getItemImg());
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return rodiDAO.insert1(dto);
	}
	/*public int insert1(HttpServletRequest request) {

		///////////// 파일 업로드 ///////////////////
		List itemNames = new ArrayList();
		List itemCounts = new ArrayList();
		List de_contents = new ArrayList();
		List de_etcs = new ArrayList();
		List co_numbers = new ArrayList();
		List s_numbers = new ArrayList();
		List userInfos = new ArrayList();
		List fileNames = new ArrayList();
		String fileName = null;
		int insert1 = -1;

		//////////////////// 업로드 부분
		String encoding = "utf-8";
		// 파일 경로, 파일 이름, 용량 이 세가지 빼고는 복사해서 붙여넣기로 쓰면 됨

		try {
			// File ; 파일 또는 디렉토리(폴더)를 관리하는 class
			File currentDirPath = new File("C:\\file_repo"); // 첫째로 할 일

			// 세팅
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setRepository(currentDirPath);
			// 처리하는 메모리 용량(1바이트 단위, 1024면 키로바이트, 1메가바이트(1024 * 1024))
			// 8bit = 1byte
			// 1024Byte = 1KB
			// 1024KB = 1MB
			// 1024MB = 1GB
			// 1024GB = 1TB
			// 한번에 처리하는 용량이 1MB라는 뜻
			factory.setSizeThreshold(1024 * 1024);

			ServletFileUpload upload = new ServletFileUpload(factory);
			// 파일의 최대 크기 지정(100메가), 아래 수치를 바꾸면 올릴 수 있는 용량이 달라짐
			// 설정된 용량보다 큰 것을 올리면 자바콘솔에 오류가 난다.
			upload.setFileSizeMax(1024 * 1024 * 100);

			// request를 분석하라(내가 jsp에서 보낸 모든 것을 items에 담음)
			List items = upload.parseRequest(request);
			System.out.println("items.size() : " + items.size());

			for (int i = 0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);

				// isFormField 텍스트인지 파일인지

				if (fileItem.isFormField()) {
					// 파일이 아니면 이쪽으로 들어옴!!!!
//					<input type="text" name = "addId">
//					<input type="text" name = "addPw">
//					이 두개는 여기로 들어옴

					// form 요소인지 판별
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
//					// 기존처럼 사용 가능
//					String param1 = request.getParameter("param1");
					if ("itemName".equals(fileItem.getFieldName())) {
						itemNames.add(fileItem.getString(encoding));
					} else if ("itemCount".equals(fileItem.getFieldName())) {
						itemCounts.add(Integer.parseInt(fileItem.getString(encoding)));
					} else if ("de_content".equals(fileItem.getFieldName())) {
						de_contents.add(fileItem.getString(encoding));
					} else if ("de_etc".equals(fileItem.getFieldName())) {
						de_etcs.add(fileItem.getString(encoding));
					} else if ("co_number".equals(fileItem.getFieldName())) {
						co_numbers.add(Integer.parseInt(fileItem.getString(encoding)));
					} else if ("s_number".equals(fileItem.getFieldName())) {
						s_numbers.add(Integer.parseInt(fileItem.getString(encoding)));
					} else if ("userInfo".equals(fileItem.getFieldName())) {
						userInfos.add(fileItem.getString(encoding));
					}
				} else {
					// file 영역
					System.out.println("param:" + fileItem.getFieldName());
					System.out.println("file name:" + fileItem.getName());
					System.out.println("file size:" + fileItem.getSize() + "Bytes");
					// 사이즈가 0보다 클 때(파일이 망가지거나 등등의 이유로 0일 수 있나봄)
					if (fileItem.getSize() > 0) {
//						파일명이 오는 형태가 [C:\\temp\\a.jpg] 이래서 잘라해는 것임
						// 아이디어 1 : 파일명을 추출하는
						int idx = fileItem.getName().lastIndexOf("\\");
						System.out.println("idx : 1 : " + idx);
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						System.out.println("idx : 2 : " + idx);

						// 최종적으로 DB에 들어갈 파일명은 fileName임
						fileName = fileItem.getName().substring(idx + 1);
//						fname = fileName;
						System.out.println("fileName : " + fileName);
						// 아이디어 2 : 파일명 중복 방지
						long timestamp = System.currentTimeMillis();
						fileName = timestamp + "_" + fileName;

						fileNames.add(fileName);

						File uploadFile = new File(currentDirPath + "\\" + fileName);
//						File uploadFile = new File(currentDirPath + File.separator + fileName);
//						File uploadFile = new File(currentDirPath + System.getProperty("file.separator") + fileName);
						fileItem.write(uploadFile);

					} // end if
				} // end if
			} // end for
				// 위쪽 for문 안에서 DTO(VO)를 완성하고
				// DB에 저장할 수 있겠다
			System.out.println("파일 업로드 부분");
			System.out.println("itemNames.size() : " + itemNames.size());
			System.out.println("itemCounts.size() : " + itemCounts.size());
			System.out.println("de_contents.size() : " + de_contents.size());
			System.out.println("de_etcs.size() : " + de_etcs.size());
			System.out.println("co_numbers.size() : " + co_numbers.size());
			System.out.println("s_numbers.size() : " + s_numbers.size());
			System.out.println("userInfos.size() : " + userInfos.size());
			System.out.println("fileNames.size() : " + fileNames.size());

			System.out.println("파일 업로드 부분 끝");

			///////////// 파일 업로드 끝 ///////////////////

			for (int i = 0; i < itemNames.size(); i++) {
				Rodi_DTO rodi_dto = new Rodi_DTO();
				rodi_dto.setItemName((String) itemNames.get(i));
//				rodi_dto.setItemCount((Integer) itemCounts.get(i));
//				rodi_dto.setDe_content((String) de_contents.get(i));
//				rodi_dto.setDe_etc((String) de_etcs.get(i));
//				rodi_dto.setCo_number((Integer) co_numbers.get(i));
//				rodi_dto.setS_number((Integer) s_numbers.get(i));
//				rodi_dto.setUserInfo((String) userInfos.get(i));

				if (itemCounts.size() > i) {
					rodi_dto.setItemCount((Integer) itemCounts.get(i));
				}
				if (de_contents.size() > i) {
					rodi_dto.setDe_content((String) de_contents.get(i));
				}
				if (de_etcs.size() > i) {
					rodi_dto.setDe_etc((String) de_etcs.get(i));
				}
				if (co_numbers.size() > i) {
					rodi_dto.setCo_number((Integer) co_numbers.get(i));
				}
				if (s_numbers.size() > i) {
					rodi_dto.setS_number((Integer) s_numbers.get(i));
				}
				if (userInfos.size() > i) {
					rodi_dto.setUserInfo((String) userInfos.get(i));
				}
				if (fileNames.size() > i) {
					rodi_dto.setItemImg((String) fileNames.get(i));
				}
				insert1 = rodiDAO.insert1(rodi_dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		///////////////////////// 업로드 끝

		return insert1;
	}*/

	public void download(String fileName, HttpServletResponse response) {

		/////////////////////////////////////////////////////////////////////////////////
		try {
			String file_rep = "c:\\file_repo";

			System.out.println("fileName : " + fileName);

			System.out.println("폴더 구분자 1 : " + System.getProperty("file.separator"));
			System.out.println("폴더 구분자 2 : " + File.separator);

			// 경로를 String으로 만들어줌 (file full path : 파일전체 경로)
			String downFile = file_rep + System.getProperty("file.separator") + fileName;

			// 파일에다가 경로를 넣어줌(지정한 파일 그 자체)
			File f = new File(downFile);

			// 파일을 읽을 흐름(stream)을 열어서 준비 (FileInputStream : 들어오는 흐름, 수도꼭지를 여는 것과 같다고 하심)
			FileInputStream in;

			in = new FileInputStream(f);

			////////////////////////////////////////////////////////////////////////////////////

			// cache:임시저장, no-cache: 임시저장하지 마라
			// 해석 : 브라우저 캐시를 사용하지 않도록
			// 브라우저는 같은 파일은 두번 안받으려고 노력함.
			response.setHeader("Cache-Control", "no-cache");
			response.addHeader("Content-disposition", "attachment; fileName=" + fileName);

			// 아래처럼 바꾸면 "a.txt"라는 이름으로 파일이 저장됨
//	response.addHeader("Content-disposition", "attachment; fileName=" + "a.txt");

			// 브라우저로 내보낼 수 있는 흐름을 열어서 준비
			OutputStream out;

			out = response.getOutputStream();

			/////////////////////////////////////////////////////////////////////////////////////

//	(1024 * 1 : 1KB)
//	흐름에서 java 메모리로 퍼 올릴 바가지의 크기
			byte[] buf = new byte[1024 * 1]; // 보통은 8KB정도로 쓴다.

			while (true) {

				// in.read(buf) : buf만큼 흐름에서 읽어서 java메모리에 올린다.
				// 읽은 양(byte)만큼 돌려준다.
				// 단, 더 읽을 내용이 없으면 -1을 돌려준다. (-1 될 때까지 퍼나른다.(더 읽을 내용이 없을 때까지 퍼나른다.))

				int count = in.read(buf);
				System.out.println("파일에서 읽은 크기 : count : " + count);

				// 더이상 읽을 내용이 없으면 퍼나르기 종료하기 위한 조건문
				if (count == -1) {
					break;
				}

				// 응답의 내보내는 흐름(out)에 바가지의 내용을 보낸다.
				// 0 : 바가지의 처음 값부터
				// count : 읽은 만큼
				// 0, count면 바가지에 있는 거 전부다 라는 뜻이래
				out.write(buf, 0, count);

			}

			// Stream은 무조건 닫아줘야한다고 함. 안닫아주면 계속 사용중이 되는데 이러면 지우거나 이름을 바꾸거나 못함(계속 사용중이라서)
			in.close();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// - 관리자 - 반품신청확인 딜리트
	public int delete(Rodi_DTO rodi_dto) {
		System.out.println("갈 때 rodi_Service delete : " + rodi_dto);
		int delete = rodiDAO.delete(rodi_dto);
		System.out.println("돌아올 때  rodi_Service delete : " + delete);
		return delete;

	}

}
