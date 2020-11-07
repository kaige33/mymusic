package com.app.controller;
import java.io.File;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.app.entity.*;
import com.app.service.*;
import com.app.utils.MainUtils;
@Controller
@RequestMapping("/article")
public class  ArticleController {
@Resource ArticleService articleService;
@Resource UsersService uService;
@Resource CategoryService cService;
	
@RequestMapping("/article/add")
	public String articleAdd(Model model)
	{		
		model.addAttribute("list",cService.getAllCategory());	
		return "admin/article/add";
	}
@RequestMapping(value="/article/save",method = RequestMethod.POST)
	public String articleSave(String tags,String uid,
String title,String filePath,
String thumb,
String description,
String bodytext,
String created,
String click,
String support,HttpSession session,
Model model)
	{		
	
	System.out.println("Tags:"+tags);
	uid =session.getAttribute("userid")+"";
	
		Article modelX = new Article();		
		modelX.setUid(uid);
modelX.setTitle(title);
modelX.setTags(tags);
modelX.setFilepath(filePath);
modelX.setThumb(thumb);
modelX.setDescription(description);
modelX.setBodytext(bodytext);
modelX.setCreated(MainUtils.getTime());
modelX.setClick("0");
modelX.setSupport("0");
		
		articleService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/article/add";
	}
@RequestMapping("/article/delete")
	public String articleDelete(int id,String ret)
	{
		articleService.delete(id);		
		return "redirect:"+ret;
	}
	
@RequestMapping("/article/list")
	public ModelAndView articleList(HttpSession session)
	{
	List<Article> articleList = articleService.getAllArticle();
	List<Article> articleList1 = new LinkedList<Article>();
	if(articleList.size()>0)
	{
		for (Article a:articleList) {
			int loginUid = Integer.parseInt(""+session.getAttribute("userid"));
			int dbUid = Integer.parseInt(a.getUid());
			
			
		a.setU(uService.getUsersById(dbUid));
		
	
		//
		
		
		articleList1.add(a);
		}
	}
	
	System.out.println(articleList.size());
	ModelAndView mav = new ModelAndView("admin/article/mylist");
	mav.addObject("list",articleList1);
	return mav;
	}

@RequestMapping("/article/mylist")
public ModelAndView mylist(HttpSession session)
{
	List<Article> articleList = articleService.getAllArticle();
	List<Article> articleList1 = new LinkedList<Article>();
	if(articleList.size()>0)
	{
		for (Article a:articleList) {
			int loginUid = Integer.parseInt(""+session.getAttribute("userid"));
			int dbUid = Integer.parseInt(a.getUid());
			
			if(loginUid!=dbUid) continue;
		a.setU(uService.getUsersById(loginUid));
		
	
		//
		
		
		articleList1.add(a);
		}
	}
	
	System.out.println(articleList.size());
	ModelAndView mav = new ModelAndView("admin/article/mylist");
	mav.addObject("list",articleList1);
	return mav;
}


@RequestMapping("/article/edit")
	public String articleEdit(String id,Model model)
	{		
		Article article = articleService.getArticleById(Integer.parseInt(id));
		model.addAttribute("model",article);
		return "admin/article/edit";
	}
@RequestMapping(value="/article/update",method = RequestMethod.POST)
	public String articleUpdate(String uid,
String title,
String thumb,
String description,
String bodytext,
String created,
String click,
String support,
int id,
			Model model)
	{		
		
		Article modelX = articleService.getArticleById(id);		
modelX.setTitle(title);
modelX.setThumb(thumb);
modelX.setDescription(description);
modelX.setBodytext(bodytext);


	
		articleService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/article/edit";
	}
}
