package edu.spring.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.vo.UserVO;

@Repository
public class UserDAOImple implements UserDAO {

	private static final String NAMESPACE = "edu.spring.UserMapper";

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<UserVO> select() {
		
		return sqlSession.selectList(NAMESPACE + ".select_all");
	}
	
	@Override
	public UserVO select(String id) {

		return sqlSession.selectOne(NAMESPACE + ".select_by_id", id);
	}
	
	@Override
	public int insert(UserVO vo) {
		
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
	@Override
	public int update(UserVO vo) {
		
		return sqlSession.insert(NAMESPACE + ".update", vo);
	}
	
	@Override
	public int delete(String id) {
		
		return sqlSession.insert(NAMESPACE + ".delete", id);
	}
	
	@Override
	public UserVO loginCheck(UserVO vo) {
		
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}
}
