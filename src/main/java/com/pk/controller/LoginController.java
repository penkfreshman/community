package com.pk.controller;

import com.pk.model.Owner;
import com.pk.model.Userinfo;
import com.pk.service.IOwnerService;
import com.pk.service.IUserinfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    private IUserinfoService userinfoService;

    @Resource
    private IOwnerService ownerService;

    private Logger log = LoggerFactory.getLogger(getClass());

    @RequestMapping("/loginIn")
    @ResponseBody
    public Map loginIn(Userinfo userinfo, HttpServletRequest request){
        Map map=new HashMap();
        HttpSession session=request.getSession();

        if(session==null){
            map.put("code",404);
            map.put("msg","登录超时了");
            return map;
        }

        Userinfo user=userinfoService.queryUserByNameAndPwd(userinfo);
        if(user.getIdentity().trim().equals("")||user.getIdentity()==null) {
            user.setIdentity("无");
            userinfoService.updateData(user);
        }
        String identity=user.getIdentity();



        if(user==null){
            map.put("code",404);
            map.put("msg","用户名或者密码错误");
            return map;
        }else{
            session.setAttribute("user",user);
            map.put("code",200);
            map.put("user",user);

            log.error(identity.trim());
            if(identity.trim().equals("无")) {
                map.put("username", user.getUsername());
            }else {
                Owner owner=ownerService.queryOwnerByIdCard(identity);
                map.put("username", owner.getUsername());
            }
            return map;
        }

    }


    /**
     * 退出功能
     */
    @RequestMapping("/loginOut")
    public void loginOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session=request.getSession();
        session.invalidate();
        response.sendRedirect(request.getContextPath()+"/login.html");
    }
}
