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
@RequestMapping("/fav")
public class  FavController {
@Resource FavService favService;
	
@RequestMapping("/fav/add")
	public String favAdd()
	{		
		return "admin/fav/add";
	}
@RequestMapping(value="/fav/save",method = RequestMethod.POST)
	public String favSave(String mid,
String uid,
String created,
Model model)
	{		
		Fav modelX = new Fav();		
		modelX.setMid(mid);
modelX.setUid(uid);
modelX.setCreated(created);
		
		favService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/fav/add";
	}
@RequestMapping("/fav/delete")
	public String favDelete(int id)
	{
		favService.delete(id);		
		return "redirect:list";
	}
	
@RequestMapping("/fav/list")
	public ModelAndView favList()
	{
		List<Fav> favList = favService.getAllFav();
		System.out.println(favList.size());
		ModelAndView mav = new ModelAndView("admin/fav/list");
		mav.addObject("list",favList);
		return mav;
	}
@RequestMapping("/fav/edit")
	public String favEdit(String id,Model model)
	{		
		Fav fav = favService.getFavById(Integer.parseInt(id));
		model.addAttribute("model",fav);
		return "admin/fav/edit";
	}
@RequestMapping(value="/fav/update",method = RequestMethod.POST)
	public String favUpdate(String mid,
String uid,
String created,
int id,
			Model model)
	{		
		
		Fav modelX = favService.getFavById(id);		
		modelX.setMid(mid);
modelX.setUid(uid);
modelX.setCreated(created);
	
		favService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/fav/edit";
	}
}
