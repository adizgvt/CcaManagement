package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.google.gson.*;

import database.Db;
import utility.AuthGuard;
import models.UserModel;
import models.ClassModel;
import beans.User;
import beans.Class;

@WebServlet("/user/*")
public class UserController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pathInfo = request.getPathInfo();
        System.out.println(pathInfo);

        if(pathInfo.contains("/index"))
            this.viewUser(request, response);

        else if(pathInfo.contains("/create"))
            this.createUser(request, response);

        else if(pathInfo.contains("/store"))
            this.storeUser(request, response);

        else if(pathInfo.contains("/edit"))
            this.editUser(request, response);

        else if(pathInfo.contains("/update"))
            this.updateUser(request, response);

        else if(pathInfo.contains("/edit_user_password"))
            this.editUserPassword(request, response);

        else if(pathInfo.contains("/update_password"))
            this.updateUserPassword(request, response);
        else
            request.getRequestDispatcher("/WEB-INF/pages/not_found.jsp").forward(request, response);

    }

    protected void viewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(!AuthGuard.isLogin(request, response)){
            return;
        }

        List<User> userList = new ArrayList<>();
        List<User> filteredList = new ArrayList<>();
        Gson gson = new Gson();

        try {
            userList = UserModel.viewUsers();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        String search = request.getParameter("search");

        if(search == null){
            filteredList = userList;
        }
        else {
            filteredList = userList.stream().filter(
                    user -> gson.toJson(user).toLowerCase().contains(search.toLowerCase())
            ).toList();
        }

        System.out.println(userList.get(0).name);
        request.setAttribute("userList", filteredList);
        request.getRequestDispatcher("/WEB-INF/pages/admin/view_users.jsp").forward(request, response);
    }

    protected void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Class> classList = new ArrayList<>();

        try {
            classList = ClassModel.getClassDropdown();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        request.setAttribute("classList", classList);
        request.getRequestDispatcher("/WEB-INF/pages/admin/create_user.jsp").forward(request, response);
    }

    protected void storeUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String role = request.getParameter("role").toString();
        String classId = request.getParameter("class").toString();
        String name = request.getParameter("name").toString();
        String email = request.getParameter("email").toString();
        String password = request.getParameter("password").toString();
        String passwordConfirmation = request.getParameter("password_confirmation").toString();

        if(!password.equalsIgnoreCase(passwordConfirmation)){
            request.setAttribute("email", email);
            request.setAttribute("name", name);
            request.setAttribute("error", "Password doesn't match.");
            this.createUser(request, response);
            return;
        }

        try {
            UserModel.register(name, classId, email, password, role);
        }catch (Exception e){
            request.setAttribute("email", email);
            request.setAttribute("name", name);
            request.setAttribute("error", e.getMessage());
            this.createUser(request, response);
            return;
        }

        request.setAttribute("success", "Successfully registered new user.");
        this.viewUser(request, response);
    }

    protected void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userId = request.getPathInfo().replace("/edit/", "");

        if(!Pattern.compile(".*\\d+.*").matcher(userId).matches()){
            userId =  request.getAttribute("user_id").toString();
        }

        List<Class> classList = new ArrayList<>();
        User user = new User();

        try {
            classList = ClassModel.getClassDropdown();
            user = UserModel.getUser(userId);
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        request.setAttribute("classList", classList);
        request.setAttribute("user", user);

        request.getRequestDispatcher("/WEB-INF/pages/admin/edit_user.jsp").forward(request, response);
    }

    protected void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userId = request.getParameter("user_id").toString();
        String activeStatus = request.getParameter("active_status").toString();
        String role = request.getParameter("role").toString();
        String classId = request.getParameter("class").toString();
        String name = request.getParameter("name").toString();
        String email = request.getParameter("email").toString();

        try {
            UserModel.updateUser(userId, name, classId, email, activeStatus, role);
        }catch (Exception e){
            request.setAttribute("error", e.getMessage()    );
            request.setAttribute("user_id", userId);
            this.editUser(request, response);
            return;
        }

        request.setAttribute("success", "Successfully updated user details.");
        this.viewUser(request, response);
    }

    protected void editUserPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/common/edit_user_password.jsp").forward(request, response);
    }

    protected void updateUserPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/user/index");
    }
}