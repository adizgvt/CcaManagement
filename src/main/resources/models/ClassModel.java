package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Class;
import beans.User;
import database.Db;

public class ClassModel {

    public static List<Class> getClassDropdown() throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<Class> classList = new ArrayList<>();

        ResultSet set = con.createStatement().executeQuery("SELECT * from classes");

        while (set.next()){
            Class _class = new Class();
            _class.id = set.getString(1);
            _class.name = set.getString(2);
            classList.add(_class);
        }

        return classList;
    }

    public static void add(String className) throws SQLException,Exception {

        Db db = new Db();
        Connection con = db.getCon();

        ResultSet set = con.createStatement().executeQuery("SELECT * FROM classes WHERE name = '" + className + "';");

        if(set.next()){
            throw new Exception("Class name already taken.");
        }

        con.createStatement().execute("INSERT INTO classes (name) values ('" + className + "');");

    }

    public static List<Class> viewClass() throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<Class> classList = new ArrayList<>();

        ResultSet set = con.createStatement().executeQuery("SELECT * from classes");


        while (set.next()){
            Class _class = new Class();
            _class.id = set.getString("id");
            System.out.println(_class.id);
            _class.name = set.getString("name");
            System.out.println(_class.name);
            classList.add(_class);
        }

        return classList;
    }

    public static Class getClass(String classId) throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        Class _class = new Class();

        ResultSet set = con.createStatement().executeQuery("SELECT * FROM classes WHERE id= " + classId +";");

        while (set.next()){
            _class.id = set.getString("id");
            _class.name = set.getString("name");

        }

        return _class;
    }

    public static List<User> viewStudentClass(String classId) throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<User> userList = new ArrayList<>();

        ResultSet set = con.createStatement().executeQuery("SELECT * from users where class_id = " + classId + ";");


        while (set.next()){
            User user = new User();
            user.id = set.getString("id");
            System.out.println(user.id);
            user.name = set.getString("name");
            System.out.println(user.name);
            userList.add(user);
        }

        return userList;
    }

    public static void updateClass(String className, String classId) throws SQLException,Exception {

        Db db = new Db();
        Connection con = db.getCon();



        con.createStatement().execute("UPDATE classes set name='" + className + "' WHERE id=" + classId +";");
    }

}