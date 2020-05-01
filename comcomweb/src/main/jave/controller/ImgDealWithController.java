package jave.controller;

import com.github.pagehelper.PageInfo;
import jave.bean.Leaflet;
import jave.generalbean.ResultJsp;
import jave.service.LeafletService;
import jave.utils.PageHeadls;
import jave.utils.StringSpilet;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 处理图片的逻辑用于显示查找图片，显示图片，显示分页
 *
 */
@Controller
public class ImgDealWithController {
    @Resource
    private LeafletService leafletService;

    //获取分页对象，不再方法内直接创建对象
    private PageHeadls getPage(){
        return new PageHeadls();
    }
    //返回给前端的数据封装，为了做到数据统一处理
    private ResultJsp getResultData(PageInfo info, int sucss, List<String> ls){
        return new ResultJsp(sucss,info, ls);
    }

    /***
     * 这个请求接口主要用于查询查询与ajax用途
     * @param page 分页信息
     * @return
     *
     */
    //获取前端数据并且根据数据进行分页，以后可以用ajax异步处理
    @ResponseBody
    @PostMapping("/getimg/{page}")
    public ResultJsp index(@PathVariable("page") int page){
        //获取分页器用于分页操作
        PageInfo info = getPage().getpage(page, leafletService.selectData(0));
        //返回页面统一用ResultJsp 方便处理
        ResultJsp resultJsp = getResultData(info,1, null);
        return resultJsp;
    }

    /**
     *根据前端id来进行查找图片
     * @param path 获取要查询的地址
     * @param map 返回给前端的数据
     * @return 返回一个map
     */
    @GetMapping("/vis/{id}")
    public String show(@PathVariable("id") int path, Map<String,ResultJsp<List<Leaflet>>> map){
        //取出找到数据
        List<Leaflet> data = leafletService.getOne(path);
        //返回的对象
        ResultJsp<List<Leaflet>> result = null;
        //判断是否是分组
        if (data.get(0).getImggroup() == 1) {
            //将字符串分割
            String[] img = StringSpilet.getImg(data.get(0).getImgaderess());
            //转换成集合类型
            List<String> myImg = Arrays.asList(img);

            result = new ResultJsp(1, data , myImg);
        }else {
            result = new ResultJsp(1, data, null);
        }

        map.put("result",result);
        return "template/show";
    }

    @GetMapping("/group")
    public String groupImg(Map<String,ResultJsp> map){
        //获取数据返回，不干其他事情
        PageHeadls pageHeadls = getPage();//获取分页插件
        //分页
        PageInfo getpage = pageHeadls.getpage(1, leafletService.selectData(1));
        //返回数据
        ResultJsp resultJsp = getResultData(getpage, 1, null);
        map.put("result", resultJsp);
        return "template/group";
    }


}
