
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.DBConnection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("loginPage.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>profile</title>

        <!--CSS-->
        <link href="css/profileEditCSS.css" rel="stylesheet" type="text/css"/>
        <link href="css/techCss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .banner-background{
                clip-path: polygon(0% 0%, 75% 0%, 100% 50%, 75% 100%, 0% 100%);

            }
            .bar-color{
                background-color: #2d9c4b !important;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <!-- navbar -->
        
        <%@include file="navbar2.jsp" %>
        <!-- end of navbar -->

        <%
            Message msg = (Message) session.getAttribute("msg");
            //msg = null;
            if (msg != null) {

        %>   
        <div class="alert <%= msg.getCssClass()%>" role="alert"><%= msg.getContent()%></div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <!--main body of program-->

        <main>
            <div style="margin-right: 10px">
                <div class="row">
                    <!--category column-->
                    <div class="col-md-4 display-color">

                        <div class="list-group mt-3 ">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active display-color" >
                                All Posts
                            </a>

                            <!--fetch all categories-->
                            <%
                                PostDao dao = new PostDao(DBConnection.getConnection());
                                ArrayList<Category> list1 = dao.getAllCategories();
                                for (Category cat : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= cat.getCid() %>,this)" class="c-link list-group-item list-group-item-action display-color"><%= cat.getName()%></a>
                            <%
                                }
                            %>

                        </div>

                    </div>

                    <!--posts column-->
                    <div class="col-md-8">
                        <div class="container text-center mt-3" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="show-post"></div>
                    </div>
                </div>
            </div>
        </main>

        <!--end of main body of program-->

        <!-- start of profile modal -->

        <!-- Modal -->
        <div class="modal fade" id="profile_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header login-bg">
                        <h5 class="modal-title" id="exampleModalLongTitle"><span class="fa fa-dot-circle-o"></span> Study-Point</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">

                            <div class="container" id="profile-pic">
                                <img src="profile_pics/<%= user.getUser_profile()%>"  class="img-fluid" style="height: 70px; width: 70px; margin-bottom: 10px; border-radius: 50%"/>
                                <h5><%= user.getUser_name()%></h5>
                            </div>


                            <!-- profile details -->

                            <div id="profile-table">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">E-mail:</th>
                                            <td><%= user.getUser_email()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on:</th>
                                            <td><%= user.getReg_date()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- edit detail -->
                            <div id="edit-profile" style="display:none">

                                <form action="EditServlet" id="editform" method="post" enctype="multipart/form-data">
                                    <img src="profile_pics/<%= user.getUser_profile()%>" id="profile-edit-pic"  class="img-fluid" style="height: 70px; width: 70px; position: relative; top: 0; left: 0; margin-bottom: 10px; border-radius: 50%; display: none"/>
                                    <img src="img/editing.png" id="upload-button" style="height: 20px; width: 20px; position: absolute; top: 60px; left: 270px; display: none"/>
                                    <input type="file" id="file-upload" name="image"style="display: none"/>
                                    <h3>Edit here</h3>
                                    <table class="table">
                                        <tr>
                                            <th>User Name :</th>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getUser_name()%>"></td>
                                        </tr>
                                        <tr>
                                            <th>E-mail :</th>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getUser_email()%>"></td>
                                        </tr>
                                        <tr>
                                            <th>Password :</th>
                                            <td><input type="password" class="form-control" name="password" value="<%= user.getUser_pass()%>"></td>
                                        </tr>
                                        <tr>
                                            <th>Gender :</th>
                                            <td>
                                                <!--editable bnana hai-->
                                                <%= user.getGender()%>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container text-right" id="edit-btns">
                                        <button type="button" id="btn-back" class="btn btn-secondary" style="display:none; align-self: end">Back</button>&nbsp;&nbsp;
                                        <button type="submit" id="btn-save" class="btn btn-primary" style="display: none">Save</button>
                                    </div>
                                </form>
                            </div>           
                        </div>
                    </div>
                    <div class="modal-footer" id="footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="btn-edit-profile" class="btn btn-primary"">Edit</button>
                    </div>
                </div>
            </div>
        </div>



        <!-- end of profile modal -->


        <!-- start of post modal -->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Create a Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="AddPostServlet" id="add-post-form" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select category---</option>

                                    <%
                                        PostDao pd = new PostDao(DBConnection.getConnection());
                                        ArrayList<Category> list = pd.getAllCategories();
                                        for (Category c : list) {

                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>


                            <div class="form-group">
                                <input type="text" name="pTitle" placeholder="Enter Post Title" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <textarea placeholder="Enter Post Content" name="pContent" class="form-control"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea placeholder="Enter your code (if any)" name="pCode" class="form-control"></textarea>
                            </div>
                            <div class="form-group">
                                <label><b>Select your pic:</b></label>
                                &nbsp; &nbsp; &nbsp;
                                <input type="file" name="pPic"/>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- end of post modal -->

        <!--JavaScript-->
        <script
            src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
        crossorigin="anonymous"></script>
        <script src="js/profileEditJS.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {

                let editFlag = false;
                $('#btn-edit-profile').click(function () {

                    if (editFlag === false) {

                        $('#profile-table').hide();
                        $('#edit-profile').show();
                        editFlag = true;
                        $('#footer').hide();
                        $('#profile-pic').hide();
                        $('#edit-btns').show();
                        $('#btn-back').show();
                        $('#btn-save').show();
                        $('#profile-edit-pic').show();
                        $('#upload-button').show();
                        //$('#profilepicedit').show();
                        //$('#upload-button').show();

                        //action on back button
                        $('#btn-back').click(function () {
                            $('#profile-table').show();
                            $('#edit-profile').hide();
                            editFlag = false;
                            $('#footer').show();
                            $('#profile-pic').show();
                            $('#btn-back').hide();
                            $('#btn-save').hide();
                            $('#profile-edit-pic').hide();
                            $('#upload-button').hide();
                            //$('#profilepicedit').show();
                            //$('#upload-button').hide();
                        });
                    }
                });

            });

        </script>

        <!-- add post script -->

        <script>
            $(document).ready(function (e) {
                $('#add-post-form').on('submit', function (event) {
                    event.preventDefault();
                    console.log("posted");
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //succss
                            console.log(data);
                            if (data.trim() === 'done') {
                                swal("Good Job!", "Posted Successfully !", "success");
                            } else {
                                swal("Error!", "Something went wrong!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            swal("Error!", "Something went wrong!", "error");
                            //error
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        
        <!--loading post-->
        
        <script>
            function getPosts (catId,ref){
                $('.c-link').removeClass('active');
                $('.c-link').removeClass('bar-color');
                $.ajax({
                    url: "loadPost.jsp",
                    data: {cid:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#show-post").html(data);
                        $(ref).addClass('bar-color');
                        $(ref).addClass('active');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    }
                });
            }
            $(document).ready(function(e){
                let allCatRef = $('.c-link')[0];
                getPosts(0,allCatRef);
            });
        </script>
    </body>
</html>
