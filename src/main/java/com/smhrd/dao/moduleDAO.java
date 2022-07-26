package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.domain.moduleVO;

public class moduleDAO {

	private SqlSession sqlSession = null;
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int updateGPS(moduleVO vo) {
		
		int row =0;
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			row = sqlSession.update("com.smhrd.dao.moduleDAO.updateGPS", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		if(row>0) {
			System.out.println("updateGPS 성공");
		}
		return row;
		
	}
	
	public int updateLost(String hel_number) {
		int row = 0;
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			row = sqlSession.update("com.smhrd.dao.moduleDAO.updateLost", hel_number);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return row;
	}
}
