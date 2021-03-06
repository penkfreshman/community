package com.pk.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.pagehelper.PageInfo;
import com.pk.model.Carcharge;
import com.pk.model.Owner;
import com.pk.model.Parking;
import com.pk.model.Userinfo;
import com.pk.service.ICarchargeService;
import com.pk.service.IOwnerService;
import com.pk.service.IParkingService;
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
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
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
@RequestMapping("/carcharge")
public class CarchargeController {

    private Logger log = LoggerFactory.getLogger(getClass());

    @Resource
    private ICarchargeService carchargeService;

    @Resource
    private IParkingService parkingService;

    @Resource
    private IOwnerService ownerService;

    /**
     * 管理员停车费查询
     * @param carcharge
     * @param numbers
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/queryCarchargeAll")
    public JsonObject queryCarchargeAll(Carcharge carcharge, String numbers,
                                        @RequestParam(defaultValue = "1") Integer page,
                                        @RequestParam(defaultValue = "15") Integer limit){

        if(numbers!=null){
            log.error("the nun is :"+numbers.trim());
           Parking parking=new Parking();
           parking.setNumbers(numbers);
           carcharge.setParking(parking);
        }

        PageInfo<Carcharge> pageInfo=carchargeService.findCarchargeAll(page,limit,carcharge);
        return new JsonObject(0,"ok",pageInfo.getTotal(),pageInfo.getList());

    }

    /**
     * 用户停车费查询
     * @param carcharge
     * @param request
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/queryCarchargeAll2")
    public JsonObject queryCarchargeAll2(Carcharge carcharge, HttpServletRequest request,
                                        @RequestParam(defaultValue = "1") Integer page,
                                         @RequestParam(defaultValue = "15") Integer limit){

        Userinfo userinfo= (Userinfo) request.getSession().getAttribute("user");
         String identity=userinfo.getIdentity();
        Owner owner=ownerService.queryOwnerByIdCard(identity);
        log.error("the name is "+owner.getUsername() );
        Integer userId=owner.getId();
        carcharge.setOwnerId(userId);
        PageInfo<Carcharge> pageInfo=carchargeService.findCarchargeAll(page,limit,carcharge);
        return new JsonObject(0,"ok",pageInfo.getTotal(),pageInfo.getList());

    }



    @ApiOperation(value = "新增")
    @RequestMapping("/initData")
    public R InitData(@RequestBody Carcharge carcharge){
        /**
         * 遍历所有得已在使用得车位信息
         */
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date=null;
        try {
            date = simpleDateFormat.parse(carcharge.getEndDate());

        } catch (ParseException e) {
            e.printStackTrace();
        }

        List<Parking> parkingList=parkingService.queryParkingByStatus();
        if(carcharge.getPayDate().after(date))
            return R.fail("请输入正确的时间");
        for(Parking park:parkingList){
            carcharge.setStatus(0);
            carcharge.setOwnerId(park.getOwnerId());
            carcharge.setType("停车费");
            carcharge.setParkId(park.getId());
            log.error(carcharge+"");
            carchargeService.add(carcharge);
        }
       return R.ok();

    }


    @ApiOperation(value = "删除")
    @RequestMapping("/deleteByIds")
    public R delete(String ids){
        List<String> list= Arrays.asList(ids.split(","));
        for(String id:list){
           Long idLong=new Long(id);
           carchargeService.delete(idLong);
        }
        return R.ok();
    }

    @ApiOperation(value = "更新")
    @RequestMapping("/update")
    public R update(Integer id){
        Carcharge carcharge =new Carcharge();
        carcharge.setId(id);
        carcharge.setStatus(1);
        int num=carchargeService.updateData(carcharge);
        if(num>0){
            return R.ok();
        }
        return R.fail("失败");
    }

    @ApiOperation(value = "查询分页数据")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "page", value = "页码"),
        @ApiImplicitParam(name = "pageCount", value = "每页条数")
    })
    @GetMapping()
    public IPage<Carcharge> findListByPage(@RequestParam Integer page,
                                           @RequestParam Integer pageCount){
        return carchargeService.findListByPage(page, pageCount);
    }

    @ApiOperation(value = "id查询")
    @GetMapping("{id}")
    public Carcharge findById(@PathVariable Long id){
        return carchargeService.findById(id);
    }

}
