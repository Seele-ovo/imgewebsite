package jave.controller;
import jave.bean.Leaflet;
import jave.generalbean.ResultJsp;
import jave.service.LeafletService;
import jave.utils.StringSpilet;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 用于后台的操作，添加图片，删除图片，修改图片，查找进行查找图片
 * 操作后端
 */
@Controller
public class AdminController {

    @Resource
    private LeafletService leafletService;

    private String imgPath = null;
    private StringBuilder builder = new StringBuilder();
    private StringBuilder sl = new StringBuilder();

    //根据图片
    private void append(MultipartFile file, HttpServletRequest request){
        if (imgPath == null) {
            imgPath = request.getSession().getServletContext().getRealPath("");
        }
        String str = StringSpilet.save(file,imgPath);
        //获取每张图片的扩展名
        String ext = FilenameUtils.getExtension(file.getOriginalFilename());
        //组合
        builder.append(str + "." +   ext +",");
        //组合
        sl.append(str + "_sl" + "." +  ext +",");
    }
    //获取页面返回值
    private ResultJsp getResultData(List<Leaflet> info, int sucss, List<String> ls){
        return new ResultJsp(sucss,info, ls);
    }
    @PostMapping("/upload")
    public String upload(MultipartFile file, Leaflet leaflet, HttpServletRequest request){
        if (file != null){
            //保存图片并且返回uuid
            append(file,request);
        }
        //保存图片
        if (leaflet != null && leaflet.getImgname() != null) {
            //1.将每张图片保存起来 2.把第一个图片做成缩略图并且返回这张缩略图的id
            leaflet.setImgthumbnail(sl.toString().split(",")[0]);
            //判断是组图还是单张
            if (leaflet.getImggroup() == 1) {
                //说明是组图，如果是组图则直接添加
                leaflet.setImgaderess(builder.toString());
            }else {
                //单张去掉逗号
                leaflet.setImgaderess(builder.toString().split(",")[0]);
            }
            //添加一个随机数，（可以添加一个方法那就是在创建一个随机数取缓存中检查是否存在防止重复）
            leaflet.setImgnumbering(StringSpilet.getRadmon());
            //保存
            int i = leafletService.insetData(leaflet);
            if (i > 0) {
                //保存成功清空图片uuid
                builder.delete(0,builder.length());
                sl.delete(0,sl.length());
            }
            return "redirect:/template/admin/admin.jsp";
        }

        return "no";
    }
    //显示数据

    @RequestMapping(value = "/admin")
    public String showData(Model model){
        List<Leaflet> leafletResultData = leafletService.selectData(-1);
        checkData(leafletResultData);
        model.addAttribute("result", getResultData(leafletResultData, 1, null));
        return "template/admin/admin";
    }

    @ResponseBody
    @RequestMapping(value = "/test", method = RequestMethod.PUT)
    public String test(Leaflet leaflet){
        int i = leafletService.updataData(leaflet);
        if (i != 0) {
            return "ok";
        }
        return "no";
    }


    //取出数据之后跳转
    @RequestMapping(value = "getdata/{id}", method = RequestMethod.GET)
    public String getData(@PathVariable("id") Integer id, Model model){
        List<Leaflet> one = leafletService.getOne(id);
        checkData(one);
        model.addAttribute("result", getResultData(one, 1, null));
        return "template/admin/updata";
    }

    private void checkData(Object object){
        if (object == null) {
            throw new RuntimeException("传入数据为空");
        }
    }
}
