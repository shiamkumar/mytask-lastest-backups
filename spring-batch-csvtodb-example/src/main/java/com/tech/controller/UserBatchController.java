package com.tech.controller;

import org.springframework.batch.core.BatchStatus;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping(path = "/batch")
@Slf4j
public class UserBatchController {

	@Autowired
	private JobLauncher jobLauncher;

	@Autowired
	private Job job;

	@GetMapping(path = "/start") // Start batch process path
	public BatchStatus startBatch() throws JobExecutionAlreadyRunningException, JobRestartException,
			JobInstanceAlreadyCompleteException, JobParametersInvalidException { // ResponseEntity<String>
		
		JobParameters Parameters = new JobParametersBuilder().addLong("startAt", System.currentTimeMillis()).toJobParameters();
		JobExecution jobExecution = jobLauncher.run(job, Parameters);
		log.info("JobExecution:: " + jobExecution.getStatus());
		while (jobExecution.isRunning()) {
			log.info("ETL-Load Batch is running, Wait for sometimes......");
		}
		return jobExecution.getStatus();
	}

}
