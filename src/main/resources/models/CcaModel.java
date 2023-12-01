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
        con.createStatement().execute("UPDATE cca set name='" + name + "', description ='" + description + "', quota ='" + quota + "', advisor_id =" + advisorId + ", year= " + year + ", available_for_registration= " + availableForRegistration + ", start_time= '" + startTime + "', end_time= '" + endTime + "', day='" + day + "' WHERE id=" + ccaId +";");
    }

    public static List<Cca> getUserCca(String userId) throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<Cca> ccaList = new ArrayList<>();

        ResultSet set = con.createStatement().executeQuery("SELECT cca.*,users.name as advisor_name FROM cca JOIN users ON users.id=cca.advisor_id WHERE cca.id IN (SELECT cca_id FROM `cca_students` WHERE student_id="+userId+");");

        while (set.next()){
            Cca cca = new Cca();
            cca.name = set.getString("name");
            cca.description = set.getString("description");
            cca.startTime = set.getString("start_time");
            cca.quota = set.getString("quota");
            cca.endTime = set.getString("end_time");
            cca.day = set.getString("day");
            cca.advisorName = set.getString("advisor_name");
            ccaList.add(cca);
        }

        return ccaList;
    }

    public static List<Cca> getAdvisorCca(String userId) throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<Cca> ccaList = new ArrayList<>();

        ResultSet set = con.createStatement().executeQuery("SELECT cca.*,users.name as advisor_name FROM cca JOIN users ON users.id=cca.advisor_id WHERE cca.advisor_id="+userId+";");

        while (set.next()){
            Cca cca = new Cca();
            cca.name = set.getString("name");
            cca.description = set.getString("description");
            cca.startTime = set.getString("start_time");
            cca.quota = set.getString("quota");
            cca.endTime = set.getString("end_time");
            cca.day = set.getString("day");
            cca.advisorName = set.getString("advisor_name");
            System.out.println(cca.name);
            ccaList.add(cca);
        }

        return ccaList;
    }

    public static List<String> getUserCcaIds(String userId) throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<String> myCcaIds = new ArrayList<>();

        ResultSet set = con.createStatement().executeQuery("SELECT cca.*,users.name as advisor_name FROM cca JOIN users ON users.id=cca.advisor_id WHERE cca.id IN (SELECT cca_id FROM `cca_students` WHERE student_id="+userId+");");

        while (set.next()){
            myCcaIds.add(set.getString("id"));
        }

        return myCcaIds;
    }

    public static List<Cca> getCcaRegistrationList() throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<Cca> ccaList = new ArrayList<>();

        ResultSet set = con.createStatement().executeQuery("SELECT cca.*,users.name as advisor_name FROM `cca` LEFT JOIN users on users.id=cca.advisor_id WHERE available_for_registration=1;");

        while (set.next()){
            Cca cca = new Cca();
            cca.id = set.getString("id");
            cca.name = set.getString("name");
            cca.description = set.getString("description");
            cca.quota = set.getString("quota");
            cca.startTime = set.getString("start_time");
            cca.endTime = set.getString("end_time");
            cca.day = set.getString("day");
            cca.advisorName = set.getString("advisor_name");
            ccaList.add(cca);
        }
        return ccaList;
    }

    public static void registerCca(String ccaId, String userId) throws SQLException, Exception {

        Db db = new Db();
        Connection con = db.getCon();

        Cca toBeRegisteredCca = new Cca();
        toBeRegisteredCca = getCca(ccaId);

        Integer totalRegisteredStudents = 0;

        ResultSet set = con.createStatement().executeQuery("SELECT COUNT(*) as total_registered_students FROM `cca_students` WHERE cca_id=1" + ccaId +";");

        while (set.next()){
            totalRegisteredStudents = Integer.parseInt(set.getString("total_registered_students"));
        }

        if(totalRegisteredStudents >= Integer.parseInt(toBeRegisteredCca.quota)){
            throw new Exception("Cannot register this CCA because the quota is already Full");
        }

        List<Cca> myCcaList = new ArrayList<>();
        myCcaList = getUserCca(userId);

        for (Cca mycca: myCcaList) {
            if(Integer.parseInt(toBeRegisteredCca.startTime.replace(":","")) >= Integer.parseInt(mycca.startTime.replace(":",""))  &&
                Integer.parseInt(toBeRegisteredCca.startTime.replace(":","")) <= Integer.parseInt(mycca.endTime.replace(":","")) &&
                toBeRegisteredCca.day.equalsIgnoreCase(mycca.day)){
                throw new Exception("Cannot register this CCA because it overlaps with other registered CCA");
            }
        }

        con.createStatement().execute("INSERT INTO cca_students (student_id,class_id,cca_id) VALUES("+userId+",(SELECT class_id from users WHERE id="+userId+"),"+ccaId+");");
    }
    public static void dropCca(String ccaId, String userId) throws SQLException,Exception {

        Db db = new Db();
        Connection con = db.getCon();
        con.createStatement().execute("DELETE FROM cca_students WHERE cca_id=" + ccaId +" AND student_id="+ userId+";");
    }

}