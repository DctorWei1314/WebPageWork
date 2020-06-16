package com.web.entity;

import java.sql.Timestamp;

/**
 * 举报
 */

public class Report {
    private String reportUserID;//举报人用户ID
    private String reportedShopID;//被举报店ID
    private String description;//举报内容
    private Timestamp reportTime;//举报时间

    public Report() {
    }

    public Report(String reportUserID, String reportedShopID, String description, Timestamp reportTime) {
        this.reportUserID = reportUserID;
        this.reportedShopID = reportedShopID;
        this.description = description;
        this.reportTime = reportTime;
    }

    public String getReportUserID() {
        return reportUserID;
    }

    public void setReportUserID(String reportUserID) {
        this.reportUserID = reportUserID;
    }

    public String getReportedShopID() {
        return reportedShopID;
    }

    public void setReportedShopID(String reportedShopID) {
        this.reportedShopID = reportedShopID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getReportTime() {
        return reportTime;
    }

    public void setReportTime(Timestamp reportTime) {
        this.reportTime = reportTime;
    }
}
