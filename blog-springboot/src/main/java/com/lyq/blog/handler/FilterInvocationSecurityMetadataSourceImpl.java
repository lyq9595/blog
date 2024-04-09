package com.lyq.blog.handler;

import com.lyq.blog.dao.RoleDao;
import com.lyq.blog.dto.ResourceRoleDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.CollectionUtils;

import javax.annotation.PostConstruct;
import java.util.Collection;
import java.util.List;

/**

 */
@Component
public class FilterInvocationSecurityMetadataSourceImpl implements FilterInvocationSecurityMetadataSource {

    /**
     * 资源角色列表 下面有对应的加载方法
     */
    private static List<ResourceRoleDTO> resourceRoleList;

    @Autowired
    private RoleDao roleDao;

    /**
     * 加载资源角色信息
     */
    @PostConstruct
    private void loadDataSource() {
        resourceRoleList = roleDao.listResourceRoles();
    }

    /**
     * 清空接口角色信息
     */
    public void clearDataSource() {
        resourceRoleList = null;
    }

    /**
     * 根据请求的资源到资源表去找合适的角色
     * @param object 是FilterInvocation对象，可以获取当前请求的Url
     * @return
     * @throws IllegalArgumentException
     */
    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        // 修改接口角色关系后重新加载
        if (CollectionUtils.isEmpty(resourceRoleList)) {
            this.loadDataSource();//获取数据库中的所有资源信息
        }
        FilterInvocation fi = (FilterInvocation) object;
        // 获取用户请求方式
        String method = fi.getRequest().getMethod();
        // 获取用户请求Url
        String url = fi.getRequest().getRequestURI();
        AntPathMatcher antPathMatcher = new AntPathMatcher();
        // 获取接口角色信息，若为匿名接口则放行，若无对应角色则禁止
        // 如果请求Url在资源表中存在相应的模式，获取请求Url所需要的角色并返回
        for (ResourceRoleDTO resourceRoleDTO : resourceRoleList) {
            if (antPathMatcher.match(resourceRoleDTO.getUrl(), url) && resourceRoleDTO.getRequestMethod().equals(method)) {
                List<String> roleList = resourceRoleDTO.getRoleList();//如果匹配上了 找有当前资源的角色有哪些
                if (CollectionUtils.isEmpty(roleList)) {
                    return SecurityConfig.createList("disable");
                }
                //返回给过滤器createList的返回值是这个List<ConfigAttribute> 角色名 返回所需角色
                return SecurityConfig.createList(roleList.toArray(new String[]{}));
            }
        }
        return null;
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    /**
     * 返回类对象是否支持校验
     * @param aClass
     * @return
     */
    @Override
    public boolean supports(Class<?> aClass) {
        return FilterInvocation.class.isAssignableFrom(aClass);
    }

}
