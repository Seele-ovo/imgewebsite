package jave.service;

import jave.bean.Leaflet;

import java.util.List;

/**
 * 泛型标注的是对一组数据进行相同的操作，但是这个接口有针对性所有不能使用泛型
 * 这个接口针对Leaflet类进行操作起到能替换这个类
 */

public interface General {
    //增加(暂定一个对象)
    int insetData(Leaflet Object);
    //删除（目前以一个id删除）
    int delData(int id);
    //修改(修改一个对象，以id为查找对象)
    int updataData(Leaflet leaflet);
    //查询（功能暂缺）
    List<Leaflet> selectData(int id);
}
