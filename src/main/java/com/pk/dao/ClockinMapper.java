package com.pk.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pk.model.Clockin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author pk
 * @since 2022-03-1
 */
@Component("clockinDao")
public interface ClockinMapper extends BaseMapper<Clockin> {
    //查询所有
    List<Clockin> queryClockInAll(Clockin clockin);

    /**
     * 查找用户今天是否已经打卡，通过owner_id倒序排列查询第一个时间，就是该业主最近一次打卡时间
     */
    Date queryCountByOwnIdAndTime(@Param("ownId") Integer ownId);
}
