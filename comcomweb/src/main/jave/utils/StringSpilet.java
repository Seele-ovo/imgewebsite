package jave.utils;

import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Random;
import java.util.UUID;

/**
 * 图片保存的方法，存储图片制作缩略图
 */
public class StringSpilet {
    public static String[] getImg(String string){
        String[] split = string.split(",");
        return split;
    }

    //保存图片并且将第一张图片制作成缩略图
    public static String save(MultipartFile file, String pathRoot){
        String path="";
        if (file != null) {
            String name = UUID.randomUUID().toString().replaceAll("-", "");
            String ext = FilenameUtils.getExtension(file.getOriginalFilename());
            path="/statics/images/leaflet/"+name+"."+ext;
            try {
                file.transferTo(new File(pathRoot+path));
            } catch (IOException e) {
                e.printStackTrace();
            }
            String newPath = pathRoot +"/statics/images/thumbnail/" + name + "_sl" + "." + ext;
            createSl(pathRoot + path,newPath);
            return name;
        }
        return null;
    }
    //根据图片的地址
    private static String createSl(String oldPath,String newPath){
        try {
            Thumbnails.of(oldPath).size(400, 500).toFile(newPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static int getRadmon(){
        Random random = new Random();
        int s = random.nextInt(10000)%(10000-1000+1) + 1000;
        return s;
    }
}
