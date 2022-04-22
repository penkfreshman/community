package com.pk.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pk.model.Parking;
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
@Component("parkingDao")
public interface ParkingMapper extends BaseMapper<Parking> {

     //分页查询车位信息
     List<Parking> queryParkAll(@Param("numbers") String numbers);

     //查询使用的车位信息
     List<Parking> queryParkAllByStatus();


}
