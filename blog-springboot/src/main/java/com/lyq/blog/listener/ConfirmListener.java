package com.lyq.blog.listener;

import org.springframework.amqp.core.ReturnedMessage;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class ConfirmListener implements RabbitTemplate.ConfirmCallback,RabbitTemplate.ReturnsCallback {
    @Autowired
    private RabbitTemplate rabbitTemplate;
    @PostConstruct
    void init(){
        rabbitTemplate.setConfirmCallback(this);
        rabbitTemplate.setReturnsCallback(this);
    }
    //消息发送到路由 true表明发送到路由 flase表明失败
    @Override
    public void confirm(CorrelationData correlationData, boolean b, String s) {
        System.out.println("到交换机成功"+b);
        System.out.println("***************************************************************"+s);
        System.out.println("******************************************************"+correlationData);
    }

    @Override
    public void returnedMessage(ReturnedMessage returnedMessage) {
        System.out.println("*********************************************投递到队列失败 returnedMessage"+returnedMessage.toString());
    }
}
