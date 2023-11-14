package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import database.Db;
import utility.AuthGuard;

@WebServlet("/cca/*")
public class CcaController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pathInfo = request.getPathInfo();
        System.out.println(pathInfo);

        if(pathInfo.contains("/index"))
            this.viewCca(request, response);

        else if(pathInfo.contains("/create"))
            this.createCca(request, response);

        else if(pathInfo.contains("/store"))
            this.storeCca(request, response);

        else if(pathInfo.contains("/edit"))
            this.editCca(request, response);

        else if(pathInfo.contains("/update"))
            this.updateCca(request, response);

        else if(pathInfo.contains("/register"))
            this.registerCca(request, response);

        else if(pathInfo.contains("/drop"))
            this.dropCca(request, response);

        else
            request.getRequestDispatcher("/WEB-INF/pages/not_found.jsp").forward(request, response);

    }

    protected void viewCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/view_ccas.jsp").forward(request, response);
    }

    protected void createCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/create_cca.jsp").forward(request, response);
    }

    protected void storeCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/cca/index");
    }

    protected void editCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/edit_cca.jsp").forward(request, response);
    }

    protected void updateCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/cca/index");
    }

    protected void registerCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/register_cca.jsp").forward(request, response);
    }

    protected void dropCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/cca/index");
    }
}