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
import beans.AdminDashboardData;
import models.UserModel;
import models.CcaModel;
import models.DashboardModel;

@WebServlet("/home")
public class HomeController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("The GET request has been made to home");

        if(!AuthGuard.isLogin(request, response)){
            return;
        }

        String role = CookieUtility.getUserRole(request, response);
        System.out.println(role);

        List<User> classMates = new ArrayList<>();
        List<Cca> myCcas = new ArrayList<>();
        User currentUser = new User();
        AdminDashboardData adminDashboardData = new AdminDashboardData();

        switch(role) {

            case "ADMIN":
                try {
                    adminDashboardData = DashboardModel.getDashboardData();
                } catch (Exception e){
                    System.out.println(e.getMessage());
                }
                request.setAttribute("adminDashboardData", adminDashboardData);
                request.getRequestDispatcher("/WEB-INF/pages/homes/admin_home.jsp").forward(request, response);
                break;

            case "ADVISOR":
                try {
                    currentUser = UserModel.getUser(CookieUtility.getUserId(request, response));
                    myCcas = CcaModel.getAdvisorCca(CookieUtility.getUserId(request, response));
                } catch (Exception e){
                    System.out.println(e.getMessage());
                }
                request.setAttribute("myCcas", myCcas);
                request.setAttribute("currentUser", currentUser);
                request.getRequestDispatcher("/WEB-INF/pages/homes/advisor_home.jsp").forward(request, response);
                break;

            case "STUDENT":
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