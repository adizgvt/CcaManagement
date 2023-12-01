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
import utility.CookieUtility;
import models.CcaModel;
import models.ClassModel;
import beans.Cca;
import beans.Advisor;
import beans.Class;

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

        else if(pathInfo.contains("/view"))
            this.viewCcaInfo(request, response);

        else if(pathInfo.contains("/create"))
            this.createCca(request, response);

        else if(pathInfo.contains("/store"))
            this.storeCca(request, response);

        else if(pathInfo.contains("/edit"))
            this.editCca(request, response);

        else if(pathInfo.contains("/update"))
            this.updateCca(request, response);

        else if(pathInfo.contains("/registration_list"))
            this.registrationList(request, response);

        else if(pathInfo.contains("/register"))
            this.registerCca(request, response);

        else if(pathInfo.contains("/drop"))
            this.dropCca(request, response);

        else
            request.getRequestDispatcher("/WEB-INF/pages/not_found.jsp").forward(request, response);

    }

    protected void viewCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!AuthGuard.isLogin(request, response)){
            return;
        }

        List<Cca> ccaList = new ArrayList<>();
        List<Cca> filteredList = new ArrayList<>();
        Gson gson = new Gson();

        try {
            ccaList = CcaModel.viewCca();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        String search = request.getParameter("search");

        if(search == null){
            filteredList = ccaList;
        }
        else {
            filteredList = ccaList.stream().filter(
                    cca -> gson.toJson(cca).toLowerCase().contains(search.toLowerCase())
            ).toList();
        }


        request.setAttribute("ccaList", filteredList);
        request.getRequestDispatcher("/WEB-INF/pages/admin/view_ccas.jsp").forward(request, response);
    }

    protected void viewCcaInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!AuthGuard.isLogin(request, response)){
            return;
        }

        String ccaId = request.getPathInfo().replace("/view/", "");

        if(!Pattern.compile(".*\\d+.*").matcher(ccaId).matches()){
            ccaId =  request.getAttribute("cca_id").toString();
        }

        List<Cca> ccaStudentList = new ArrayList<>();
        Cca cca = new Cca();

        try {
            ccaStudentList = CcaModel.viewCcaInfo(ccaId);
        }
        catch (Exception e){
            System.out.println(e);
        }
        request.setAttribute("ccaStudentList", ccaStudentList);

        request.getRequestDispatcher("/WEB-INF/pages/admin/view_cca_info.jsp").forward(request, response);
    }

    protected void createCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Advisor> advisorList = new ArrayList<>();

        try {
            advisorList = CcaModel.getAdvisorDropdown();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        request.setAttribute("advisorList", advisorList);
        request.getRequestDispatcher("/WEB-INF/pages/admin/create_cca.jsp").forward(request, response);
    }

    protected void storeCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name").toString();
        String description = request.getParameter("description").toString();
        String quota = request.getParameter("quota").toString();
        String advisorID = request.getParameter("advisor_id").toString();
        String year = request.getParameter("year").toString();
//        String availableForRegistration = request.getParameter("available_for_registration").toString();
        String startTime = request.getParameter("start_time").toString();
        String endTime = request.getParameter("end_time").toString();
        String day = request.getParameter("day").toString();

        try {
            CcaModel.add(name, description, quota, advisorID, year, startTime, endTime, day);
        }catch (Exception e){
            request.setAttribute("error", e.getMessage());
            this.createCca(request, response);
            return;
        }

        request.setAttribute("success", "Successfully created.");
        this.viewCca(request, response);

//        response.sendRedirect("/cca/index");
    }

    protected void editCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ccaId = request.getPathInfo().replace("/edit/", "");

        if(!Pattern.compile(".*\\d+.*").matcher(ccaId).matches()){
            ccaId =  request.getAttribute("cca_id").toString();
        }

        List<Advisor> advisorList = new ArrayList<>();
        Cca cca = new Cca();

        try {
            advisorList = CcaModel.getAdvisorDropdown();
            cca = CcaModel.getCca(ccaId);
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        request.setAttribute("advisorList", advisorList);
        request.setAttribute("cca", cca);

        request.getRequestDispatcher("/WEB-INF/pages/admin/edit_cca.jsp").forward(request, response);
    }

    protected void updateCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ccaId = request.getParameter("cca_id").toString();
        String name = request.getParameter("name").toString();
        String description = request.getParameter("description").toString();
        String quota = request.getParameter("quota").toString();
        String advisorID = request.getParameter("advisor_id").toString();
        String year = request.getParameter("year").toString();
        String availableForRegistration = request.getParameter("available_for_registration").toString();
        String startTime = request.getParameter("start_time").toString();
        String endTime = request.getParameter("end_time").toString();
        String day = request.getParameter("day").toString();

        try {
            CcaModel.updateCca(ccaId, name, description, quota, advisorID, year, availableForRegistration, startTime, endTime, day);
        }catch (Exception e){
            request.setAttribute("error", e.getMessage());
//            this.editCca(request, response);
            System.out.println(e);
            return;
        }

        request.setAttribute("success", "Successfully updated cca details.");
        this.viewCca(request, response);
    }
    protected void registrationList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cca> ccaRegistrationList = new ArrayList<>();
        List<String> userCca = new ArrayList<>();

        try {
            ccaRegistrationList = CcaModel.getCcaRegistrationList();
            userCca = CcaModel.getUserCcaIds(CookieUtility.getUserId(request, response));
        }catch (Exception e){
            System.out.println(e.getMessage());
            request.setAttribute("error", e.getMessage());
            System.out.println(e);
            return;
        }

        request.setAttribute("ccaRegistrationList", ccaRegistrationList);
        request.setAttribute("userCca", userCca);
        request.getRequestDispatcher("/WEB-INF/pages/student/register_cca.jsp").forward(request, response);
    }
    protected void registerCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ccaId = request.getPathInfo().replace("/register/", "");

        if(!Pattern.compile(".*\\d+.*").matcher(ccaId).matches()){
            ccaId =  request.getAttribute("register").toString();
        }

        try {
            CcaModel.registerCca(ccaId,CookieUtility.getUserId(request, response));
        }
        catch (Exception e){
            request.setAttribute("error", e.getMessage());
            this.registrationList(request, response);
            return;
        }
        request.setAttribute("success", "CCA successfully registered.");
        this.registrationList(request, response);
    }

    protected void dropCca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ccaId = request.getPathInfo().replace("/drop/", "");

        if(!Pattern.compile(".*\\d+.*").matcher(ccaId).matches()){
            ccaId =  request.getAttribute("drop").toString();
        }


        try {
            CcaModel.dropCca(ccaId, CookieUtility.getUserId(request, response));
        }
        catch (Exception e){
            request.setAttribute("error", e.getMessage());
            this.registrationList(request, response);
            return;
        }
        request.setAttribute("success", "CCA successfully dropped.");
        this.registrationList(request, response);
    }
}