package com.tech.reader;

import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.LineMapper;
import org.springframework.batch.item.file.mapping.BeanWrapperFieldSetMapper;
import org.springframework.batch.item.file.mapping.DefaultLineMapper;
import org.springframework.batch.item.file.transform.DelimitedLineTokenizer;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import com.tech.entity.User;

@Component
public class ETLLoadItemReader extends FlatFileItemReader<User> implements ItemReader<User> {

	public ETLLoadItemReader() {
		setResource(new ClassPathResource("/import/users.csv"));
		setLineMapper(getLineMapper());
		setLinesToSkip(1);
	}
	
	private LineMapper<User> getLineMapper() {
//		DefaultLineMapper<User> lineMapper = new DefaultLineMapper<User>();
//		DelimitedLineTokenizer tokenizer = new DelimitedLineTokenizer();
//		String[] columnsToBeInserted = new String[] { "id", "name", "department", "salary" };
//		int[] fields = new int[] { 0, 1, 2, 3 };
//		tokenizer.setNames(columnsToBeInserted);
//		tokenizer.setIncludedFields(fields);
//		BeanWrapperFieldSetMapper<User> fieldSetMapper = new BeanWrapperFieldSetMapper<User>();
//		fieldSetMapper.setTargetType(User.class);
//		lineMapper.setLineTokenizer(tokenizer);
//		lineMapper.setFieldSetMapper(fieldSetMapper);
		
		DefaultLineMapper<User> lineMapper = new DefaultLineMapper<User>();
		DelimitedLineTokenizer tokenizer = new DelimitedLineTokenizer();
		
		tokenizer.setNames(new String[] {"id", "name", "department", "salary"});
		BeanWrapperFieldSetMapper<User> fieldSetMapper = new BeanWrapperFieldSetMapper<User>();
		fieldSetMapper.setTargetType(User.class);
		
		lineMapper.setLineTokenizer(tokenizer);
		lineMapper.setFieldSetMapper(fieldSetMapper);
		return lineMapper;
	}

}
