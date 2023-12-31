<%@ page import="java.util.List" %>
<%@ page import="beans.Class" %>
<%@ page import="beans.Advisor" %>
<%@ page import="beans.Cca" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../header.jsp" %>
    <title>Edit CCA</title>
</head>
<body>
<%@include file="../../navbar.jsp" %>
<%Cca cca = (Cca) request.getAttribute("cca");%>
<div class="m-5 sm:m-5 xl:mx-24 xl:my-16">
    <form action="/cca/update" method="POST" autocomplete="off">
        <input type="hidden" name="cca_id" value="<%=cca.id%>">
        <div class="border-b border-gray-900/10 pb-12">
            <h2 class="text-base font-semibold leading-7 text-gray-900">Edit CCA</h2>
            <p class="mt-1 text-sm leading-6 text-gray-600">Please fill in the information required correctly.</p>
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

                <div class="sm:col-span-3 sm:col-start-1">
                    <label for="name" class="block text-sm font-medium leading-6 text-gray-900">Name</label>
                    <div class="mt-2">
                        <input type="text" name="name" id="name" value="<%=cca.name%>" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                    </div>
                </div>

                <div class="sm:col-span-3">
                    <label for="description" class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                    <div class="mt-2">
                        <input type="text" name="description" id="description" value="<%=cca.description%>" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                    </div>
                </div>

                <div class="sm:col-span-3">
                    <label for="quota" class="block text-sm font-medium leading-6 text-gray-900">Quota</label>
                    <div class="mt-2">
                        <select id="quota" name="quota" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                            <option value="30" <%=cca.quota.equals("30") ? "selected" : "" %>>30</option>
                            <option value="35" <%=cca.quota.equals("35") ? "selected" : "" %>>35</option>
                            <option value="40" <%=cca.quota.equals("40") ? "selected" : "" %>>40</option>
                        </select>
                    </div>
                </div>

                <div class="sm:col-span-3">
                    <label for="advisorId" class="block text-sm font-medium leading-6 text-gray-900">Advisor</label>
                    <div class="mt-2">
                        <select id="advisorId" name="advisor_id" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                            <option value="">Please Select</option>
                            <%List<Advisor> advisorList = (List<Advisor>) request.getAttribute("advisorList");%>
                            <%for(int i = 0; i < advisorList.size(); i++) {%>
                            <option <%=cca.advisorId.equals(advisorList.get(i).id) ? "selected" : "" %> value="<%=advisorList.get(i).id%>"><%=advisorList.get(i).name%></option>
                            <%}%>
                        </select>
                    </div>
                </div>

                <div class="sm:col-span-3">
                    <label for="year" class="block text-sm font-medium leading-6 text-gray-900">Year</label>
                    <div class="mt-2">
                        <input type="text" name="year" id="year" value="<%=cca.year%>" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                    </div>
                </div>

                <div class="sm:col-span-2">
                    <label for="available_for_registration" class="block text-sm font-medium leading-6 text-gray-900">Available for Registration</label>
                    <div class="mt-2">
                        <select id="active_status" name="available_for_registration" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                            <option value="1" <%=cca.availableForRegistration.equals("1") ? "selected" : "" %>>AVAILABLE</option>
                            <option value="0" <%=cca.availableForRegistration.equals("0") ? "selected" : "" %>>NOT AVAILABLE</option>
                        </select>
                    </div>
                </div>

                <div class="sm:col-span-3">
                    <label for="day" class="block text-sm font-medium leading-6 text-gray-900">Day</label>
                    <div class="mt-2">
                        <select id="day" name="day" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                            <option value="TUESDAY" <%=cca.day.equals("TUESDAY") ? "selected" : "" %>>TUESDAY</option>
                            <option value="THURSDAY" <%=cca.day.equals("THURSDAY") ? "selected" : "" %>>THURSDAY</option>
                        </select>
                    </div>
                </div>

                <div class="sm:col-span-3">
                    <label for="startTime" class="block text-sm font-medium leading-6 text-gray-900">Start Time</label>
                    <div class="mt-2">
                        <select id="startTime" name="start_time" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                            <option value="14:05" <%=cca.startTime.equals("14:05") ? "selected" : "" %>>2.05 pm</option>
                            <option value="15:00" <%=cca.startTime.equals("15:00") ? "selected" : "" %>>3.00 pm</option>
                            <option value="15:30" <%=cca.startTime.equals("15:30") ? "selected" : "" %>>3.30 pm</option>
                        </select>
                    </div>
                </div>

                <div class="sm:col-span-3">
                    <label for="endTime" class="block text-sm font-medium leading-6 text-gray-900">End Time</label>
                    <div class="mt-2">
                        <select id="endTime" name="end_time" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                            <option value="15:00" <%=cca.endTime.equals("15:00") ? "selected" : "" %>>3.00 pm</option>
                            <option value="16:00"<%=cca.endTime.equals("16:00") ? "selected" : "" %>>4.00 pm</option>
                            <option value="16:30" <%=cca.endTime.equals("16:30") ? "selected" : "" %>>4.30 pm</option>
                        </select>
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