package com.lyq.blog.service;

import com.lyq.blog.dto.TagBackDTO;
import com.lyq.blog.vo.PageResult;
import com.lyq.blog.dto.TagDTO;
import com.lyq.blog.entity.Tag;
import com.baomidou.mybatisplus.extension.service.IService;
import com.lyq.blog.vo.ConditionVO;
import com.lyq.blog.vo.TagVO;

import java.util.List;

/**
 * 标签服务
 *

 */
public interface TagService extends IService<Tag> {

    /**
     * 查询标签列表
     *
     * @return 标签列表
     */
    PageResult<TagDTO> listTags();

    /**
     * 查询后台标签
     *
     * @param condition 条件
     * @return {@link PageResult<TagBackDTO>} 标签列表
     */
    PageResult<TagBackDTO> listTagBackDTO(ConditionVO condition);

    /**
     * 搜索文章标签
     *
     * @param condition 条件
     * @return {@link List<TagDTO>} 标签列表
     */
    List<TagDTO> listTagsBySearch(ConditionVO condition);

    /**
     * 删除标签
     *
     * @param tagIdList 标签id集合
     */
    void deleteTag(List<Integer> tagIdList);

    /**
     * 保存或更新标签
     *
     * @param tagVO 标签
     */
    void saveOrUpdateTag(TagVO tagVO);

}
