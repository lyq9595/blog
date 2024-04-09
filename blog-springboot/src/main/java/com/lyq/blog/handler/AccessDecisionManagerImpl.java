package com.lyq.blog.handler;

import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 访问决策管理器
 *
 */
@Component
public class AccessDecisionManagerImpl implements AccessDecisionManager {

    /**
     * 查看当前用户是否具备此权限，如果没有直接返回登陆页面
     * @param authentication
     * @param o
     * @param needCollection
     * @throws AccessDeniedException
     * @throws InsufficientAuthenticationException
     */
    @Override
    public void decide(Authentication authentication, Object o, Collection<ConfigAttribute> needCollection) throws AccessDeniedException, InsufficientAuthenticationException {
        // 获取用户权限列表
        List<String> permissionList = authentication.getAuthorities()
                .stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toList());
        //看用户所拥有的权限有没有包含 访问资源所需要的角色权限  item.getAttribute()具体资源权限
        for (ConfigAttribute item : needCollection) {
            if (permissionList.contains(item.getAttribute())) {
                return;
            }
        }
//        System.out.println("权限不足，这里需要抛错，Security不继续处理");
        throw new AccessDeniedException("没有操作权限");
    }

    @Override
    public boolean supports(ConfigAttribute configAttribute) {
        return true;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}
