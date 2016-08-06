/**
 * 
 */
package com.neu.ipco.service;

import java.util.List;

import com.neu.ipco.entity.ActivityOption;
import com.neu.ipco.entity.InstanceType;
import com.neu.ipco.entity.Module;
import com.neu.ipco.entity.Topic;
import com.neu.ipco.entity.UserRole;
import com.neu.ipco.entity.UserType;
import com.neu.ipco.exception.ApplicationUtilException;

/**
 * @author Harsha
 *
 */
public interface ApplicationUtilService {
	
	public UserType getUserType(UserType userType) throws ApplicationUtilException;
	
	public UserType addUserType(UserType userType) throws ApplicationUtilException;

	public InstanceType getInstanceTypeByDesc(String instanceTypeBasic) throws ApplicationUtilException;

	public void updateNewTopicToBasicInstances(Topic newTopic) throws ApplicationUtilException;

	public void updateNewModuleToInstanceTopics(Module module) throws ApplicationUtilException;

	public void updateNewActivityToInstanceModule(ActivityOption activityOption) throws ApplicationUtilException;

	public List<UserRole> getUserRoles() throws ApplicationUtilException;

}
