package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import database.Db;
import utility.AuthGuard;
import utility.CookieUtility;
import beans.User;
import models.UserModel;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The GET request has been made to login");

        String userId = CookieUtility.getUserId(request, response);
        if(!userId.equalsIgnoreCase("0")){
            response.sendRedirect("/home");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The POST request has been made to login");

        String email = request.getParameter("email_login").toString();
        String password = request.getParameter("password_login").toString();

        User user = new User();

        try{
            user = UserModel.login(email, password);
        }catch (Exception e){
            request.setAttribute("email", email);
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            return;
        }

        if(user.id == null) {
            request.setAttribute("email", email);
            request.setAttribute("error", "Wrong username or password");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            return;
        }

        Cookie c1 = new Cookie("userId", user.id);
        Cookie c2 = new Cookie("name", user.name);
        Cookie c3 = new Cookie("class", user.className);
        Cookie c4 = new Cookie("class_id", user.classId);
        Cookie c5 = new Cookie("email", user.email);
        Cookie c6 = new Cookie("role", user.role);

        response.addCookie(c1);
        response.addCookie(c2);
        response.addCookie(c3);
        response.addCookie(c4);
        response.addCookie(c5);
        response.addCookie(c6);

        response.sendRedirect("/home");

    }

}