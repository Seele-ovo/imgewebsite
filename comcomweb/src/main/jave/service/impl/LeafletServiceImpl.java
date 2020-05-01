package jave.service.impl;
import jave.bean.Leaflet;
import jave.mapper.LeafletMapper;
import jave.mycache.MyCache;
import jave.service.LeafletService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class LeafletServiceImpl implements LeafletService {
    //理解成缓存
    private MyCache<Leaflet> cache;//存放单章图片
    private List<Leaflet> list;//存放组图
    {
        cache = new MyCache<>();//初始化缓存
    }

    @Resource
    private LeafletMapper leafletMapper;

    @Override
    public int insetData(Leaflet object) {
        if (object != null) {
            int result = leafletMapper.insetData(object);
            return result;
        }
        return 0;
    }

    @Override
    public int delData(int id) {
        return 0;
    }

    @Override
    public int updataData(Leaflet leaflet) {
        int i = leafletMapper.upImgData(leaflet);
        if (i != 0) {
            //返回数据
            return 1;
        }
        return 0;
    }
    private void avl(List<Leaflet> list){
        for (Leaflet leaflet : list) {
            cache.insert(leaflet);
        }
    }
    @Override
    public List<Leaflet> selectData(int id) {
        if (cache.isEmpty()) {
            list = leafletMapper.selAll();
            avl(list);//取出所有的数据打成一颗二叉树
        }
        if (id == -1) {
            return list;
        }
        return list.stream().filter(n -> n.getImggroup() == id).collect(Collectors.toList());
    }


    @Override
    public List<Leaflet> getOne(final int imgId) {
        Leaflet leaflet = cache.get(new Leaflet().setImgnumbering(imgId));
        ArrayList<Leaflet> ls = new ArrayList<>();
        ls.add(leaflet);
        return ls;
    }
}
