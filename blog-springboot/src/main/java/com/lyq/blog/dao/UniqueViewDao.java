package com.lyq.blog.dao;

import com.lyq.blog.dto.UniqueViewDTO;
import com.lyq.blog.entity.UniqueView;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * 访问量
 *

 */
@Repository
public interface UniqueViewDao extends BaseMapper<UniqueView> {

    /**
     * 获取7天用户量
     *
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @return 用户量
     */
    List<UniqueViewDTO> listUniqueViews(@Param("startTime") Date startTime, @Param("endTime") Date endTime);

}
