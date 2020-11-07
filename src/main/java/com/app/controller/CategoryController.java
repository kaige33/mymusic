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
import com.app.utils.MainUtils;
@Controller
@RequestMapping("/category")
public class  CategoryController {
@Resource CategoryService categoryService;
	
@RequestMapping("/category/add")
	public String categoryAdd()
	{		
		return "admin/category/add";
	}
@RequestMapping(value="/category/save",method = RequestMethod.POST)
public String categorySave(String title,
String created,
Model model)
	{		
		Category modelX = new Category();		
		modelX.setTitle(title);
modelX.setCreated(MainUtils.getTime());
		
		categoryService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/category/add";
	}
	
@RequestMapping("/category/delete")
	public String categoryDelete(int id)
	{
		categoryService.delete(id);		
		return "redirect:list";
	}
	
@RequestMapping("/category/list")
	public ModelAndView categoryList()
	{
		List<Category> categoryList = categoryService.getAllCategory();
		System.out.println(categoryList.size());
		ModelAndView mav = new ModelAndView("admin/category/list");
		mav.addObject("list",categoryList);
		return mav;
	}
@RequestMapping("/category/edit")
	public String categoryEdit(String id,Model model)
	{		
		Category category = categoryService.getCategoryById(Integer.parseInt(id));
		model.addAttribute("model",category);
		return "admin/category/edit";
	}
@RequestMapping(value="/category/update",method = RequestMethod.POST)
	public String categoryUpdate(String title,
String created,
int id,
			Model model)
	{		
		
		Category modelX = categoryService.getCategoryById(id);		
		modelX.setTitle(title);
	
		categoryService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/category/edit";
	}
}
