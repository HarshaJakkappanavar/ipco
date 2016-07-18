/**
 * 
 */
package com.neu.ipco.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neu.ipco.constants.AppConstants;
import com.neu.ipco.entity.Topic;
import com.neu.ipco.exception.AdminException;
import com.neu.ipco.service.AdminService;

/**
 * @author Harsha
 *
 */
@Controller
public class AdminController {
	
	private Logger LOGGER = Logger.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/manageTutorial.action", method=RequestMethod.POST)
	public String manageTutorialAction(Model model, HttpSession session){
		
		LOGGER.debug("AdminController: manageTutorialAction: Start");
		
		try {
			List<Topic> allTopics = adminService.loadAllTopics();
			
			session.setAttribute("allTopics", allTopics);
			
		} catch (AdminException e) {
			return AppConstants.ERROR_PAGE;
		}
		
		LOGGER.debug("AdminController: manageTutorialAction: End");
		return AppConstants.MANAGE_TUTORIAL;
	}
	
	@RequestMapping(value="/addNewTopic.action", method=RequestMethod.POST)
	public String addNewTopicAction(@RequestParam("topicName") String topicName,
			@RequestParam("topicTypeId") int topicTypeId, Model model, HttpSession session){
		
		LOGGER.debug("AdminController: addNewTopicAction: Start");
		
		List<Topic> allTopics = (List<Topic>) session.getAttribute("allTopics");
		
		Topic newTopic = new Topic(topicName, topicTypeId);
		
		try {
			newTopic = adminService.addNewTopic(newTopic);
			allTopics.add(newTopic);
			
			session.setAttribute("allTopics", allTopics);
			
		} catch (AdminException e) {
			return AppConstants.ERROR_PAGE;
		}
		
		LOGGER.debug("AdminController: addNewTopicAction: End");
		return AppConstants.MANAGE_TUTORIAL;
	}

}
