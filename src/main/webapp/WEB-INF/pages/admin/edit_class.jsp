<%@ page import="java.util.List" %>
<%@ page import="beans.Class" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../header.jsp" %>
    <title>Edit Class</title>
</head>
<body>
<%@include file="../../navbar.jsp" %>
<%Class _class = (Class) request.getAttribute("class");%>
<div class="m-5 sm:m-5 xl:mx-24 xl:my-16">
    <form action="/class/update" method="POST" autocomplete="off">
        <input type="hidden" name="class_id" value="<%=_class.id%>">
        <div class="border-b border-gray-900/10 pb-12">
            <h2 class="text-base font-semibold leading-7 text-gray-900">Edit Class</h2>
            <p class="mt-1 text-sm leading-6 text-gray-600">Please fill-up the details at below.</p>

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
            <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                <div class="sm:col-span-6">
                    <label for="class-name" class="block text-sm font-medium leading-6 text-gray-900">Class name</label>
                    <div class="mt-2">
                        <input type="text" name="class_name" id="class-name" value="<%=_class.name%>" autocomplete="given-name" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                </div>
            </div>

        </div>

        <div class="mt-6 flex items-center justify-center gap-x-6">
            <button type="submit" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Save</button>
        </div>
    </form>
</div>
</body>

<script>
    new DataTable('#example');
</script>
</html>
