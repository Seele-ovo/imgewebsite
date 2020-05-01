package jave.utils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jave.bean.Leaflet;

import java.util.List;

/**
 * 返回分页对象
 * 将重复的分页操作封装起来
 */
public class PageHeadls {
    public PageInfo getpage(int pageId, List<Leaflet> data){
        PageHelper.startPage(pageId,5);
        PageInfo pageInfo=new PageInfo(data);
        return pageInfo;
    }
}
