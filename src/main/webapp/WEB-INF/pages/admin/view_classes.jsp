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
