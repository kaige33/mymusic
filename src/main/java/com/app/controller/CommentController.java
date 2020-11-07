package com.app.controller;
import java.io.File;
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
@Controller
@RequestMapping("/comment")
public class  CommentController {
@Resource CommentService commentService;
	
@RequestMapping("/comment/add")
	public String commentAdd()
	{		
		return "admin/comment/add";
	}
@RequestMapping(value="/comment/save",method = RequestMethod.POST)
	public String commentSave(String uid,
String mid,
String content,
String type,
String created,
String updated,
String status,
String subject,
String pid,
Model model)
	{		
		Comment modelX = new Comment();		
		modelX.setUid(uid);
modelX.setMid(mid);
modelX.setContent(content);
modelX.setType(type);
modelX.setCreated(created);
modelX.setUpdated(updated);
modelX.setStatus(status);
modelX.setSubject(subject);
modelX.setPid(pid);
		
		commentService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/comment/add";
	}
@RequestMapping("/comment/delete")
	public String commentDelete(int id)
	{
		commentService.delete(id);		
		return "redirect:list";
	}
	
@RequestMapping("/comment/list")
	public ModelAndView commentList()
	{
		List<Comment> commentList = commentService.getAllComment();
		System.out.println(commentList.size());
		ModelAndView mav = new ModelAndView("admin/comment/list");
		mav.addObject("list",commentList);
		return mav;
	}
@RequestMapping("/comment/edit")
	public String commentEdit(String id,Model model)
	{		
		Comment comment = commentService.getCommentById(Integer.parseInt(id));
		model.addAttribute("model",comment);
		return "admin/comment/edit";
	}
@RequestMapping(value="/comment/update",method = RequestMethod.POST)
	public String commentUpdate(String uid,
String mid,
String content,
String type,
String created,
String updated,
String status,
String subject,
String pid,
int id,
			Model model)
	{		
		
		Comment modelX = commentService.getCommentById(id);		
		modelX.setUid(uid);
modelX.setMid(mid);
modelX.setContent(content);
modelX.setType(type);
modelX.setCreated(created);
modelX.setUpdated(updated);
modelX.setStatus(status);
modelX.setSubject(subject);
modelX.setPid(pid);
	
		commentService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/comment/edit";
	}
}
