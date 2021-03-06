package com.pk.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pk.model.Owner;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author pk
 * @since 2021-11-08
 */
@Component("ownerDao")
public interface OwnerMapper extends BaseMapper<Owner> {

    //查询
    List<Owner> queryOwnerAll(Owner owner);

    /**
     * 通过username查询owner
     */
    Owner queryOwnerByName(@Param("username") String username);

    Owner queryOwnerByIdCard(@Param("identity") String identity);

    void deleteOwnerUserByUserName(@Param("username2") String username);

    Owner queryOwnerById(@Param("id") long parseLong);
}
