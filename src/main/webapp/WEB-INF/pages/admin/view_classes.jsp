<%--
  Created by IntelliJ IDEA.
  User: NITRO
  Date: 2023-11-13
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="beans.Class" %>
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
        <div class="mt-4 w-full">
            <div class="flex w-full flex-col items-center justify-between space-y-2 sm:flex-row sm:space-y-0">
                <form class="relative flex w-full max-w-2xl items-center">
                    <svg class="absolute left-2 block h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8" class=""></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65" class=""></line>
                    </svg>
                    <input type="name" name="search" class="h-12 w-full border-b-gray-400 bg-light py-4 pl-12 text-sm outline-none focus:border-b-2" placeholder="Search" />
                </form>
                <a href="/class/create" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Create Class</a>
            </div>
        </div>

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
        <tr class="text-center">
            <td class="whitespace-normal py-4 text-sm font-semibold text-gray-800 sm:px-3">ID</td>
            <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Student Class</td>
        </tr>
        </thead>

        <tbody class="bg-white lg:border-gray-300 ">
        <%List<Class> classList = (List<Class>) request.getAttribute("classList");%>
        <%for(int i = 0; i < classList.size(); i++) {%>
        <tr class="">
            <td class="whitespace-no-wrap py-4 text-left text-sm text-gray-600 sm:px-3 lg:text-center">
                <%=classList.get(i).id%>
                <div class="flex flex-col text-xs font-medium lg:hidden">
                    <div class="flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                        <%=classList.get(i).id%>
                    </div>
<%--                    <div class="flex items-center">--%>
<%--                        <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">--%>
<%--                            <path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />--%>
<%--                        </svg>--%>
<%--                        <%=classList.get(i).name%>--%>
<%--                    </div>--%>
                    <div class="flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
                        </svg>
                        <a href="class/edit/<%=classList.get(i).id%>" class="text-amber-700">Edit</a>
                    </div>
                </div>
            </td>
            <td class="whitespace-no-wrap py-4 text-left text-sm text-gray-600 sm:px-3 lg:text-center">
                <%=classList.get(i).name%>
            </td>
            <td class="whitespace-no-wrap py-4 text-left text-sm text-gray-600 sm:px-3 lg:text-center">
                <a href="/class/edit/<%= classList.get(i).id %>" class="text-amber-700">Edit</a>
                <a href="/class/view_student_class/<%= classList.get(i).id %>" class="text-blue-700 ml-2">View</a>
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

</script>
</html>