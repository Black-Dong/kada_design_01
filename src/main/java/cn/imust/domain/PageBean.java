package cn.imust.domain;

import java.util.List;

/**
 * 页面的实体对象  专门用于封装分页的数据
 */
public class PageBean<T> {
    /**
     * 2个传
     *  pageNumber  当前页码
     *  pageSize    每页显示的个数
     * 2个查
     *  data        每页显示的数据
     *  totalRecord 总数据 总记录数
     * 2个算
     *  startIndex 开始索引
     *  totalPage  总页数
     */
    private int pageNumber ;
    private int pageSize ;
    private int totalRecord ;
    private int startIndex ;
    private int totalPage ;
    private List<T> data ;

    private int start ;// 前四后五 开始循环
    private int end ;// 前四后五 结束循环
    //计算start和end的值
    private void jisuan(){

        //需要 动态条 和 不需要动态条
        //System.out.println("totalPage:"+totalPage); 所有的代码必须注意 先计算totalPage
        //if(totalPage<= 10 ){//总页码小于10   totalPage = 0  不计算
        if(getTotalPage()<= 10 ){// 第一次计算totalPage
            start = 1 ;
            end = totalPage;
        }else{ //总页码大于10 必须动态条 前四后五
            start = pageNumber - 4; //前四
            end = pageNumber + 5;//后五
            //极限值
            if(start < 1){//pageNumber =  1 ,2 , 3 ,  4
                start  = 1 ;
                end = 10 ; //不用动态
            }
            //极限值
            if(end > totalPage){//最大值 超过总页码
                end = totalPage; //最大值等于总页码  52
                start = totalPage - 9;
            }
        }
    }
    public int getStart() {
        jisuan();
        return start;
    }
    public int getEnd() {
        jisuan();
        return end;
    }



    //有参构造只有pageNumber 和 pageSize
    //不能有无参  以后初始化pageBean 直接赋值两个参数
    public PageBean(int pageNumber, int pageSize) {
        this.pageNumber = pageNumber;
        this.pageSize = pageSize;
    }
    //获得startIndex时候计算
    public int getStartIndex() {
        startIndex = (pageNumber-1)*pageSize;
        return startIndex;
    }
    //计算总页数
    public int getTotalPage() {
        if(totalRecord % pageSize == 0 ){//整数
            totalPage = totalRecord / pageSize;
        }else{
            totalPage = totalRecord / pageSize+1;
        }
        return totalPage;
    }



    public void setStart(int start) {
        this.start = start;
    }



    public void setEnd(int end) {
        this.end = end;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }



    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }



    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "pageNumber=" + pageNumber +
                ", pageSize=" + pageSize +
                ", totalRecord=" + totalRecord +
                ", startIndex=" + startIndex +
                ", totalPage=" + totalPage +
                ", data=" + data +
                ", start=" + start +
                ", end=" + end +
                '}';
    }
}
