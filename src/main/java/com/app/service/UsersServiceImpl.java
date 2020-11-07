package com.app.service;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Users;
import com.app.mapper.UsersDAO;
@Service
public class UsersServiceImpl implements UsersService{
	@Resource UsersDAO usersDao;
public List<Users> getUsersPager(@Param("skip") int skip,@Param("size") int size){
return usersDao.getUsersPager(skip, size);
}
public  Users getUsersById(int id){
return usersDao.getUsersById(id);
}
public int getUsersCount(){
return usersDao.getUsersCount();
}
public int insert(Users entity){
return usersDao.insert(entity);
}
public int delete(int id){
return usersDao.delete(id);
}
public int update(Users entity){
return usersDao.update(entity);
}
public List<Users> getAllUsers(){
return usersDao.getAllUsers();
}

public Users userLogin(String username, String password) {
	// TODO Auto-generated method stub
	return usersDao.userLogin(username, password);
}
public List<Users> getCustomer(int fromid) {
	// TODO Auto-generated method stub
	return usersDao.getCustomer(fromid);
}


}
