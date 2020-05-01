package jave.bean;

public class Leaflet implements Comparable<Leaflet> {
    private int idimg;//主键id
    private String imgname;//图片当前类型当前类型
    private int imgType;//图片类型
    private String imgdescription;//图片描述
    private String imglabel;//图片标签
    private String imgauthor;//图片作者
    private String imgkeyword;//图片关键字
    private int imgnumbering;//图片编号
    private String imgthumbnail;//图片缩略图
    private int imggroup;//判断是否时单张还是组
    private String imgaderess;

    @Override
    public String toString() {
        return "{" +
                ", imgnumbering=" + imgnumbering +
                '}';
    }

    public String getImgaderess() {
        return imgaderess;
    }

    public void setImgaderess(String imgaderess) {
        this.imgaderess = imgaderess;
    }

    public int getImggroup() {
        return imggroup;
    }

    public void setImggroup(int imggroup) {
        this.imggroup = imggroup;
    }

    public int getIdimg() {
        return idimg;
    }

    public void setIdimg(int idimg) {
        this.idimg = idimg;
    }

    public String getImgname() {
        return imgname;
    }

    public void setImgname(String imgname) {
        this.imgname = imgname;
    }

    public int getImgType() {
        return imgType;
    }

    public void setImgType(int imgType) {
        this.imgType = imgType;
    }

    public String getImgdescription() {
        return imgdescription;
    }

    public void setImgdescription(String imgdescription) {
        this.imgdescription = imgdescription;
    }

    public String getImglabel() {
        return imglabel;
    }

    public void setImglabel(String imglabel) {
        this.imglabel = imglabel;
    }

    public String getImgauthor() {
        return imgauthor;
    }

    public void setImgauthor(String imgauthor) {
        this.imgauthor = imgauthor;
    }

    public String getImgkeyword() {
        return imgkeyword;
    }

    public void setImgkeyword(String imgkeyword) {
        this.imgkeyword = imgkeyword;
    }

    public int getImgnumbering() {
        return imgnumbering;
    }

    public Leaflet setImgnumbering(int imgnumbering) {
        this.imgnumbering = imgnumbering;
        return this;
    }

    public String getImgthumbnail() {
        return imgthumbnail;
    }

    public void setImgthumbnail(String imgthumbnail) {
        this.imgthumbnail = imgthumbnail;
    }



    @Override
    public int compareTo(Leaflet o) {

        return (this.getImgnumbering() < o.getImgnumbering()) ? -1 : (this.getImgnumbering() == o.getImgnumbering()) ? 0 : 1;
    }
}
