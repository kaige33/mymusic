package com.app.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;
public interface CommentDAO {
    public List<Comment> getCommentPager(@Param("skip") int skip, @Param("size") int size);
    public  Comment getCommentById(int id);   
    public int getCommentCount();   
    public int insert(Comment entity);   
    public int delete(int id);   
    public int update(Comment entity);
	public List<Comment> getAllComment();
}
