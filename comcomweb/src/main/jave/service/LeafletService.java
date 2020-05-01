package jave.service;

import jave.bean.Leaflet;

import java.util.List;

public interface LeafletService extends General {
    //查询单张图片
    List<Leaflet> getOne(int imgId);

}
