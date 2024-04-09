package com.lyq.blog.service.impl;

import com.lyq.blog.entity.ArticleTag;
import com.lyq.blog.dao.ArticleTagDao;
import com.lyq.blog.service.ArticleTagService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 文章标签服务
 *

 */
@Service
public class ArticleTagServiceImpl extends ServiceImpl<ArticleTagDao, ArticleTag> implements ArticleTagService {

}
