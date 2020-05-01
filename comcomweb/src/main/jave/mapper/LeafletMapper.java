package jave.mapper;

import jave.bean.Leaflet;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface LeafletMapper {
    //查询所有的数据用于分页
    @Select("SELECT * FROM mytest.leaflet_img")
    List<Leaflet> selAll();
    //插入
    @Insert("INSERT INTO `mytest`.`leaflet_img` (`imgname`, `imgtype`, `imgdescription`, `imglabel`, `imgauthor`, `imgnumbering`, `imgthumbnail`, `imggroup`, `imgaderess`) VALUES ('${imgname}', '${imgType}', '${imgdescription}', '${imglabel}', '${imgauthor}', '${imgnumbering}', '${imgthumbnail}', '${imggroup}', '${imgaderess}')")
    int insetData(Leaflet leaflet);

    @Update("UPDATE `mytest`.`leaflet_img` SET `imgname` = '${imgname}', `imgtype` = '${imgType}', `imgdescription` = '${imgdescription}', `imglabel` = '${imglabel}', `imgauthor` = '${imgauthor}', `imgkeyword` = '${imgkeyword}' WHERE (`idimg` = '${idimg}')")
    int upImgData(Leaflet leaflet);
}
