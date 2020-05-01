package jave.generalbean;

import java.util.List;

/**
 * 将返回的数据统一打包成相同类型
 * 前端好处理
 */
public class ResultJsp<E> {
    public ResultJsp(int sucess, E data, List<String> list) {
        this.sucess = sucess;
        this.data = data;
        this.listImg = list;
    }
    public ResultJsp() {}

    private int sucess;
    private E data;
    private List<String> listImg;

    public List<String> getListImg() {
        return listImg;
    }

    public void setListImg(List<String> listImg) {
        this.listImg = listImg;
    }

    public int getSucess() {
        return sucess;
    }

    public void setSucess(int sucess) {
        this.sucess = sucess;
    }

    public E getData() {
        return data;
    }

    public void setData(E data) {
        this.data = data;
    }
}
