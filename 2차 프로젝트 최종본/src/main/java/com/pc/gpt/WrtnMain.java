package com.pc.gpt;


public class WrtnMain {

	public static void main(String[] args) {
		
		// 책 추천관련 작업들
		Long unixTime = System.currentTimeMillis();
		System.out.println("시작");
		
		String query = "오늘 기분이 어때?";
		
		Book_Recommend brc = new Book_Recommend();
		// 실행 결과값
		String result = brc.wrtn_qna(query);
		
        System.out.println("추천 목록 총 걸린시간 : " + (System.currentTimeMillis() - unixTime));
        System.out.println("질문 : " + query);
        System.out.println("답변 : " + result);
	}

}
