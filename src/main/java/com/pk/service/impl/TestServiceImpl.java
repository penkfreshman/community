package com.pk.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageInfo;
import com.pk.dao.BuildingMapper;
import com.pk.model.Building;
import com.pk.service.IBuildingService;

public class TestServiceImpl extends ServiceImpl<BuildingMapper, Building> implements IBuildingService {
    @Override
    public PageInfo<Building> findBuildAll(int page, int pageSize, String numbers) {
        return null;
    }

    @Override
    public IPage<Building> findListByPage(Integer page, Integer pageCount) {
        return null;
    }

    @Override
    public int add(Building building) {
        return 0;
    }

    @Override
    public int delete(Long id) {
        return 0;
    }

    @Override
    public int updateData(Building building) {
        return 0;
    }

    @Override
    public Building findById(Long id) {
        return null;
    }

    @Override
    public Building queryBuildById(Integer buildId) {
        return null;
    }
}
