<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup page</title>
        <!--CSS-->
        <link href="css/techCss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .banner-background{
                clip-path: polygon(0% 0%, 75% 0%, 100% 50%, 75% 100%, 0% 100%);
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->

        <%@include file="navbar.jsp" %>
        <main class="d-flex align-items-center bg-dark banner-background" style="height:100vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header login-bg text-center">
                                <span class="fa fa-user-circle fa-3x"></span>
                                <h1>Register here</h1>
                            </div>
                            <div class="card-body">
                                <form action="SignupServlet" method="POST" id="registerform">
                                    <div class="form-group">
                                        <label for="userName">User Name</label>
                                        <input type="text" class ="form-control" id="userName" name="user_name" placeholder="Enter User Name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" name="user_email" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" name="user_pass" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">Select Gender</label>
                                        <br>
                                        <input type="radio" id="gender"  name="gender_name" value="male" > Male
                                        <input type="radio" id="gender" name="gender_name" value="female"> Female
                                        <!--<input type="radio" id="gender" name="gender_name" value="other"> Other-->
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" name="user_check" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree term & conditions</label>
                                    </div>
                                    <div class="container text-center m-2" id="loader" style="display:none">
                                        <span class="fa fa-refresh fa-4x fa-spin"></span>
                                        <h2>Please wait...</h2>
                                    </div>
                                    <button type="submit" id="btn_submit" name="btn_signup" class="btn btn-primary" style="margin-top: 10px">SIGN UP</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--JavaScript-->
        <script
            src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                $('#registerform').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);
                    $("#btn_submit").hide();
                    $("#loader").show();
                    $.ajax({
                        url: 'SignupServlet',
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#btn_submit").show();
                            $("#loader").hide();
                            if(data.trim()==='Done'){
                                swal("Registered...")
                                    .then((value) => {
                                        window.location = "loginPage.jsp";
                                    });
                            }else{
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $("#btn_submit").show();
                            $("#loader").hide();
                            swal("Something went wrong. Try again!");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

        </script>
    </body>
</html>
