package com.tech.config;


import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.support.RunIdIncrementer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.tech.entity.User;
import com.tech.processor.ETLLoadItemProcessor;
import com.tech.reader.ETLLoadItemReader;
import com.tech.writer.ETLLoadDatabaseItemWriter;

@Configuration
public class BatchConfig {

	@Autowired
	private JobBuilderFactory jobBuilderFactory;

	@Autowired
	private StepBuilderFactory stepBuilderFactory;
	
	@Autowired
	private ETLLoadItemReader etlLoadItemReader;
	
	//@Autowired
	//private ETLLoadItemWriter etlLoadItemWriter;
	
	@Autowired
	private ETLLoadDatabaseItemWriter etlLoadDatabaseItemWriter;

	@Bean
	public Job etlLoadJob() {
		return jobBuilderFactory.get("ETL-Load-Job").
				incrementer(new RunIdIncrementer())
				.start(etlLoadStep())
				.build();
	}

	private Step etlLoadStep() {
		return stepBuilderFactory.get("ETL-Load-Step")
				.<User, User>chunk(100)
				.reader(etlLoadItemReader)
				//.processor(processor())
				.writer(etlLoadDatabaseItemWriter)
				.build();
	}
    
    @Bean
    public ETLLoadItemProcessor processor() {
        return new ETLLoadItemProcessor();
    }
    
}
