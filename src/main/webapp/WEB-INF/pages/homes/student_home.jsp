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
<div class="min-h-screen bg-gray-100 p-3 relative">
    <div class="w-96 mx-auto" style="scroll-snap-type: x mandatory;">
        <!-- first -->
        <div class="">
            <input class="sr-only peer" type="radio" name="carousel" id="carousel-1" checked />
            <!-- content #1 -->
            <div
                    class="w-96 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-white rounded-lg shadow-lg transition-all duration-300 opacity-0 peer-checked:opacity-100 peer-checked:z-10 z-0">

                <div class="py-4 px-8">
                    <h1 class="hover:cursor-pointer mt-2 text-gray-900 font-bold text-2xl tracking-tight">Football Club.
                    </h1>
                    <p class="hover:cursor-pointer py-3 text-gray-600 leading-6">Time:2PM-5PM   <br>Teacher:zahar   <br>Participant: KAMAL, ALI, ABU

                    </p>
                </div>
                <!-- controls -->
                <div class="absolute top-1/2 w-full flex justify-between z-20">
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
        <!-- second -->
        <div class="">
            <input class="sr-only peer" type="radio" name="carousel" id="carousel-2" />
            <!-- content #2 -->
            <div
                    class="w-96 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-white rounded-lg shadow-lg transition-all duration-300 opacity-0 peer-checked:opacity-100 peer-checked:z-10 z-0">
                <img class="rounded-t-lg w-96 h-64" src="https://previews.123rf.com/images/butenkow/butenkow1612/butenkow161202060/67425695-pattern-design-music-logo-vector-illustration-of-icon.jpg" alt="" />
                <div class="py-4 px-8">
                    <h1 class="hover:cursor-pointer mt-2 text-gray-900 font-bold text-2xl tracking-tight">
                        Scelerisque eleifend donec pretium vulputate sapien.
                    </h1>
                    <p class="hover:cursor-pointer py-3 text-gray-600 leading-6">Egestas diam in arcu cursus euismod
                        quis. Fusce id velit ut tortor. Congue quisque egestas diam in arcu cursus euismod quis.
                    </p>
                </div>
                <!-- controls -->
                <div class="absolute top-1/2 w-full flex justify-between z-20">
                    <label for="carousel-1" class="inline-block text-blue-600 cursor-pointer -translate-x-5 bg-white rounded-full shadow-md active:translate-y-0.5">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm.707-10.293a1 1 0 00-1.414-1.414l-3 3a1 1 0 000 1.414l3 3a1 1 0 001.414-1.414L9.414 11H13a1 1 0 100-2H9.414l1.293-1.293z" clip-rule="evenodd" />
                        </svg>
                    </label>
                    <label for="carousel-3" class="inline-block text-blue-600 cursor-pointer translate-x-5 bg-white rounded-full shadow-md active:translate-y-0.5">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 1.414L10.586 9H7a1 1 0 100 2h3.586l-1.293 1.293a1 1 0 101.414 1.414l3-3a1 1 0 000-1.414z" clip-rule="evenodd" />
                        </svg>
                    </label>
                </div>
            </div>
        </div>
        <!-- three -->
        <div class="">
            <input class="sr-only peer" type="radio" name="carousel" id="carousel-3" />
            <!-- content #3 -->
            <div
                    class="w-96 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-white rounded-lg shadow-lg transition-all duration-300 opacity-0 peer-checked:opacity-100 peer-checked:z-10 z-0">
                <img class="rounded-t-lg w-96 h-64" src="https://i.pinimg.com/564x/86/77/f9/8677f97be55c6a1637f67abb7d2e5360.jpg" alt="" />
                <div class="py-4 px-8">
                    <h1 class="hover:cursor-pointer mt-2 text-gray-900 font-bold text-2xl tracking-tight">
                        Consectetur purus ut faucibus pulvinar elementum.
                    </h1>
                    <p class="hover:cursor-pointer py-3 text-gray-600 leading-6">Aliquam ultrices sagittis orci a
                        scelerisque purus semper. Quisque id diam vel quam elementum pulvinar. Facilisis magna etiam
                        tempor orci eu lobortis elementum.
                    </p>
                </div>
                <!-- controls -->
                <div class="absolute top-1/2 w-full flex justify-between z-20">
                    <label for="carousel-2" class="inline-block text-yellow-600 cursor-pointer -translate-x-5 bg-white rounded-full shadow-md active:translate-y-0.5">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm.707-10.293a1 1 0 00-1.414-1.414l-3 3a1 1 0 000 1.414l3 3a1 1 0 001.414-1.414L9.414 11H13a1 1 0 100-2H9.414l1.293-1.293z" clip-rule="evenodd" />
                        </svg>
                    </label>
                    <label for="carousel-1" class="inline-block text-yellow-600 cursor-pointer translate-x-5 bg-white rounded-full shadow-md active:translate-y-0.5">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 1.414L10.586 9H7a1 1 0 100 2h3.586l-1.293 1.293a1 1 0 101.414 1.414l3-3a1 1 0 000-1.414z" clip-rule="evenodd" />
                        </svg>
                    </label>
                </div>
            </div>
        </div>
    </div>
</div>
<a href="https://www.buymeacoffee.com/dgauderman" target="_blank" class="md:absolute bottom-0 right-0 p-4 float-right animate-bounce">
    <img src="https://www.buymeacoffee.com/assets/img/guidelines/logo-mark-3.svg" alt="Buy Me A Coffee" class="transition-all rounded-full w-14 -rotate-45 hover:shadow-sm shadow-lg ring hover:ring-4 ring-white">
</a>
</body>
</html>
</body>
</html>
