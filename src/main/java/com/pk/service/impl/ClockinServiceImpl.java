package com.pk.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pk.dao.ClockinMapper;
import com.pk.model.Clockin;
import com.pk.service.IClockinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author pk
 * @since 2022-03-1
 */
@Service
public class ClockinServiceImpl extends ServiceImpl<ClockinMapper, Clockin> implements IClockinService {

    @Autowired
    private ClockinMapper clockinDao;

    @Override
    public PageInfo<Clockin> queryClockInAll(int pageNum,int pageSize,Clockin clockin) {
        PageHelper.startPage(pageNum,pageSize);
        List<Clockin> list = clockinDao.queryClockInAll(clockin);
        return new PageInfo<>(list);
    }

    @Override
    public IPage<Clockin> findListByPage(Integer page, Integer pageCount){
        IPage<Clockin> wherePage = new Page<>(page, pageCount);
        Clockin where = new Clockin();

        return   baseMapper.selectPage(wherePage, Wrappers.query(where));
    }

    @Override
    public int add(Clockin clockin){
        return baseMapper.insert(clockin);
    }

    @Override
    public int delete(Long id){
        return baseMapper.deleteById(id);
    }

    @Override
    public int updateData(Clockin clockin){
        return baseMapper.updateById(clockin);
    }

    @Override
    public Clockin findById(Long id){
        return  baseMapper.selectById(id);
    }

    @Override
    public Date queryCountByOwnIdAndTime(Integer ownId) {
        return clockinDao.queryCountByOwnIdAndTime(ownId);
    }
}
