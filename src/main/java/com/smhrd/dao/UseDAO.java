package com.smhrd.dao;

import java.util.ArrayList;

import org.apache.coyote.http11.upgrade.UpgradeServletOutputStream;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.domain.AccVO;
import com.smhrd.domain.HelmetVO;
import com.smhrd.domain.Member;
import com.smhrd.domain.UseVO;

public class UseDAO {
	private SqlSession sqlSession = null;
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int useInsert(UseVO vo) {
		int row = 0;
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			row = sqlSession.insert("com.smhrd.dao.UseDAO.useInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return row;
	}
	
	public AccVO accView(String hel_number) {
		AccVO vo = null;
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			vo = (AccVO)sqlSession.selectOne("com.smhrd.dao.UseDAO.accSelectOne", hel_number);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return vo;
	}

	public UseVO useList(String mem_id) {
		UseVO result = new UseVO();			
		
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			result = sqlSession.selectOne("com.smhrd.dao.UseDAO.useList", mem_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			sqlSession.close();
		}
		
		return result;
		
	}

	
	public UseVO useList2(String hel_number) {
		UseVO result = new UseVO();
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			result = (UseVO)sqlSession.selectOne("com.smhrd.dao.UseDAO.useList2", hel_number);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}
	
	
	public int stop(String mem_id) {
		
		int row = 0;
		
		try {
			
			sqlSession = sqlSessionFactory.openSession(true);
			row =sqlSession.update("com.smhrd.dao.UseDAO.stop", mem_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			sqlSession.close();
		}
		
		return row;
	}
	
	public HelmetVO startGPS(String hel_number) {
		HelmetVO vo = null;
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			vo = sqlSession.selectOne("com.smhrd.dao.UseDAO.helSelectOne", hel_number);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return vo;
	}
	
	public int stopGPS(UseVO vo) {
		int row = 0;
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			row = sqlSession.update("com.smhrd.dao.UseDAO.stopGPS", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return row;
	}

	public int accList(AccVO accvo) {
		int row = 0;
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			row = sqlSession.insert("com.smhrd.dao.UseDAO.accList", accvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return row;
	}

	public ArrayList<UseVO> usinglist(String mem_id) {
		ArrayList<UseVO> list = new ArrayList<UseVO>();
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			list = (ArrayList)sqlSession.selectList("com.smhrd.dao.UseDAO.usinglist", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	public AccVO accListView(int use_number) {
		AccVO vo = null;
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			vo = (AccVO)sqlSession.selectOne("com.smhrd.dao.UseDAO.accListView", use_number);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return vo;
	}
}
