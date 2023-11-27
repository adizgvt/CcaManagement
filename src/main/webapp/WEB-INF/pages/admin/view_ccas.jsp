<%@ page import="java.util.List" %>
<%@ page import="beans.Cca" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../header.jsp" %>
    <title>Title</title>
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
                <a href="/cca/create" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Create CCA</a>
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
                <tr class="">
                    <td class="whitespace-normal py-4 text-sm font-semibold text-gray-800 sm:px-3">ID</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Name</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Description</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Quota</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Advisor Name</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Year</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Available for Registration</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Start Time</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">End Time</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Day</td>
                    <td class="whitespace-normal py-4 text-sm font-medium text-gray-500 sm:px-3">Action</td>
                </tr>
                </thead>

                <tbody class="bg-white lg:border-gray-300">
                <%List<Cca>ccaList = (List<Cca>) request.getAttribute("ccaList");%>
                <%for(int i = 0; i < ccaList.size(); i++) {%>
                <tr class="">
                    <td class="whitespace-no-wrap py-4 text-left text-sm text-gray-600 sm:px-3 lg:text-left">
                        <%=ccaList.get(i).id%>
                        <div class="mt-1 flex flex-col text-xs font-medium lg:hidden">
                            <div class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                </svg>
                                <%=ccaList.get(i).id%>
                            </div>
                            <div class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 10h16M4 14h16M4 18h16" />
                                </svg>
                                <%=ccaList.get(i).name%>
                            </div>
                            <div class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
                                </svg>
                                <%=ccaList.get(i).description%>
                            </div>
                            <div class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
                                </svg>
                                <%=ccaList.get(i).quota%>
                            </div>
                            <div class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
                                </svg>
                                <%=ccaList.get(i).advisorName%>
                            </div>
                            <div class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
                                </svg>
                                <%=ccaList.get(i).year%>
                            </div>
                            <div class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
                                </svg>
                                <%=ccaList.get(i).availableForRegistration%>
                            </div>
                            <div class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
                                </svg>
                                <%=ccaList.get(i).startTime%>
                            </div>
                            <div class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
                                </svg>
                                <%=ccaList.get(i).endTime%>
                            </div>
                            <div class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
                                </svg>
                                <%=ccaList.get(i).day%>
                            </div>
                            <div class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
                                </svg>
                                <a href="cca/edit/<%=ccaList.get(i).id%>" class="text-amber-700">View</a>
                                <a href="cca/edit/<%=ccaList.get(i).id%>" class="text-amber-700">Edit</a>
                            </div>
                        </div>
                    </td>
                    <td class="whitespace-no-wrap hidden py-4 text-sm font-normal text-gray-600 sm:px-3 lg:table-cell"><%=ccaList.get(i).name%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-sm font-normal text-gray-600 sm:px-3 lg:table-cell"><%=ccaList.get(i).description%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell"><%=ccaList.get(i).quota%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-sm font-normal text-gray-500 sm:px-3 lg:table-cell"><%=ccaList.get(i).advisorName%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell"><%=ccaList.get(i).year%></td>
<%--                    <td class="whitespace-no-wrap hidden py-4 text-sm font-normal text-gray-600 sm:px-3 lg:table-cell lg:text-center"><%=ccaList.get(i).availableForRegistration%></td>--%>
<%--                    <td class="whitespace-no-wrap hidden py-4 text-sm font-normal text-gray-500 sm:px-3 lg:table-cell"><span class="ml-2 mr-3 whitespace-nowrap rounded-full bg-<%=ccaList.get(i).availableForRegistration.equals("1") ? "green" : "amber" %>-100 px-2 py-0.5 text-<%=ccaList.get(i).availableForRegistration.equals("1") ? "green" : "amber" %>-800"><%=ccaList.get(i).availableForRegistration%></span></td>--%>
                    <td class="whitespace-no-wrap hidden py-4 text-sm font-normal text-gray-500 sm:px-3 lg:table-cell"><span class="ml-2 mr-3 whitespace-nowrap rounded-full bg-<%= ccaList.get(i).availableForRegistration.equals("1") ? "green" : "amber" %>-100 px-2 py-0.5 text-<%= ccaList.get(i).availableForRegistration.equals("1") ? "green" : "amber" %>-800"><%= ccaList.get(i).availableForRegistration.equals("1") ? "AVAILABLE" : "NOT AVAILABLE" %></span></td>
                    <%
                        // Assuming ccaList.get(i).startTime is a String representing the time in 24-hour format (e.g., "14:30")
                        String startTime = ccaList.get(i).startTime;

                        // Parsing the time string to a Date object
                        java.text.DateFormat df24 = new java.text.SimpleDateFormat("HH:mm");
                        java.util.Date date = df24.parse(startTime);

                        // Formatting the Date object into a 12-hour format
                        java.text.DateFormat df12 = new java.text.SimpleDateFormat("hh:mm a");
                        String startTime12Hour = df12.format(date);
                    %>
                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell"><%= startTime12Hour %></td>
<%--                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell"><%=ccaList.get(i).startTime%></td>--%>
                    <%
                        // Assuming ccaList.get(i).startTime is a String representing the time in 24-hour format (e.g., "14:30")
                        String endTime = ccaList.get(i).endTime;

                        // Parsing the time string to a Date object
                        java.text.DateFormat edf24 = new java.text.SimpleDateFormat("HH:mm");
                        java.util.Date date1 = edf24.parse(endTime);

                        // Formatting the Date object into a 12-hour format
                        java.text.DateFormat edf12 = new java.text.SimpleDateFormat("hh:mm a");
                        String endTime12Hour = edf12.format(date1);
                    %>
                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell"><%= endTime12Hour %></td>
<%--                    <td class="whitespace-no-wrap hidden py-4 text-sm font-normal text-gray-500 sm:px-3 lg:table-cell"><%=ccaList.get(i).endTime%></td>&ndash;%&gt;--%>

                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell"><%=ccaList.get(i).day%></td>
                    <td class="whitespace-no-wrap hidden py-4 text-left text-sm text-gray-600 sm:px-3 lg:table-cell lg:text-left"><a href="/cca/view/<%=ccaList.get(i).id%>" class="text-amber-700">View </a><a href="/cca/edit/<%=ccaList.get(i).id%>" class="text-blue-700"> Edit</a></td>
                </tr>
                <%}%>

                </tbody>

            </table>
        </div>
    </div>
</div>
</body>
</html>
