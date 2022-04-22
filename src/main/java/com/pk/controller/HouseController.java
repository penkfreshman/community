package com.pk.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;

import com.github.pagehelper.PageInfo;
import com.pk.model.Building;
import com.pk.model.House;
import com.pk.service.IBuildingService;
import com.pk.service.IHouseService;
import com.pk.service.IOwnerService;
import com.pk.util.JsonObject;
import com.pk.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;


import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author pk
 * @since 2022-02
 */
@Api(tags = {""})
@RestController
@RequestMapping("/house")
public class HouseController {

    private Logger log = LoggerFactory.getLogger(getClass());

    @Resource
    private IHouseService houseService;

    @Resource
    private IBuildingService buildingService;

    @Resource
    private IOwnerService ownerService;

    @RequestMapping("/houseAll")
    public JsonObject queryHouseAll(String numbers,
                                  @RequestParam(defaultValue = "1")  Integer page,
                                    @RequestParam(defaultValue = "15")  Integer limit){
        PageInfo<House> pageInfo=houseService.findHouseAll(page,limit,numbers);
        List<House> list=pageInfo.getList();
        for (House list1:list){
            if (list1.getIdentity().trim().equals("")||list1.getIdentity().trim()==null){
                list1.setStatus(0);
                houseService.updateData(list1);}
            else {
                list1.setStatus(1);
                houseService.updateData(list1);
            }


            Building buiding= buildingService.queryBuildById(list1.getBuildingId());
            list1.setBuilds(buiding.getNumbers());
            list1.setUnit(buiding.getUints());

//            log.error("-------------");
//            log.error((list1.getBuilds()!=null|| list1.getBuilds().trim()!="")?list1.getBuilds():"无");
//            log.error((list1.getUnit()!=null|| list1.getUnit().trim()!="")?list1.getUnit():"无");


        }
        pageInfo.setList(list);
        return  new JsonObject(0,"ok",pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("/queryAll")
    public  List<House> queryAll(){

        List<House> houses=houseService.findList();
        Iterator<House> iterator = houses.iterator();
        while (iterator.hasNext()){
            House house=iterator.next();
            if (house.getStatus()==0) {
                iterator.remove();
                log.error(house+"");
            }
        }
        return houses;
    }


    @ApiOperation(value = "新增")
    @RequestMapping("/add")
    public R add(@RequestBody House house){
//        if(house.getIntoDate()!=null){
//            house.setStatus(1);
//        }else{
//            house.setStatus(0);
//        }

        String s=house.getNumbers()+buildingService.queryBuildById(house.getBuildingId()).getNumbers().trim();
//        log.error("新增房间编号: "+s);
        List<House> list1=houseService.findList();

        if(ownerService.queryOwnerByIdCard(house.getIdentity().trim())==null&&house.getIdentity()!=null&&house.getIdentity()!="")
            return R.fail("未知身份证号码");


        for (House list:list1){
            Building buiding= buildingService.queryBuildById(list.getBuildingId());
            log.error("-------------------房间编号:"+list.getNumbers().trim()+buiding.getNumbers());
            String CodeTohome=list.getNumbers().trim()+buiding.getNumbers();
            if (s.equals(CodeTohome)){
                return R.fail("已有房间,请添加不同房间");
            }
        }

        int num= houseService.add(house);
        if(num>0){
            return R.ok();
        }else{
            return R.fail("添加失败");
        }
    }

    @ApiOperation(value = "删除")
    @RequestMapping("/deleteByIds")
    public R delete(String ids){
        //z转成集合对象
       List<String> list= Arrays.asList(ids.split(","));
       for(String id:list){
           Long idLong=Long.parseLong(id);
           houseService.delete(idLong);
       }
       return R.ok();
    }

    @ApiOperation(value = "更新")
    @RequestMapping("/update")
    public R update(@RequestBody House house){
//        if(house.getIntoDate()!=null){
//            house.setStatus(1);
//        }else{
//            house.setStatus(0);
//        }
        if(ownerService.queryOwnerByIdCard(house.getIdentity().trim())==null&&house.getIdentity()!=null&&house.getIdentity()!="")
            return R.fail("未知身份证号码");

        int num= houseService.updateData(house);
        if(num>0){
            return R.ok();
        }else{
            return R.fail("修改失败");
        }
    }

    @ApiOperation(value = "查询分页数据")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "page", value = "页码"),
        @ApiImplicitParam(name = "pageCount", value = "每页条数")
    })
    @GetMapping()
    public IPage<House> findListByPage(@RequestParam Integer page,
                                       @RequestParam Integer pageCount){
        return houseService.findListByPage(page, pageCount);
    }

    @ApiOperation(value = "id查询")
    @GetMapping("{id}")
    public House findById(@PathVariable Long id){
        return houseService.findById(id);
    }

}
