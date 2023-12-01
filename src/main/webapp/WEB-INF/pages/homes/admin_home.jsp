<%--
  Created by IntelliJ IDEA.
  User: NITRO
  Date: 2023-11-13
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="beans.AdminDashboardData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%AdminDashboardData adminDashboardData = (AdminDashboardData) request.getAttribute("adminDashboardData");%>
<html>
<head>
    <%@include file="../../header.jsp" %>
    <title>Title</title>
</head>
<body>
    <%@include file="../../navbar.jsp" %>
    <div class="bg-gray-100">
        <div class="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
            <div class="mx-auto max-w-2xl py-16 sm:py-24 lg:max-w-none lg:py-16">
                <h2 class="text-2xl font-bold text-gray-900">My Dashboard</h2>

                <div class="bg-gray-100 mt-6 space-y-12 lg:grid lg:grid-cols-4 lg:gap-x-2 lg:space-y-0">
                    <div class="w-fit rounded-[25px] bg-white p-8 aspect">
                        <div class="h-12">
                            <svg class="h-full fill-white stroke-blue-500" xmlns="http://www.w3.org/2000/svg" fill="none"
                                 viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-6 w-6">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z" />
                            </svg>
                        </div>
                        <div class="my-2">
                            <h2 class="text-4xl font-bold"><%=adminDashboardData.totalStudents%></h2>
                        </div>

                        <div>
                            <p class="mt-2 font-sans text-base font-medium text-gray-500">Total Students</p>
                        </div>
                    </div>
                    <div class="w-fit rounded-[25px] bg-white p-8 aspect">
                        <div class="h-12">
                            <svg class="h-full fill-white stroke-blue-500" xmlns="http://www.w3.org/2000/svg" fill="none"
                                 viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-6 w-6">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z" />
                            </svg>
                        </div>
                        <div class="my-2">
                            <h2 class="text-4xl font-bold"><%=adminDashboardData.totalAdvisors%></h2>
                        </div>

                        <div>
                            <p class="mt-2 font-sans text-base font-medium text-gray-500">Total Advisors</p>
                        </div>
                    </div>
                    <div class="w-fit rounded-[25px] bg-white p-8 aspect">
                        <div class="h-12">
                            <svg class="h-full fill-white stroke-blue-500" xmlns="http://www.w3.org/2000/svg" fill="none"
                                 viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-6 w-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 10.5v6m3-3H9m4.06-7.19l-2.12-2.12a1.5 1.5 0 00-1.061-.44H4.5A2.25 2.25 0 002.25 6v12a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18V9a2.25 2.25 0 00-2.25-2.25h-5.379a1.5 1.5 0 01-1.06-.44z" />
                            </svg>

                        </div>
                        <div class="my-2">
                            <h2 class="text-4xl font-bold"><%=adminDashboardData.totalCCas%></h2>
                        </div>

                        <div>
                            <p class="mt-2 font-sans text-base font-medium text-gray-500">Total Cca</p>
                        </div>
                    </div>
                    <div class="w-fit rounded-[25px] bg-white p-8 aspect">
                        <div class="h-12">
                            <svg class="h-full fill-white stroke-blue-500" xmlns="http://www.w3.org/2000/svg" fill="none"
                                 viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-6 w-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m5.231 13.481L15 17.25m-4.5-15H5.625c-.621 0-1.125.504-1.125 1.125v16.5c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9zm3.75 11.625a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z" />
                            </svg>

                        </div>
                        <div class="my-2">
                            <h2 class="text-4xl font-bold"><%=adminDashboardData.totalClasses%></h2>
                        </div>

                        <div>
                            <p class="mt-2 font-sans text-base font-medium text-gray-500">Total Classes</p>
                        </div>
                    </div>
                </div>


                <div class="mt-6 space-y-12 lg:grid lg:grid-cols-3 lg:gap-x-6 lg:space-y-0">
                    <div class="group relative">
                        <div class="relative h-80 w-full overflow-hidden rounded-lg bg-white sm:aspect-h-1 sm:aspect-w-2 lg:aspect-h-1 lg:aspect-w-1 group-hover:opacity-75 sm:h-64">
                            <img src="https://media.istockphoto.com/id/1355227054/photo/businessman-working-on-office-desk-and-analyzing-new-project-of-accounting-finance-investment.jpg?s=612x612&w=0&k=20&c=HnRMnuo7_8dMPzJY8PUGZgrWto03XZRbO7TR9u9vk8I=" alt="Desk with leather desk pad, walnut desk organizer, wireless keyboard and mouse, and porcelain mug." class="h-full w-full object-cover object-center">
                        </div>
                        <h3 class="mt-6 text-sm text-gray-500">
                            <a href="user/index">
                                <span class="absolute inset-0"></span>
                               User Management
                            </a>
                        </h3>
                        <p class="text-base font-semibold text-gray-900">Manage user details</p>
                    </div>
                    <div class="group relative">
                        <div class="relative h-80 w-full overflow-hidden rounded-lg bg-white sm:aspect-h-1 sm:aspect-w-2 lg:aspect-h-1 lg:aspect-w-1 group-hover:opacity-75 sm:h-64">
                            <img src="https://t3.ftcdn.net/jpg/00/93/96/96/360_F_93969672_qYuLP5VhBcETsw2s5HFozdiqmaZa3H4k.jpg" alt="Wood table with porcelain mug, leather journal, brass pen, leather key ring, and a houseplant." class="h-full w-full object-cover object-center">
                        </div>
                        <h3 class="mt-6 text-sm text-gray-500">
                            <a href="/class/index">
                                <span class="absolute inset-0"></span>
                                Class Management
                            </a>
                        </h3>
                        <p class="text-base font-semibold text-gray-900">Manage classes</p>
                    </div>
                    <div class="group relative">
                        <div class="relative h-80 w-full overflow-hidden rounded-lg bg-white sm:aspect-h-1 sm:aspect-w-2 lg:aspect-h-1 lg:aspect-w-1 group-hover:opacity-75 sm:h-64">
                            <img src="https://d138zd1ktt9iqe.cloudfront.net/media/seo_landing_files/file-co-curricular-banner-1600075133.jpg" alt="Collection of four insulated travel bottles on wooden shelf." class="h-full w-full object-cover object-center">
                        </div>
                        <h3 class="mt-6 text-sm text-gray-500">
                            <a href="/cca/index">
                                <span class="absolute inset-0"></span>
                                CCA Management
                            </a>
                        </h3>
                        <p class="text-base font-semibold text-gray-900">Manage CCAs</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
