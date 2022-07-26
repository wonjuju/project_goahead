package com.smhrd.dao;


import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	

	static SqlSessionFactory sqlSession;
	
	// 객체 생성시 실행되는 구간(객체를 부르기만 해도 동일하게 실행되는 구간이다.)
	// 생성자 : 인스턴스를 생성하는 메소드
	// 서로 다른 인스턴스(주소 값이 서로 다른 객체)도 동일한 내용을 공유한다.
	// static(정적인 or 공유변수)
	
	// 내용 전체 복붙해서 쓰는데 resource 내용만 바꿔주기! --> "com/smhrd/database/mybatis-config.xml";
	
	static {
		// 1) 연결할 설정 정보 가져오기--> .이아닌 /로 표시 주의!
		String resource = "com/smhrd/dao/mybatis-config.xml";
		
		// 2) 문자열을 읽어서 진짜 파일로 되돌려준 도구를 하나 꺼내오기
		Reader reader;

		try {
			// 3) config파일을 읽어서 class path 경로형태를 가진 Reader객체로 반환
			// 문자열로 된 config파일을 진짜 해석할 수 있게 도와주는 역할
			reader = Resources.getResourceAsReader(resource);
			
			// 4) config파일안에 있는 데이터베이스 정보를 기반으로
			// DB랑 연결통로를 가지고 있을수 있게 해주는 구간
			sqlSession = new SqlSessionFactoryBuilder().build(reader);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 5) DB랑 연결하고 있는 연결통로에 대한 정보를 갖고있는 객체 반환
	// 	  DB연결, 종료, 실행 세션관리
	public static SqlSessionFactory getSqlSession() {
		return sqlSession;
	}
}
