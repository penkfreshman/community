package com.pk.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pk.model.Userinfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author pk
 * @since 2021-10-28
 */
@Component("userinfoDao")
public interface UserinfoMapper extends BaseMapper<Userinfo> {

    List<Userinfo> queryUserinfoAll(Userinfo userinfo);

    Userinfo queryUserByNameAndPwd(Userinfo userinfo);

    void deleteUserByUsername(@Param("username2") String username);
}
