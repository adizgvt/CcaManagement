package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.lang.String;
import java.lang.Integer;

import beans.Cca;
import beans.Advisor;
import beans.AdminDashboardData;
import models.DashboardModel;
import database.Db;

public class DashboardModel {
    public static AdminDashboardData getDashboardData() throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        AdminDashboardData adminDashboardData = new AdminDashboardData();

        ResultSet set = con.createStatement().executeQuery("SELECT COUNT(*) as student_count FROM `users` WHERE role='STUDENT';");

        while (set.next()){
            adminDashboardData.totalStudents = set.getString("student_count");
        }

        set = con.createStatement().executeQuery("SELECT COUNT(*) as advisor_count FROM `users` WHERE role='ADVISOR';");

        while (set.next()){
            adminDashboardData.totalAdvisors = set.getString("advisor_count");
        }

        set = con.createStatement().executeQuery("SELECT COUNT(*) as cca_count FROM `cca`;");

        while (set.next()){
            adminDashboardData.totalCCas = set.getString("cca_count");
        }

        set = con.createStatement().executeQuery("SELECT COUNT(*) as classes_count FROM `classes`;");

        while (set.next()){
            adminDashboardData.totalClasses = set.getString("classes_count");
        }

        return adminDashboardData;
    }
}