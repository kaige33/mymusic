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
import com.app.utils.MD5;
import com.app.utils.MainUtils;

@Controller
@RequestMapping("/users")
public class UsersController {
	@Resource
	UsersService usersService;



	@RequestMapping("/users/add")
	public String usersAdd(Model model) {

		
		return "admin/users/add";
	}

	@RequestMapping(value = "/users/save", method = RequestMethod.POST)
	public String usersSave(String username, String password, String sex,
			String birthday, String address, String email, String qq,
			String tel, String money, String thumb, String grade, String type,
			String created, String updated, String status, String age,
			String ecard, String fromid, String fromname, String company,
			String realname,
			String position, String signature, Model model) {
		Users modelX = new Users();
		modelX.setUsername(username);
		modelX.setPassword(MD5.MD51(password));
		modelX.setSex(sex);
		modelX.setBirthday(birthday);
		modelX.setAddress(address);
		modelX.setEmail(email);
		modelX.setQq(qq);
		modelX.setTel(tel);
		modelX.setMoney(money);
		modelX.setThumb(thumb);
		modelX.setGrade(grade);
		modelX.setType(type);
		modelX.setCreated(MainUtils.getTime());
		modelX.setAge(age);
		modelX.setEcard(ecard);
		modelX.setFromid(fromid);
		modelX.setFromname(fromname);
		modelX.setCompany(company);
		modelX.setRealname(realname);
		modelX.setPosition(position);
		modelX.setSignature(signature);
		modelX.setCollegeid(1);
		modelX.setMajorid(1);
		modelX.setClassid(1);
		modelX.setMoney("100.00");
		int id = usersService.insert(modelX);

		
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/users/add";
	}

	@RequestMapping("/users/delete")
	public String usersDelete(int id) {
		usersService.delete(id);
		return "redirect:list";
	}

	@RequestMapping("/users/profile")
	public String userprofile(String id, HttpSession session, Model model) {
		int userId;
		if (id == null) {
			userId = Integer.parseInt(session.getAttribute("userid") + "");
		} else {
			userId = Integer.parseInt(id);
		}

		Users user = usersService.getUsersById(userId);
		model.addAttribute("user", user);
		return "admin/users/profile";
	}

	@RequestMapping("/users/password")
	public String userpassword(String id, HttpSession session, Model model) {
		int userId;
		if (id == null) {
			userId = Integer.parseInt(session.getAttribute("userid") + "");
		} else {
			userId = Integer.parseInt(id);
		}

		Users user = usersService.getUsersById(userId);
		model.addAttribute("user", user);
		return "admin/users/password";
	}

	@RequestMapping(value = "/users/update", method = RequestMethod.POST)
	public String usersUpdate(String id, String username, String password,
			String sex, String birthday, String address, String email,
			String qq, String tel, String money, String thumb, String grade,
			String type, String created, String updated, String status,
			String realname, String age, String ecard,String position,

			Model model) {

		Users modelX = usersService.getUsersById(Integer.parseInt(id));
		modelX.setUsername(username);
		modelX.setAddress(address);
		modelX.setEmail(email);
		modelX.setQq(qq);
		modelX.setTel(tel);
		modelX.setThumb(thumb);
		modelX.setEcard(ecard);
		modelX.setAge(age);
		modelX.setRealname(realname);
		modelX.setSex(sex);
		modelX.setPosition(position);
		usersService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success");
		model.addAttribute("user", modelX);
		return "admin/users/profile";
	}

	@RequestMapping(value = "/users/updatepassword", method = RequestMethod.POST)
	public ModelAndView updatepassword(int id, String password, Model model) {
		Users user = usersService.getUsersById(id);
		user.setPassword(MD5.MD51(password));
		usersService.update(user);
		model.addAttribute("user", user);
		ModelAndView mav = new ModelAndView("admin/users/password");
		mav.addObject("message", "?????????");

		return mav;
		// return "redirect:profile?id="+id;
	}

	@RequestMapping("/users/list")
	public ModelAndView usersList() {
		List<Users> usersList = usersService.getAllUsers();
		List<Users> usersList1 = new LinkedList<Users>();

		if (usersList.size() > 0) {
			for (Users users : usersList) {				
				usersList1.add(users);
			}
		}

		System.out.println(usersList.size());
		ModelAndView mav = new ModelAndView("admin/users/list");
		mav.addObject("list", usersList1);
		return mav;
	}

	@RequestMapping("/users/edit")
	public String usersEdit(String id, Model model) {
		Users users = usersService.getUsersById(Integer.parseInt(id));
		model.addAttribute("model", users);
		return "admin/users/edit";
	}

}
