package edu.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.vo.UserVO;
import edu.spring.persistence.UserDAO;

@Service
public class UserServiceImple implements UserService {

	@Autowired
	private UserDAO userDao;
	
	
	@Override
	public List<UserVO> read() {
		return userDao.select();
	}
	
	@Override
	public UserVO read(String id) {
		
		return userDao.select(id);
	}
	
	@Override
	public int create(UserVO vo) {
		
		return userDao.insert(vo);
	}
	
	@Override
	public int update(UserVO vo) {
		
		return userDao.update(vo);
	}
	
	@Override
	public int delete(String id) {
		
		return userDao.delete(id);
	}
	
	@Override
	public UserVO loginCheck(UserVO vo) {
		
		return userDao.loginCheck(vo);
	}
	
	@Override
	public boolean isExitingId(String id) {
		UserVO vo = userDao.select(id);
		if (vo != null) {
			return true;
		} else {
			return false; 
		}
	}

}
