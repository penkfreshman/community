package com.pk.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pk.model.House;
import org.apache.ibatis.annotations.Param;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("houseDao")
public interface HouseMapper extends BaseMapper<House> {

    /**
     * 查询
     */


    List<House> findHouseAll( @Param("numbers") String numbers);

    List<House> findHouse( );

    /**
     * 通过owner中house_id查找house
     */
    House queryHouseById(@Param("houId") Integer houId);
}
