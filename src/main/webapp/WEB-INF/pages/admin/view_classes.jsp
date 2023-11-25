<%--
  Created by IntelliJ IDEA.
  User: NITRO
  Date: 2023-11-13
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
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
    </div>
</div>

<div class="mx-auto max-w-sm px-4 sm:px-6 lg:px-8 lg:py-4">
    <div class="bg-white p-6 rounded-lg shadow-lg">
        <div class="flex items-baseline">
      <span class="bg-teal-200 text-teal-800 text-xs px-2 inline-block rounded-full  uppercase font-semibold tracking-wide">
        New
      </span>
        </div>

        <h4 class="mt-1 text-xl font-semibold uppercase leading-tight truncate">A random Title</h4>

        <div class="mt-1">
            $1800
            <span class="text-gray-600 text-sm">   /wk</span>
        </div>
        <div class="mt-4">
            <span class="text-teal-600 text-md font-semibold">4/5 ratings </span>
            <span class="text-sm text-gray-600">(based on 234 ratings)</span>
        </div>
    </div>
</div>

</body>
<script>

</script>
</html>
