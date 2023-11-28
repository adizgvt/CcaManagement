package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import com.google.gson.Gson;
import database.Db;
import models.ClassModel;
import beans.Class;
import beans.User;
import utility.AuthGuard;

@WebServlet("/class/*")
public class ClassController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pathInfo = request.getPathInfo();
        System.out.println(pathInfo);

        if(pathInfo.contains("/index"))
            this.viewClass(request, response);

        else if(pathInfo.contains("/view_student_class"))
            this.viewStudentClass(request, response);

        else if(pathInfo.contains("/create"))
            this.createClass(request, response);

        else if(pathInfo.contains("/store"))
            this.storeClass(request, response);

        else if(pathInfo.contains("/edit"))
            this.editClass(request, response);

        else if(pathInfo.contains("/update"))
            this.updateClass(request, response);

        else
            request.getRequestDispatcher("/WEB-INF/pages/not_found.jsp").forward(request, response);

    }

    protected void viewClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Class> classList = new ArrayList<>();
        List<Class> filteredClassList = new ArrayList<>();
        Gson gson = new Gson();

        try {
            classList = ClassModel.viewClass();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        String search = request.getParameter("search");

        if(search == null){
            filteredClassList = classList;
        }
        else {
            filteredClassList = classList.stream().filter(
                    _class -> gson.toJson(_class).toLowerCase().contains(search.toLowerCase())
            ).toList();
        }

        request.setAttribute("classList", filteredClassList);
        request.getRequestDispatcher("/WEB-INF/pages/admin/view_classes.jsp").forward(request, response);
    }

    protected void viewStudentClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!AuthGuard.isLogin(request, response)){
            return;
        }

        String classId = request.getPathInfo().replace("/view_student_class/", "");

        if(!Pattern.compile(".*\\d+.*").matcher(classId).matches()){
            classId =  request.getAttribute("name").toString();
        }

        List<User> studentList = new ArrayList<>();

        try {
            studentList = ClassModel.viewStudentClass(classId);
        }
        catch (Exception e){
            System.out.println(e);
        }
        request.setAttribute("studentList", studentList);

        request.getRequestDispatcher("/WEB-INF/pages/admin/view_student_class.jsp").forward(request, response);
    }

    protected void createClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/admin/create_class.jsp").forward(request, response);
    }

    protected void storeClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String className = request.getParameter("class-name").toString();



        try {
            ClassModel.add(className);
        }catch (Exception e){
            request.setAttribute("error", e.getMessage());
            this.createClass(request, response);
            return;
        }

        request.setAttribute("success", "Successfully add Record.");
        this.viewClass(request, response);
    }

    protected void editClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String classId = request.getPathInfo().replace("/edit/", "");

        if(!Pattern.compile(".*\\d+.*").matcher(classId).matches()){
            classId =  request.getAttribute("name").toString();
        }

        Class _class = new Class();

        try {
            _class = ClassModel.getClass(classId);
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        request.setAttribute("class", _class);

        request.getRequestDispatcher("/WEB-INF/pages/admin/edit_class.jsp").forward(request, response);
    }

    protected void updateClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = request.getParameter("class_name").toString();
        String classId = request.getParameter("class_id").toString();

        try {
            ClassModel.updateClass(className, classId);
        }catch (Exception e){
            request.setAttribute("error", e.getMessage());
//            this.editCca(request, response);
            System.out.println(e);
            return;
        }

        request.setAttribute("success", "Successfully updated class name details.");
        this.viewClass(request, response);
    }

}