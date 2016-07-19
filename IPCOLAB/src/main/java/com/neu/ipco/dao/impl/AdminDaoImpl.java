/**
 * 
 */
package com.neu.ipco.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.neu.ipco.dao.AdminDao;
import com.neu.ipco.entity.Module;
import com.neu.ipco.entity.Topic;
import com.neu.ipco.exception.AdminException;

/**
 * @author Harsha
 *
 */
@Repository("adminDao")
@Transactional
public class AdminDaoImpl implements AdminDao {
	
	private Logger LOGGER = Logger.getLogger(AdminDaoImpl.class);
	
	@Autowired
	private HibernateTemplate template;

	/* (non-Javadoc)
	 * @see com.neu.ipco.dao.AdminDao#loadAllTopics()
	 */
	public List<Topic> loadAllTopics() throws AdminException {
		
		LOGGER.debug("AdminDaoImpl: loadAllTopics: Executing");
		return template.loadAll(Topic.class);
	}

	public Topic addNewTopic(Topic newTopic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: addNewTopic: Start");
		int topicId = (Integer) template.save(newTopic);
		LOGGER.debug("AdminDaoImpl: addNewTopic: Executing");
		return template.get(Topic.class, topicId);
	}

	public Topic getTopicById(int topicId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getTopicById: Executing");
		return template.get(Topic.class, topicId);
	}

	public void updateTopic(Topic topic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: updateTopic: Executing");
		template.update(topic);
	}

	public void deleteTopic(Topic topic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteTopic: Executing");
		template.delete(topic);
	}

	public Module addNewModule(Module module) throws AdminException {
		LOGGER.debug("AdminDaoImpl: addNewModule: Start");
		int moduleId = (Integer) template.save(module);
		LOGGER.debug("AdminDaoImpl: addNewModule: Executing");
		return template.get(Module.class, moduleId);
	}

	public Module getModuleById(int moduleId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getModuleById: Executing");
		return template.get(Module.class, moduleId);
	}

	public void updateModule(Module module) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getModuleById: Executing");
		template.update(module);
	}

	public void deleteModule(Module module) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteModule: Executing");
		template.delete(module);
	}

}