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
@RequestMapping("/manage")
public class ManageController {
	
	@Resource
	UsersService userService;


	
	@Resource
	ArticleService articleService;
	
	@Resource CommentService cService;
	
	@RequestMapping("/index")
	public String index(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:login";
		}

		return "admin/index";
	}
	
	
	
	


	@RequestMapping("/main")
	public String main(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:login";
		}

		return "admin/main";
	}

	@RequestMapping("/login")
	public String login() {
		return "admin/login";
	}
	
	@RequestMapping("/findPwd")
	public String findPwd() {
		return "admin/findPwd";
	}

	@RequestMapping("/reg")
	public String regedit() {
		return "home/reg";
	}

	@RequestMapping("/quit")
	public String quit(String retUrl, HttpSession session) {
		session.invalidate();
		return "redirect:" + retUrl;
	}

	@RequestMapping(value = "/dologin", method = RequestMethod.POST)
	public String signin(@RequestParam("username") String username,
			@RequestParam("password") String password, Model model,
			HttpSession session) {
		System.out.println(username);
		System.out.println(password);
		Users user = userService.userLogin(username, MD5.MD51(password));

		model.addAttribute("inlogin", true);
		if (user != null) {

			model.addAttribute("user", user);

			session.setAttribute("user", user);
			session.setAttribute("userid", user.getId());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("usertype", user.getType());

			Users us = userService.getUsersById(Integer.parseInt(session
					.getAttribute("userid") + ""));
			float oldMoney = Float.parseFloat(us.getMoney());
			us.setMoney((oldMoney + MainUtils.LOGINVAL) + "");
			userService.update(us);
		}
		return "admin/login";
	}
	
	
	
	@RequestMapping(value = "/findPwdForm", method = RequestMethod.POST)
	public String signin(@RequestParam("email") String email,Model model,
			HttpSession session) {
	
		List<Users> list = userService.getAllUsers();
		Users getUser = new Users();
		boolean exist = false;
		if(list.size()>0)
		{
			for (Users user : list) {
				if(user.getEmail().equals(email))
					{
					getUser = user;
					exist=true;break;
					
					}
			}
		}

		model.addAttribute("inlogin", true);
		if (exist) {	
			getUser.setPassword(MD5.MD51("123456"));
			userService.update(getUser);
			model.addAttribute("state", 1);
			model.addAttribute("message", "????????????????123456???????????");
		}else{
			model.addAttribute("state", 2);
			model.addAttribute("message", "??????????????????????????");
		}
		return "admin/findPwd";
	}

	@RequestMapping(value = "/doreg", method = RequestMethod.POST)
	public String doreg(@RequestParam("username") String username,
			@RequestParam("password") String password,
			String realname,
			String email,
			String tel,
			String qq,
			String address,
			String thumb,
			String age,
			Model model,
			HttpSession session) {
		System.out.println(username);
		System.out.println(MD5.MD51(password));
		Users user = new Users();
		user.setEcard(MainUtils.getEcard());
		user.setMoney("100.00");
		user.setType(1 + "");
		user.setUsername(username);
		user.setPassword(MD5.MD51(password));
		user.setRealname(realname);
		user.setEmail(email);
		user.setTel(tel);
		user.setAddress(address);
		user.setThumb(thumb);
		user.setQq(qq);
		user.setAge(age);
		
		user.setCreated(MainUtils.getTime());
		userService.insert(user);
		model.addAttribute("state", 1);
		return "redirect:login";
	}
}
