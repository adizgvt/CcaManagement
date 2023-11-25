package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Class;
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

}