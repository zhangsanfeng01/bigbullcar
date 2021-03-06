package com.bigbullcar.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.bigbullcar.entity.Message;
import com.bigbullcar.entity.User;
import com.bigbullcar.service.MessageService;
import com.bigbullcar.service.UserService;


/**
 * 使用注解@Controller  保存用户留言
 * @author lyj  11.9
 *
 */

@Controller
@RequestMapping("message")
public class MessageController {
	
	// 封装由dao实现最终返回的用户集合对象2016-11-9
	private List<Message> messageList = new ArrayList<Message>();
	// 使用spring注解方式：注入一个用户服务接口，该用户服务类
	@Resource
	private MessageService messageService;
	
	@Resource
	private UserService userService;
		
	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}


	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@RequestMapping(value="/insert", method = RequestMethod.POST)
    public ModelAndView inserMessage(String userName,String textarea,HttpSession session,Model model){
		//重新获取session里的userName 通过getUser得到user 再封装到Model
		session.getAttribute("userName");
		User user = new User();
		user.setUserName((String )session.getAttribute("userName"));
		User user2 = userService.getUser(user);
		model.addAttribute("customeruser", user2);
		
		//日期格式转换
		Date date = new Date();
		//SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String dateString = formatter.format(date);		
		System.err.println(userName);
		System.err.println(textarea);
		if(textarea.equals("咨询内容") || textarea.equals(null)){		
			return new ModelAndView("CustomerCarezbz");
		}	
			Message message = new Message();
			message.setUsername(userName);
			message.setMestime(date);
			message.setMescontent(textarea);
			int num =messageService.insertMessage(message);
			if(num == 1){
				return new ModelAndView("redirect:../index.jsp");
			}
		return new ModelAndView("CustomerCarezbz.jsp");		
	}
}
