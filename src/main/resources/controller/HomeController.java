package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import database.Db;
import utility.AuthGuard;
import utility.CookieUtility;

@WebServlet("/home")
public class HomeController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The GET request has been made to home");

        if(!AuthGuard.isLogin(request, response)){
            return;
        }

        String role = CookieUtility.getUserRole(request, response);
        System.out.println(role);

        switch(role) {
            case "ADMIN":
                request.getRequestDispatcher("/WEB-INF/pages/homes/admin_home.jsp").forward(request, response);
                break;
            case "ADVISOR":
                request.getRequestDispatcher("/WEB-INF/pages/homes/advisor_home.jsp").forward(request, response);
                break;
            case "STUDENT":
                request.getRequestDispatcher("/WEB-INF/pages/homes/student_home.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/WEB-INF/pages/not_found.jsp").forward(request, response);
        }
    }

}