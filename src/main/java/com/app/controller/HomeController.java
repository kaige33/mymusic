package com.app.controller;

import java.io.File;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
//import javax.xml.registry.infomodel.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.app.entity.*;
import com.app.service.*;
import com.app.utils.MD5;
import com.app.utils.MainUtils;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Resource
	UsersService userService;

	@Resource
	CategoryService caService;
	
	@Resource
	ArticleService articleService;
	
	@Resource CommentService cService;
	
	@RequestMapping("/index")
	public String index(HttpSession session,Model model) {		

		model.addAttribute("clist",caService.getAllCategory());
		model.addAttribute("list",articleService.getAllArticle());
		
		
		return "home/index";
	}
	
	@RequestMapping("/addpost")
	public String addpost(String content,HttpSession session,Model model,int id) {
		Comment m = new Comment();
		m.uid = session.getAttribute("userid")+"";
		m.mid = id+"";
		m.content = content;
		m.setCreated(MainUtils.getTime());
		m.setType("2");
		cService.insert(m);
		return "redirect:play?id="+id;
	}
	
	
	@Resource FavService fService;
	
	@RequestMapping("/cancelFav")
	public String cancelFav(HttpSession session,Model model,int id) {
		fService.delete(id);		
		return "redirect:play?id="+id;
	}
	
	@RequestMapping("/join")
	public String join(HttpSession session,Model model) {
		model.addAttribute("clist",caService.getAllCategory());	
		return "home/join";
	}
	
	@RequestMapping("/addFav")
	public String addFav(HttpSession session,Model model,int id) {
		Object uid =session.getAttribute("userid");
		
		Fav md = new Fav();
		md.created = MainUtils.getTime();
		md.mid = id+"";
		md.uid = uid.toString();
		
		fService.insert(md);
		
		return "redirect:play?id="+id;
	}
	
	@RequestMapping("/play")
	public String play(HttpSession session,Model model,int id) {
		model.addAttribute("clist",caService.getAllCategory());
		
		Article art = articleService.getArticleById(id);
		model.addAttribute("art", art);
		
		List<Comment> list2 = cService.getAllComment();
		List<Comment> list1 = new LinkedList<Comment>();
		if(list2.size()>0)
		{
			for (Comment c:list2) {
				if(c.getMid().equals(id+"")&&c.getType().equals("2"))
				{
					c.setU( userService.getUsersById(Integer.parseInt(c.getUid())));
					list1.add(c);
				}
			}
		}
		model.addAttribute("list2", list1);
		Object uid =session.getAttribute("userid");
		Fav check = null;
		if(uid==null){}else{
			Fav checkIt = new Fav();
			checkIt.mid =id+"";
			checkIt.uid = uid.toString();
			List<Fav> lists = fService.checkFav(checkIt);
			if(lists.size()>0)
			check = lists.get(0);
		}
		
		model.addAttribute("check", check);
		return "home/play";
	}
	
	@RequestMapping("/foryou")
	public String foryou(HttpSession session,Model model,String type) {		

		model.addAttribute("clist",caService.getAllCategory());
		
		model.addAttribute("lists",articleService.getRandom());
		
		return "home/foryou";
	}
	
	@RequestMapping("/mlist")
	public String mlist(HttpSession session,Model model,String type) {		

		model.addAttribute("clist",caService.getAllCategory());
		
		List<Article> list1 =  articleService.getAllArticle();
		List<Article> list2 =  new LinkedList<Article>();
		if(list1.size()>0)
		{
			for (Article article : list1) {
				if(type!=null)
				{
					if(article.getTags().equals(type))
					{
						list2.add(article);
					}
				}else{
					list2.add(article);
				}
			}
		}
				
		
		model.addAttribute("list",list2);
		
		
		return "home/mlist";
	}
	
	
	
	
}
