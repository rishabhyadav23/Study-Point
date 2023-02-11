<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! something went wrong</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .banner-background{
               clip-path: polygon(0% 0%, 75% 0%, 100% 50%, 75% 100%, 0% 100%);

            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid p-2 " style="height:400px"/>
            <br>
            <h3 class="display-3">Sorry! Something went wrong</h3>
            <%= exception%>
            <a href="index.jsp" class="btn btn-lg bg-dark text-white m-2">Home</a>
        </div>
    </body>
</html>
