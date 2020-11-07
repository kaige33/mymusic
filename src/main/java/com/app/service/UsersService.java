package com.app.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Users;
public interface UsersService {
    public List<Users> getUsersPager(@Param("skip") int skip, @Param("size") int size);
    public  Users getUsersById(int id);   
    public int getUsersCount();   
    public int insert(Users entity);   
    public int delete(int id);   
    public int update(Users entity);
	public List<Users> getAllUsers();
	public Users userLogin(String username, String password);
	public List<Users> getCustomer(int fromid);
}
