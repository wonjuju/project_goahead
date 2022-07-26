package com.smhrd.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.domain.HelmetVO;
import com.smhrd.domain.Member;
import com.smhrd.domain.UlocationVO;



public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession sqlSession = null;
	
	
	//회원관리 메소드
	public ArrayList<Member> getAllList() {
		ArrayList<Member> list = new ArrayList<Member>();
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			list = (ArrayList) sqlSession.selectList("com.smhrd.dao.MemberDAO.getAllList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}

	// 사용자 위치 메소드 
	public UlocationVO Ulocation(String mem_id) {
		UlocationVO vo = new UlocationVO();
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			vo = sqlSession.selectOne("com.smhrd.dao.MemberDAO.Ulocation", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return vo;
	}
	
	public HelmetVO whereHelmet(String hel_number) {
		HelmetVO vo = new HelmetVO();
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			vo = (HelmetVO)sqlSession.selectOne("com.smhrd.dao.MemberDAO.Hlocation", hel_number);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return vo;
	}

}
