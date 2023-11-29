package com.sikiedu.model;

import java.util.List;

public class Page {

    private int pageNo;//What page is the current page number?
    private int pageSize;//How many pieces of data are displayed on each page?
    private int totalCount;//Total number of records Total number of data
    private int totalPage;//total pages

    private List<Object> list;

    public void setPageSizeAndTotalCount(int pageSize, int totalCount) {
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        totalPage = (int) Math.ceil((double) totalCount / pageSize);
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<Object> getList() {
        return list;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }

}
