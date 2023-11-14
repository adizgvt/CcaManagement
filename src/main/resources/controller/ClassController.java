package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import database.Db;
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
        request.getRequestDispatcher("/WEB-INF/pages/admin/view_classes.jsp").forward(request, response);
    }

    protected void createClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/create_class.jsp").forward(request, response);
    }

    protected void storeClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/class/index");
    }

    protected void editClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/edit_class.jsp").forward(request, response);
    }

    protected void updateClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/class/index");
    }

}