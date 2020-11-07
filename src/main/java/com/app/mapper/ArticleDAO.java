package com.app.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;
public interface ArticleDAO {
    public List<Article> getArticlePager(@Param("skip") int skip, @Param("size") int size);
    public  Article getArticleById(int id);   
    public int getArticleCount();   
    public int insert(Article entity);   
    public int delete(int id);   
    public int update(Article entity);
	public List<Article> getAllArticle();
	public List<Article> getRandom();
}
