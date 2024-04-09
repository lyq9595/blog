package com.lyq.blog.service;

import com.lyq.blog.dto.UniqueViewDTO;
import com.lyq.blog.entity.UniqueView;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 用户量统计
 *

 */
public interface UniqueViewService extends IService<UniqueView> {

    /**
     * 获取7天用户量统计
     *
     * @return 用户量
     */
    List<UniqueViewDTO> listUniqueViews();

}
