package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.User;
import database.Db;

public class UserModel {

    public static User login(String email, String password) throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        User user = new User();

        ResultSet set = con.createStatement().executeQuery("SELECT users.*, classes.name as class_name FROM users LEFT JOIN classes ON classes.id = users.class_id WHERE active_status = 'ACTIVE' AND email = '" + email + "' AND password = '" + password + "';");

        while (set.next()){
            user.id = set.getString(1);
            user.name = set.getString(2);
            user.classId = set.getString(3);
            user.className = set.getString(8);
            user.email = set.getString(4);
            user.activeStatus = set.getString(6);
            user.role = set.getString(7);
        }

        return user;
    }

    public static void register(String name, String classId, String email, String password, String role) throws SQLException,Exception {

        Db db = new Db();
        Connection con = db.getCon();

        ResultSet set = con.createStatement().executeQuery("SELECT * FROM users WHERE email = '" + email + "';");

        if(set.next()){
            throw new Exception("Email already taken.");
        }

        con.createStatement().execute("INSERT INTO users (name, class_id, email, password, active_status, role) values ('" + name + "'," + classId + ",'" + email + "','" + password + "', 'ACTIVE','" + role + "');");

    }

    public static List<User> viewUsers() throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        List<User> userList = new ArrayList<>();

        ResultSet set = con.createStatement().executeQuery("SELECT users.*, classes.name as class_name FROM users LEFT JOIN classes ON classes.id = users.class_id");

        while (set.next()){
            User user = new User();
            user.id = set.getString(1);
            user.name = set.getString(2);
            user.classId = set.getString(3);
            user.className = set.getString(8);
            user.email = set.getString(4);
            user.activeStatus = set.getString(6);
            user.role = set.getString(7);
            userList.add(user);
            System.out.println("active status = " + user.activeStatus);
        }

        return userList;
    }

    public static User getUser(String userId) throws SQLException {

        Db db = new Db();
        Connection con = db.getCon();

        User user = new User();

        ResultSet set = con.createStatement().executeQuery("SELECT users.*, classes.name as class_name FROM users LEFT JOIN classes ON classes.id = users.class_id WHERE users.id=" + userId);

        while (set.next()){
            user.id = set.getString("id");
            user.name = set.getString("name");
            user.classId = set.getString("class_id");
            user.className = set.getString("class_name");
            user.email = set.getString("email");
            user.activeStatus = set.getString("active_status");
            user.role = set.getString("role");
        }

        return user;
    }

    public static void updateUser(String userId, String name, String classId, String email, String activeStatus, String role) throws SQLException,Exception {

        Db db = new Db();
        Connection con = db.getCon();

        ResultSet set = con.createStatement().executeQuery("SELECT * FROM users WHERE email = '" + email + "' AND id <> " + userId + ";");

        if(set.next()){
            throw new Exception("Email already taken.");
        }

        con.createStatement().execute("UPDATE users set name='" + name + "', class_id=" + classId + ", email='" + email + "', active_status='" + activeStatus + "', role='" + role + "' WHERE id=" + userId + ";");

    }


}