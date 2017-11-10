package edu.spring.persistence;

import java.util.List;

import edu.spring.vo.UserVO;

public interface UserDAO {

	public abstract List<UserVO> select();
//	public abstract List<UserVO> select(UserVO vo);
	public abstract UserVO select(String id);
	public abstract int insert(UserVO vo);
	public abstract int update(UserVO vo);
	public abstract int delete(String id);
	public abstract UserVO loginCheck(UserVO vo);
}
