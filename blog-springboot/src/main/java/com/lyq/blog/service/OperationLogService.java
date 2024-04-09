package com.lyq.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lyq.blog.dto.OperationLogDTO;
import com.lyq.blog.vo.PageResult;
import com.lyq.blog.entity.OperationLog;
import com.lyq.blog.vo.ConditionVO;

/**
 * 操作日志服务
 *

 */
public interface OperationLogService extends IService<OperationLog> {

    /**
     * 查询日志列表
     *
     * @param conditionVO 条件
     * @return 日志列表
     */
    PageResult<OperationLogDTO> listOperationLogs(ConditionVO conditionVO);

}
