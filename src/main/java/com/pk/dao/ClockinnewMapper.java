package com.pk.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pk.model.Clockinnew;
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
@Component("clockInNewDao")
public interface ClockinnewMapper extends BaseMapper<Clockinnew> {

    /**
     * 查询所有疫情打卡记录
     */
    List<Clockinnew> queryClockInAll(Clockinnew clockinnew);

    Date queryCountByOwnId(Integer ownId);
}
