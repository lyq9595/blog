package com.lyq.blog.strategy.context;

import com.lyq.blog.dto.UserInfoDTO;
import com.lyq.blog.enums.LoginTypeEnum;
import com.lyq.blog.strategy.SocialLoginStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;


/**
 * 第三方登录策略上下文
 *

 */
@Service
public class SocialLoginStrategyContext {

    @Autowired
    private Map<String, SocialLoginStrategy> socialLoginStrategyMap;

    /**
     * 执行第三方登录策略
     *
     * @param data          数据
     * @param loginTypeEnum 登录枚举类型
     * @return {@link UserInfoDTO} 用户信息
     */
    public UserInfoDTO executeLoginStrategy(String data, LoginTypeEnum loginTypeEnum) {
        //键值对  map拿到qq登录对应的具体方法（qqLoginStrategyImpl）对应的模式（这里拿到是一个接口，而不是具体实现）
        //再调用对应login的login方法
        /*SocialLoginStrategy socialLoginStrategy = socialLoginStrategyMap.get(loginTypeEnum.getStrategy());
        UserInfoDTO login = socialLoginStrategy.login(data);*/
        return socialLoginStrategyMap.get(loginTypeEnum.getStrategy()).login(data);
    }

}
