package com.lyq.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lyq.blog.entity.ChatRecord;
import org.springframework.stereotype.Repository;

/**
 * 聊天记录
 *

 */
@Repository
public interface ChatRecordDao extends BaseMapper<ChatRecord> {
}
