package com.auction.config;

import com.auction.core.schedule.ScheduledTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

import java.time.LocalDateTime;

@EnableScheduling
@Configuration
public class SchedulerConfig implements SchedulingConfigurer {

private ScheduledTask scheduledTask;

@Autowired
    public SchedulerConfig(ScheduledTask scheduledTask) {
        this.scheduledTask = scheduledTask;
    }

    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
        final LocalDateTime dateChange = LocalDateTime.now().plusSeconds(20);
        taskRegistrar.addFixedRateTask(new Runnable() {
            @Override
            public void run() {
                if(LocalDateTime.now().isAfter(dateChange)) {
                    scheduledTask.scheduleCheckAuctionsEnds();
                }
            }
        }, 1000);
    }
}
