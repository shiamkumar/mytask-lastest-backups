package com.tech.processor;

import java.util.HashMap;
import java.util.Map;

import org.springframework.batch.item.ItemProcessor;
import org.springframework.stereotype.Component;

import com.tech.entity.User;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ETLLoadItemProcessor implements ItemProcessor<User, User> {
	
	private static final Map<String ,String> DEPT_NAME_MAP = new HashMap<String, String>();
	
	public ETLLoadItemProcessor() {
		DEPT_NAME_MAP.put("100001", "Technology");
		DEPT_NAME_MAP.put("100002", "Operations");
		DEPT_NAME_MAP.put("100003", "Accounts");
		DEPT_NAME_MAP.put("100004", "Maintance");
	};
	
	@Override
	public User process(User user) throws Exception {
		String deptCode = user.getDepartment();
		String deptName = DEPT_NAME_MAP.get(deptCode);
		user.setDepartment(deptName);
		log.info("Converted from Department_Code to Department_Name");
		return user;
	}
	
}
