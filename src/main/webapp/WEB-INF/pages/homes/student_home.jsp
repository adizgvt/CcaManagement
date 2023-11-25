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
<!-- component -->
<html>
<head>
    <!-- JIT SUPPORT, for using peer-* below -->
    <script src="https://unpkg.com/tailwindcss-jit-cdn"></script>
</head>
<body>

<div class="max-w-screen-xl mx-auto p-5 sm:p-10 md:p-16">
    <div class="grid grid-cols-2">
        <!-- First column -->
        <div class="p-3 relative">
            <div class="mb-2 max-w-md">
                <div class="bg-white shadow-xl rounded-lg py-3">
                    <div class="photo-wrapper p-2">
                        <img class="w-24 h-24 rounded-full mx-auto" src="https://www.gravatar.com/avatar/2acfb745ecf9d4dccb3364752d17f65f?s=260&d=mp" alt="John Doe">
                    </div>
                    <div class="p-2">
                        <h3 class="text-center text-xl text-gray-900 font-medium leading-8">Joh Doe</h3>
                        <div class="text-center text-gray-400 text-xs font-semibold">
                            <p>Web Developer</p>
                        </div>
                        <table class="text-xs my-3">
                            <tbody>
                            <tr>
                                <td class="px-2 py-2 text-gray-500 font-semibold">Phone</td>
                                <td class="px-2 py-2">+977 9955221114</td>
                            </tr>
                            <tr>
                                <td class="px-2 py-2 text-gray-500 font-semibold">Email</td>
                                <td class="px-2 py-2">john@exmaple.com</td>
                            </tr>
                            </tbody></table>
                    </div>
                </div>
            </div>
            <h2 class="hover:cursor-pointer mt-2 py-2 text-gray-900 font-bold text-lg tracking-tight">CCA schedule</h2>
            <div class="max-w-md" style="scroll-snap-type: x mandatory;">
                <!-- first -->
                <div class="">
                    <input class="sr-only peer" type="radio" name="carousel" id="carousel-1" checked />
                    <!-- content #1 -->
                    <div
                            class="bg-white rounded-lg shadow-lg transition-all duration-300 opacity-0 peer-checked:opacity-100 peer-checked:z-10 z-0">

                        <div class="py-4 px-8">
                            <h2 class="hover:cursor-pointer mt-2 text-gray-900 font-bold text-2xl tracking-tight">Football Club.</h2>
                            <p class="hover:cursor-pointer py-3 text-gray-600 leading-6">Time:2PM-5PM   <br>Teacher:zahar   <br>Participant: KAMAL, ALI, ABU

                            </p>
                        </div>
                        <!-- controls -->
                        <div class="w-full flex justify-between z-20">
                            <label for="carousel-3" class="inline-block text-red-600 cursor-pointer -translate-x-5 bg-white rounded-full shadow-md active:translate-y-0.5">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm.707-10.293a1 1 0 00-1.414-1.414l-3 3a1 1 0 000 1.414l3 3a1 1 0 001.414-1.414L9.414 11H13a1 1 0 100-2H9.414l1.293-1.293z" clip-rule="evenodd" />
                                </svg>
                            </label>
                            <label for="carousel-2" class="inline-block text-red-600 cursor-pointer translate-x-5 bg-white rounded-full shadow-md active:translate-y-0.5">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 1.414L10.586 9H7a1 1 0 100 2h3.586l-1.293 1.293a1 1 0 101.414 1.414l3-3a1 1 0 000-1.414z" clip-rule="evenodd" />
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- First column -->

        <!-- Second column -->
        <div class="grid grid-cols-1 md:grid-cols-2 sm:grid-cols-2 gap-10">
            <div class="rounded overflow-hidden shadow-lg">

                <a href="#"></a>
                <div class="relative">
                    <a href="#">
                        <img class="w-full"
                             src="https://images.pexels.com/photos/196667/pexels-photo-196667.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=1&amp;w=500"
                             alt="Sunset in the mountains">
                        <div
                                class="hover:bg-transparent transition duration-300 absolute bottom-0 top-0 right-0 left-0 bg-gray-900 opacity-25">
                        </div>
                    </a>
                </div>
                <div class="px-6 py-4">
                    <a href="#" class="font-semibold text-lg inline-block hover:text-indigo-600 transition duration-500 ease-in-out">Register CCA</a>
                    <p class="text-gray-500 text-sm">Choose co-curriculum activities to participate in</p>
                </div>
            </div>
            <div class="rounded overflow-hidden shadow-lg">

                <a href="#"></a>
                <div class="relative">
                    <a href="#">
                        <img class="w-full"
                             src="https://images.pexels.com/photos/196667/pexels-photo-196667.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=1&amp;w=500"
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
            </div>
            <div class="rounded overflow-hidden shadow-lg">

                <a href="#"></a>
                <div class="relative">
                    <a href="#">
                        <img class="w-full"
                             src="https://images.pexels.com/photos/196667/pexels-photo-196667.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=1&amp;w=500"
                             alt="Sunset in the mountains">
                        <div
                                class="hover:bg-transparent transition duration-300 absolute bottom-0 top-0 right-0 left-0 bg-gray-900 opacity-25">
                        </div>
                    </a>
                </div>
                <div class="px-6 py-4">
                    <a href="#" class="font-semibold text-lg inline-block hover:text-indigo-600 transition duration-500 ease-in-out">View joined CCA</a>
                    <p class="text-gray-500 text-sm">View details about the CCAs you join.</p>
                </div>
            </div>
            <div class="rounded overflow-hidden shadow-lg">

                <a href="#"></a>
                <div class="relative">
                    <a href="#">
                        <img class="w-full"
                             src="https://images.pexels.com/photos/196667/pexels-photo-196667.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=1&amp;w=500"
                             alt="Sunset in the mountains">
                        <div
                                class="hover:bg-transparent transition duration-300 absolute bottom-0 top-0 right-0 left-0 bg-gray-900 opacity-25">
                        </div>
                    </a>
                </div>
                <div class="px-6 py-4">
                    <a href="#" class="font-semibold text-lg inline-block hover:text-indigo-600 transition duration-500 ease-in-out">Edit Profile</a>
                    <p class="text-gray-500 text-sm">Change email or password.</p>
                </div>
            </div>
        </div>
        <!-- Second column -->
    </div>


</div>
</body>
</html>
</body>
</html>
