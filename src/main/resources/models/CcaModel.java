package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Cca;
import beans.Advisor;
import database.Db;

public class CcaModel {

    public static void add(String name, String description, String quota, String advisorId, String year, String startTime, String endTime, String day) throws SQLException,Exception {

        Db db = new Db();
        Connection con = db.getCon();

        ResultSet set = con.createStatement().executeQuery("SELECT * FROM cca WHERE name = '" + name + "';");

        if(set.next()){
            throw new Exception("CCA Exist.");
        }

        con.createStatement().execute("INSERT INTO cca (name, description, quota, advisor_id, year, available_for_registration, start_time, end_time, day) values ('" + name + "','" + description + "','" + quota + "','" + advisorId + "','" + year + "','1','" + startTime + "','" + endTime + "','" + day + "');");

    }

    public static List<Advisor> getAdvisorDropdown() throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<Advisor> advisorList = new ArrayList<>();

        ResultSet set = con.createStatement().executeQuery("SELECT * from users WHERE role='ADVISOR'");

        while (set.next()){
            Advisor _advisor = new Advisor();
            _advisor.id = set.getString("id");
            _advisor.name = set.getString("name");
            advisorList.add(_advisor);
        }

        return advisorList;
    }

    public static List<Cca> viewCca() throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<Cca> ccaList = new ArrayList<>();

        ResultSet set = con.createStatement().executeQuery("SELECT users.name as advisor_name , cca.* FROM cca LEFT JOIN users ON cca.advisor_id=users.id");

        while (set.next()){
            Cca _cca = new Cca();
            _cca.id = set.getString("id");
            _cca.name = set.getString("name");
            _cca.description = set.getString("description");
            _cca.quota = set.getString("quota");
            _cca.advisorId = set.getString("advisor_id");
            _cca.year = set.getString("year");
            _cca.availableForRegistration = set.getString("available_for_registration");
            _cca.startTime = set.getString("start_time");
            _cca.endTime = set.getString("end_time");
            _cca.day = set.getString("day");
            _cca.advisorName = set.getString("advisor_name");
            ccaList.add(_cca);
        }

        return ccaList;
    }

    public static List<Cca> viewCcaInfo(String ccaId) throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<Cca> ccaStudentList = new ArrayList<>();

        System.out.println("SELECT users.id, users.name, users.email, cca_students.id AS cca_students_id, classes.name AS class_name FROM cca_students LEFT JOIN users ON cca_students.student_id=users.id LEFT JOIN classes ON users.class_id=classes.id WHERE cca_students.cca_id="+ccaId+";");
        ResultSet set = con.createStatement().executeQuery("SELECT users.id, users.name, users.email, cca_students.id AS cca_students_id, classes.name AS class_name FROM cca_students LEFT JOIN users ON cca_students.student_id=users.id LEFT JOIN classes ON users.class_id=classes.id WHERE cca_students.cca_id="+ccaId+";");

        while (set.next()){
            Cca _cca = new Cca();
            _cca.id = set.getString("id");
            _cca.name = set.getString("name");
            _cca.email = set.getString("email");
            _cca.ccaStudentsId = set.getString("cca_students_id");
            _cca.className = set.getString("class_name");
            ccaStudentList.add(_cca);
        }

        return ccaStudentList;
    }

    public static Cca getCca(String ccaId) throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        Cca _cca = new Cca();

        ResultSet set = con.createStatement().executeQuery("SELECT * FROM cca WHERE id= " + ccaId +";");

        while (set.next()){
            _cca.id = set.getString("id");
            _cca.name = set.getString("name");
            _cca.description = set.getString("description");
            _cca.quota = set.getString("quota");
            _cca.advisorId = set.getString("advisor_id");
            _cca.year = set.getString("year");
            _cca.availableForRegistration = set.getString("available_for_registration");
            _cca.startTime = set.getString("start_time");
            _cca.endTime = set.getString("end_time");
            _cca.day = set.getString("day");
        }

        return _cca;
    }

    public static void updateCca(String ccaId, String name, String description, String quota, String advisorId, String year, String availableForRegistration, String startTime, String endTime, String day) throws SQLException,Exception {

        Db db = new Db();
        Connection con = db.getCon();

//        ResultSet set = con.createStatement().executeQuery("SELECT * FROM cca WHERE name = '" + name + "' AND id <> " + ccaId + ";");
//
//        if(set.next()){
//            throw new Exception("cca already exist");
//        }

        con.createStatement().execute("UPDATE cca set name='" + name + "', description ='" + description + "', quota ='" + quota + "', advisor_id =" + advisorId + ", year= " + year + ", available_for_registration= " + availableForRegistration + ", start_time= '" + startTime + "', end_time= '" + endTime + "', day='" + day + "' WHERE id=" + ccaId +";");
    }

}