package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import database.Db;
import utility.AuthGuard;
import utility.CookieUtility;
import beans.User;
import beans.Cca;
import models.UserModel;
import models.CcaModel;

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
                List<User> classMates = new ArrayList<>();
                List<Cca> myCcas = new ArrayList<>();
                User currentUser = new User();
                try {
                    classMates = UserModel.getClassMates(CookieUtility.getUserId(request, response));
                    currentUser = UserModel.getUser(CookieUtility.getUserId(request, response));
                    myCcas = CcaModel.getUserCca(CookieUtility.getUserId(request, response));
                } catch (Exception e){
                    System.out.println(e.getMessage());
                }
                request.setAttribute("classMates", classMates);
                request.setAttribute("myCcas", myCcas);
                request.setAttribute("currentUser", currentUser);
                request.getRequestDispatcher("/WEB-INF/pages/homes/student_home.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/WEB-INF/pages/not_found.jsp").forward(request, response);
        }
    }

}