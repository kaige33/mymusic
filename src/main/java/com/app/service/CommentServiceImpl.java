package com.app.service;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Comment;
import com.app.mapper.CommentDAO;
@Service
public class CommentServiceImpl implements CommentService{
	@Resource CommentDAO commentDao;
public List<Comment> getCommentPager(@Param("skip") int skip,@Param("size") int size){
return commentDao.getCommentPager(skip, size);
}
public  Comment getCommentById(int id){
return commentDao.getCommentById(id);
}
public int getCommentCount(){
return commentDao.getCommentCount();
}
public int insert(Comment entity){
return commentDao.insert(entity);
}
public int delete(int id){
return commentDao.delete(id);
}
public int update(Comment entity){
return commentDao.update(entity);
}
public List<Comment> getAllComment(){
return commentDao.getAllComment();
}

}
