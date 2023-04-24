package com.kh.mainPage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import java.util.LinkedHashMap;

import com.kh.common.JDBCTemplate;
import com.kh.mainPage.model.dao.MainPageDao;
import com.kh.mainPage.model.vo.Cafe;
import com.kh.mainPage.model.vo.CafeAttachment;
import com.kh.mainPage.model.vo.CafeReply;

public class MainPageService {

	public ArrayList<Cafe> selectCafeList(String location) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Cafe> list = new MainPageDao().selectCafeList(conn, location);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<Cafe> selectCafeScore(ArrayList<Cafe> list) {
		Connection conn = JDBCTemplate.getConnection();
		
		list = new MainPageDao().selectCafeScore(conn,  list);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<Cafe> countReply(ArrayList<Cafe> list) {
		Connection conn = JDBCTemplate.getConnection();
		
		list = new MainPageDao().countReply(conn, list);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public Cafe selectCafeInfo(String address) {
		Connection conn = JDBCTemplate.getConnection();
		
		Cafe cafe = new MainPageDao().selectCafeInfo(conn, address);
		
		JDBCTemplate.close(conn);
		
		return cafe;
	}

	public Cafe countScore(Cafe cafe) {
		Connection conn = JDBCTemplate.getConnection();
		
		cafe = new MainPageDao().countScore(conn, cafe);
		
		JDBCTemplate.close(conn);
		
		return cafe;
	}

	public LinkedHashMap<String, Integer> selectMenu(int cafeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		LinkedHashMap<String, Integer> map = new MainPageDao().selectMenu(conn, cafeNo);
		
		JDBCTemplate.close(conn);
		
		return map;
	}

	public ArrayList<CafeAttachment> selectAttachmentList(ArrayList<Cafe> list) { //카페 대문 이미지 조회
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CafeAttachment> cfatList = new MainPageDao().selectAttachmentList(conn, list);
		
		JDBCTemplate.close(conn);
		
		return cfatList;
	}

	public ArrayList<CafeAttachment> selectDetailAtList(int cafeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CafeAttachment> detailAtList = new MainPageDao().selectDetailAtList(conn, cafeNo);
		
		JDBCTemplate.close(conn);
		
		return detailAtList;
	}

	public ArrayList<CafeReply> selectReplyList(int cafeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CafeReply> list = new MainPageDao().selectReplyList(conn, cafeNo);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int insertScore(int cafeNo, int userNo, ArrayList<Integer> list) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MainPageDao().insertScore(conn, cafeNo, userNo, list);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int insertReview(int cafeNo, int userNo, String content) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MainPageDao().insertReview(conn, cafeNo, userNo, content);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

}
