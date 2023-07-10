package com.tech.writer;

import java.util.List;

import org.springframework.batch.item.ItemWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tech.entity.User;
import com.tech.repository.UserRepository;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ETLLoadDatabaseItemWriter implements ItemWriter<User>{

	@Autowired
	private UserRepository userRepository;
	@Override
	public void write(List<? extends User> users) throws Exception {
		log.info("Data saved for users:: " + users);
		userRepository.saveAll(users);
	}

}
