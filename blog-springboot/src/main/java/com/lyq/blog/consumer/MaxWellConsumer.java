package com.lyq.blog.consumer;

import com.alibaba.fastjson.JSON;
import com.lyq.blog.dao.ElasticsearchDao;
import com.lyq.blog.dto.ArticleSearchDTO;
import com.lyq.blog.dto.MaxwellDataDTO;
import com.lyq.blog.entity.Article;
import com.lyq.blog.util.BeanCopyUtils;
import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import java.io.IOException;

import static com.lyq.blog.constant.MQPrefixConst.MAXWELL_QUEUE;

/**
 * maxwell监听数据
 *

 */
@Component
@RabbitListener(queues = MAXWELL_QUEUE)
public class MaxWellConsumer {
    @Autowired
    private ElasticsearchDao elasticsearchDao;

    @RabbitHandler
    public void process(byte[] data, Channel channel, Message mqMessage) {
        try {
            // 获取监听信息
            MaxwellDataDTO maxwellDataDTO = JSON.parseObject(new String(data), MaxwellDataDTO.class);
            // 获取文章数据
            Article article = JSON.parseObject(JSON.toJSONString(maxwellDataDTO.getData()), Article.class);
            // 判断操作类型
            switch (maxwellDataDTO.getType()) {
                case "insert":
                case "update":
                    // 更新es文章
                    elasticsearchDao.save(BeanCopyUtils.copyObject(article, ArticleSearchDTO.class));
                    break;
                case "delete":
                    // 删除文章
                    elasticsearchDao.deleteById(article.getId());
                    break;
                default:
                    break;
            }
            // 采用手动应答模式, 手动确认应答更为安全稳定
            channel.basicAck(mqMessage.getMessageProperties().getDeliveryTag(), false);
            System.out.println("[maxwell Consumer / MaxWell_queue]手动确认 文章"+maxwellDataDTO.getType()+"成功");
        }catch (IOException e) {
            //丢弃这条消息
            //channel.basicNack(message.getMessageProperties().getDeliveryTag(), false,false);
            //ack返回false，并重新回到队列
            //channel.basicNack(message.getMessageProperties().getDeliveryTag(), false, true);
            System.out.println("[maxwell Consumer / MaxWell_queue ]手动确认失败！！！！！！！！！！！！！！！！");
        }

    }

}
