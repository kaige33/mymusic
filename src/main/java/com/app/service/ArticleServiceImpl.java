package com.app.service;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Article;
import com.app.entity.Category;
import com.app.mapper.ArticleDAO;
@Service
public class ArticleServiceImpl implements ArticleService{
	@Resource ArticleDAO articleDao;
public List<Article> getArticlePager(@Param("skip") int skip,@Param("size") int size){
return articleDao.getArticlePager(skip, size);
}
public  Article getArticleById(int id){
return articleDao.getArticleById(id);
}
public int getArticleCount(){
return articleDao.getArticleCount();
}
public int insert(Article entity){
return articleDao.insert(entity);
}
public int delete(int id){
return articleDao.delete(id);
}
public int update(Article entity){
return articleDao.update(entity);
}
public List<Article> getAllArticle(){
return articleDao.getAllArticle();
}
public List<Article> getRandom() {
	// TODO Auto-generated method stub
	return articleDao.getRandom();
}

}
