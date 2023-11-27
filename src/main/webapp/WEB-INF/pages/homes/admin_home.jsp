<%--
  Created by IntelliJ IDEA.
  User: NITRO
  Date: 2023-11-13
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                            <img src="https://dscstudenthandbook.files.wordpress.com/2018/12/curricular-activities.jpg" alt="Collection of four insulated travel bottles on wooden shelf." class="h-full w-full object-cover object-center">
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
