package edu.spring.service;

import java.util.List;

import edu.spring.vo.UserVO;

public interface UserService {
	
	public abstract List<UserVO> read();
//	public abstract List<UserVO> read(UserVO vo);
	public abstract UserVO read(String id);
	public abstract int create(UserVO vo);
	public abstract int update(UserVO vo);
	public abstract int delete(String id);
	public abstract UserVO loginCheck(UserVO vo);
	public abstract boolean isExitingId(String id);

}
