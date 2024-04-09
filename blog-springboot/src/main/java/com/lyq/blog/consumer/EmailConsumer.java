package com.lyq.blog.consumer;

import com.alibaba.fastjson.JSON;
import com.lyq.blog.dto.EmailDTO;

import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;


import java.io.IOException;

import static com.lyq.blog.constant.MQPrefixConst.EMAIL_QUEUE;

/**
 * 通知邮箱
 *
 * @author yezhqiu

 **/
@Component
@RabbitListener(queues = EMAIL_QUEUE)
public class EmailConsumer {

    /**
     * 邮箱号
     */
    @Value("${spring.mail.username}")
    private String email;

    @Autowired
    private JavaMailSender javaMailSender;

    @RabbitHandler
    public void process(byte[] data, Channel channel, Message mqMessage)   {
        try {
        EmailDTO emailDTO = JSON.parseObject(new String(data), EmailDTO.class);
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(email);
        message.setTo(emailDTO.getEmail());
        message.setSubject(emailDTO.getSubject());
        message.setText(emailDTO.getContent());
        javaMailSender.send(message);
        // 采用手动应答模式, 手动确认应答更为安全稳定
        channel.basicAck(mqMessage.getMessageProperties().getDeliveryTag(), false);
        System.out.println("[Email Consumer/ Email_queue]手动确认 邮件消息发送成功");
        } catch (IOException e) {
                System.out.println("消息已重复处理失败,拒绝再次接收！！！！！！！！！！！！");
                // 拒绝消息，requeue=false 表示不再重新入队，如果配置了死信队列则进入死信队
                // requeue为是否重新回到队列，true重新入队
            try {
                channel.basicNack(mqMessage.getMessageProperties().getDeliveryTag(), false, false);
            } catch (IOException ioException) {
                System.out.println("[Email Consumer/ Email_queue] 邮件消息发送失败");
                ioException.printStackTrace();
            }
            e.printStackTrace();
        }

    }

}
