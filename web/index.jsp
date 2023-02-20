<%-- 
    Document   : index
    Created on : 31 Jan 2023, 02:06:27
    Author     : bloototh music
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Study Point</title>
        <!--CSS-->
        <link href="css/techCss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .banner-background{
                clip-path: polygon(0% 0%, 75% 0%, 100% 50%, 75% 100%, 0% 100%);

            }
            body{
                background-color:  #2d9c4b;
            }
            
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/techCss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="navbar.jsp" %>

        <!-- Banner -->
        <div class="container-fluid p-0 m-0 bg-dark banner-background">
            <div class="jumbotron display-color text-white">
                <div class="container">
                    <h3 class="display-3">Welcome, to Study Point</h3>
                    <p>Welcome to Study Point, world of technology.
                        A programming language is a system of notation for writing computer programs. Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.
                    </p>
                    <p>The term computer language is sometimes used interchangeably with programming language. However, the usage of both terms varies among authors, including the exact scope of each.</p>

                    <button class="btn btn-outline-light btn-lg" style="margin-right: 10px"><span class="fa fa-user-plus">&nbsp;</span>Start, its free</button>
                    <a href="loginPage.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin">&nbsp;</span> Login</a>

                </div>
            </div>

        </div>
        <!-- cards -->
        <br>
        <div class="container">
            <div class="row ">
                <!--category-->
                <div class="col-md-4">
                    <div class="card card-color">
                        <div class="card-body">
                            <h5 class="card-title">Web Development</h5>
                            <p class="card-text">Website development is a catch-all term for the work that goes into building a website. This includes everything from markup and coding to scripting, network configuration.</p>
                            <a href="#" class="btn btn-primary bg-dark">Explore</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-color">
                        <div class="card-body">
                            <h5 class="card-title">Android Development</h5>
                            <p class="card-text">Android software development is the process by which applications are created for devices running the Android operating system.</p>
                            <a href="#" class="btn btn-primary bg-dark">Explore</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card card-color">
                        <div class="card-body">
                            <h5 class="card-title">Database Management System</h5>
                            <p class="card-text">A database management system (DBMS) is software to create and manage databases, allowing users to create, read, update and delete data in a database.</p>
                            <a href="#" class="btn btn-primary bg-dark">Explore</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card card-color">
                        <div class="card-body">
                            <h5 class="card-title">Operating System</h5>
                            <p class="card-text">An operating system is system software that manages computer hardware, software resources, and provides common services for computer programs.</p>
                            <a href="#" class="btn btn-primary bg-dark">Explore</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-color">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.</p>
                            <a href="#" class="btn btn-primary bg-dark">Explore</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-color">
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.</p>
                            <a href="#" class="btn btn-primary bg-dark">Explore</a>
                        </div>
                    </div>
                </div>
        <!--JavaScript-->
        <script
            src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
