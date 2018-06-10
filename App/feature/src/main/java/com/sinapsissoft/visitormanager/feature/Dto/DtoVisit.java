package com.sinapsissoft.visitormanager.feature.Dto;

public class DtoVisit {

    public String sCode;
    public String sTitle;
    public String sDate;
    public String sState;
    public String sId;

    public DtoVisit(String code, String title, String date, String state, String id){
        this.sCode=code;
        this.sTitle=title;
        this.sDate=date;
        this.sState=state;
        this.sId=id;
    }

}
