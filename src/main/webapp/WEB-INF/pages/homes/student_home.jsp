<%--
  Created by IntelliJ IDEA.
  User: NITRO
  Date: 2023-11-13
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="beans.User" %>
<%@ page import="beans.Cca" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Cca> myCcas = (List<Cca>) request.getAttribute("myCcas");%>
<%User currentUser = (User) request.getAttribute("currentUser");%>
<html>
<head>
    <%@include file="../../header.jsp" %>
    <title>Title</title>
</head>
<body>
<%@include file="../../navbar.jsp" %>
<!-- component -->
<html>
<head>
    <!-- JIT SUPPORT, for using peer-* below -->
    <script src="https://unpkg.com/tailwindcss-jit-cdn"></script>
</head>
<body>

<div class="max-w-screen-xl mx-auto p-5 sm:p-10 md:p-16">
    <%if(request.getAttribute("success") != null) {%>
    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
        <strong class="font-bold">Success!</strong>
        <span class="block sm:inline"><%=request.getAttribute("success")%></span>
        <span class="absolute top-0 bottom-0 right-0 px-4 py-3">
    <svg class="fill-current h-6 w-6 text-red-500" role="button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><title>Close</title><path d="M14.348 14.849a1.2 1.2 0 0 1-1.697 0L10 11.819l-2.651 3.029a1.2 1.2 0 1 1-1.697-1.697l2.758-3.15-2.759-3.152a1.2 1.2 0 1 1 1.697-1.697L10 8.183l2.651-3.031a1.2 1.2 0 1 1 1.697 1.697l-2.758 3.152 2.758 3.15a1.2 1.2 0 0 1 0 1.698z"/></svg>
  </span>
    </div>
    <%}%>
    <div class="grid sm:grid-cols-1 xl:grid-cols-2">
        <!-- First column -->
        <div class="p-3 relative">
            <div class="mb-2 max-w-md">
                <div class="bg-white shadow-xl rounded-lg py-3">
                    <div class="photo-wrapper p-2">
                        <img class="w-24 h-24 rounded-full mx-auto" src="https://cdn4.vectorstock.com/i/1000x1000/06/18/male-avatar-profile-picture-vector-10210618.jpg" alt="John Doe">
                    </div>
                    <div class="p-2">
                        <h3 class="text-center text-xl text-gray-900 font-medium leading-8"><%=currentUser.name%></h3>
                        <div class="text-center text-gray-400 text-xs font-semibold">
                            <p><%=currentUser.className%></p>
                        </div>
                        <table class="text-xs my-3">
                            <tbody>
                            <tr>
                                <td class="px-2 py-2 text-gray-500 font-semibold">Email</td>
                                <td class="px-2 py-2"><%=currentUser.email%></td>
                            </tr>
                            </tbody></table>
                    </div>
                </div>
            </div>
            <h2 class="hover:cursor-pointer mt-2 py-2 text-gray-900 font-bold text-lg tracking-tight">CCA schedule</h2>
            <div class="max-w-md" style="scroll-snap-type: x mandatory;">
                <div class=""> <input class="sr-only peer" type="radio" name="carousel" id="carousel-1" checked />
                    <div class="bg-white rounded-lg shadow-lg transition-all duration-300 opacity-0 peer-checked:opacity-100 peer-checked:z-10 z-0">
                        <%for(int i = 0; i < myCcas.size(); i++) {%>
                            <div class="py-4 px-8">
                                <h3 class="hover:cursor-pointer mt-2 text-gray-900 font-bold text-2xl tracking-tight"><%= myCcas.get(i).name%></h3>
                                <p class="hover:cursor-pointer py-3 text-gray-600 leading-6">Time: <%= myCcas.get(i).startTime%> PM - <%= myCcas.get(i).endTime%> PM   <br>Advisor: <%= myCcas.get(i).advisorName%>   <br>
                                </p>
                            </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
        <!-- First column -->

        <!-- Second column -->
        <div class="grid grid-cols-1 md:grid-cols-2 sm:grid-cols-2 gap-10">
            <div class="rounded overflow-hidden shadow-lg">

                <a href="/cca/registration_list"></a>
                <div class="relative">
                    <a href="/cca/registration_list">
                        <img class="w-full"
                             src="https://t4.ftcdn.net/jpg/01/37/99/19/360_F_137991975_tIjkinFkSndkygpP6Me98S7DXC0pRHwA.jpg"
                             alt="Sunset in the mountains">
                        <div
                                class="hover:bg-transparent transition duration-300 absolute bottom-0 top-0 right-0 left-0 bg-gray-900 opacity-25">
                        </div>
                    </a>
                </div>
                <div class="px-6 py-4">
                    <a href="/cca/registration_list" class="font-semibold text-lg inline-block hover:text-indigo-600 transition duration-500 ease-in-out">Register CCA</a>
                    <p class="text-gray-500 text-sm">Choose co-curriculum activities to participate in</p>
                </div>
            </div>
            <div class="rounded overflow-hidden shadow-lg">

                <a href="/user/change_user_password"></a>
                <div class="relative">
                    <a href="/user/change_user_password">
                        <img class="w-full"
                             src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTP-MGisbX1ZingkwQNhlrcMdtyK_re0h_XGBN7Oqt1D2jWJJraNZb_0-P6vBXEihF-vk&usqp=CAU"
                             alt="Sunset in the mountains">
                        <div
                                class="hover:bg-transparent transition duration-300 absolute bottom-0 top-0 right-0 left-0 bg-gray-900 opacity-25">
                        </div>
                    </a>
                </div>
                <div class="px-6 py-4">
                    <a href="/user/change_user_password>" class="font-semibold text-lg inline-block hover:text-indigo-600 transition duration-500 ease-in-out">Edit Profile</a>
                    <p class="text-gray-500 text-sm">Change email or password.</p>
                </div>
            </div>
            <div class="rounded overflow-hidden shadow-lg">
                <button class="" onclick="showDialog()">
                    <div class="relative">
                            <img class="w-full"
                                 src="https://static1.bigstockphoto.com/9/0/2/large1500/209635453.jpg"
                                 alt="Sunset in the mountains">
                            <div
                                    class="hover:bg-transparent transition duration-300 absolute bottom-0 top-0 right-0 left-0 bg-gray-900 opacity-25">
                            </div>
                        </a>
                    </div>
                    <div class="px-6 py-4">
                        <a href="#" class="font-semibold text-lg inline-block hover:text-indigo-600 transition duration-500 ease-in-out">View Classmates</a>
                        <p class="text-gray-500 text-sm">View students who belongs to the same class</p>
                    </div>
                </button>

            </div>

        </div>
        <!-- Second column -->
    </div>
</div>

<!-- Modal Overlay and Content -->
<div id="dialog" class="fixed left-0 top-0 backdrop-blur-xl opacity-100 hidden w-screen h-screen transition-opacity duration-500" onclick="hideDialog()">
    <div class="bg-white rounded shadow-md p-8 mx-auto my-20 w-1/4">
        <table class="min-w-full border-collapse border-spacing-y-2 border-spacing-x-2">
            <thead class="hidden border-b lg:table-header-group">
            <tr class="">
                <td class="whitespace-normal py-4 text-sm font-semibold text-gray-800 sm:px-3">My Classmates</td>
            </tr>
            </thead>

            <tbody class="bg-white lg:border-gray-300">
            <%List<User> classMates = (List<User>) request.getAttribute("classMates");%>
            <%for(int i = 0; i < classMates.size(); i++) {%>
            <tr class="">
                <td class="whitespace-no-wrap hidden py-4 text-sm font-normal text-gray-600 sm:px-3 lg:table-cell">  <%= i+1 %>) <%=classMates.get(i).name%></td>
            </tr>
            <%}%>

            </tbody>
        </table>
        <div class="flex justify-end gap-4 mt-5">
            <button class="bg-gray-100 border border-gray-300 px-6 py-2 rounded text-black hover:bg-gray-200" onclick="hideDialog()">OK</button>
        </div>
    </div>
</div>
</body>
<script>
    function showDialog() {
        let dialog = document.getElementById('dialog');
        dialog.classList.remove('hidden');
    }

    function hideDialog() {
        let dialog = document.getElementById('dialog');
        dialog.classList.add('hidden');
    }
</script>
</html>
