<%--
  Created by IntelliJ IDEA.
  User: NITRO
  Date: 2023-11-13
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="beans.Cca" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../header.jsp" %>
    <title>Title</title>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:ital,wght@0,300;0,400;1,600&display=swap" rel="stylesheet" />
    <style>
        * {
            font-family: 'Source Sans Pro';
        }
    </style>
</head>
<body>
<%@include file="../../navbar.jsp" %>

<div class="w-screen bg-gray-50">
    <div class="mx-auto max-w-screen-xl px-2 py-10">

        <%if(request.getAttribute("error") != null) {%>
        <div class="alert alert-danger" role="alert">

        </div>
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
            <strong class="font-bold">Error!</strong>
            <span class="block sm:inline"><%=request.getAttribute("error")%></span>
            <span class="absolute top-0 bottom-0 right-0 px-4 py-3">
    <svg class="fill-current h-6 w-6 text-red-500" role="button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><title>Close</title><path d="M14.348 14.849a1.2 1.2 0 0 1-1.697 0L10 11.819l-2.651 3.029a1.2 1.2 0 1 1-1.697-1.697l2.758-3.15-2.759-3.152a1.2 1.2 0 1 1 1.697-1.697L10 8.183l2.651-3.031a1.2 1.2 0 1 1 1.697 1.697l-2.758 3.152 2.758 3.15a1.2 1.2 0 0 1 0 1.698z"/></svg>
  </span>
        </div>
        <%}%>
        <%if(request.getAttribute("success") != null) {%>
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
            <strong class="font-bold">Success!</strong>
            <span class="block sm:inline"><%=request.getAttribute("success")%></span>
            <span class="absolute top-0 bottom-0 right-0 px-4 py-3">
    <svg class="fill-current h-6 w-6 text-red-500" role="button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><title>Close</title><path d="M14.348 14.849a1.2 1.2 0 0 1-1.697 0L10 11.819l-2.651 3.029a1.2 1.2 0 1 1-1.697-1.697l2.758-3.15-2.759-3.152a1.2 1.2 0 1 1 1.697-1.697L10 8.183l2.651-3.031a1.2 1.2 0 1 1 1.697 1.697l-2.758 3.152 2.758 3.15a1.2 1.2 0 0 1 0 1.698z"/></svg>
  </span>
        </div>
        <%}%>

        <div class="mt-6 overflow-hidden rounded-xl bg-white px-6 shadow lg:px-4">
            <table class="min-w-full border-collapse border-spacing-y-2 border-spacing-x-2">
                <thead class="hidden border-b lg:table-header-group">
                <tr class="">
                    <td class="whitespace-normal py-4 text-sm font-semibold text-gray-800 sm:px-3">ID</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Name</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Description</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Quota</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Start Time</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">End Time</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Day</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Action</td>
                </tr>
                </thead>

                <tbody class="bg-white lg:border-gray-300">
                <%List<Cca> ccaRegistrationList = (List<Cca>) request.getAttribute("ccaRegistrationList");%>
                <%List<String> userCca = (List<String>) request.getAttribute("userCca");%>
                <%for(int i = 0; i < ccaRegistrationList.size(); i++) {%>
                <tr class="">
                    <td class="whitespace-no-wrap hidden py-4 text-sm font-normal text-gray-600 sm:px-3 lg:table-cell"><%=ccaRegistrationList.get(i).id%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-sm font-normal text-gray-600 sm:px-3 lg:table-cell"><%=ccaRegistrationList.get(i).name%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell lg:text-left"><%=ccaRegistrationList.get(i).description%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell lg:text-left"><%=ccaRegistrationList.get(i).quota%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell lg:text-left"><%=ccaRegistrationList.get(i).startTime%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell lg:text-left"><%=ccaRegistrationList.get(i).endTime%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell lg:text-left"><%=ccaRegistrationList.get(i).day%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell lg:text-left">
                        <% if(!userCca.contains(ccaRegistrationList.get(i).id)){%>
                        <a href="/cca/register/<%=ccaRegistrationList.get(i).id%>" class="text-amber-700">Register</a>
                        <%} else {%>
                        <a href="/cca/drop/<%=ccaRegistrationList.get(i).id%>" class="text-amber-700">Drop</a>
                        <%}%>
                    </td>
                </tr>
                <%}%>

                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
<script>
    new DataTable('#example');
</script>
</html>
