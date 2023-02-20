
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.DBConnection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>
<!DOCTYPE html>

<!--validation-->

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("loginPage.jsp");
    }
%>


<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao dao = new PostDao(DBConnection.getConnection());
    Post post = dao.getPostByPostId(postId);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= post.getpTitle()%></title>
        <!--CSS-->
        <link href="css/profileEditCSS.css" rel="stylesheet" type="text/css"/>
        <link href="css/techCss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .banner-background{
                clip-path: polygon(0% 0%, 75% 0%, 100% 50%, 75% 100%, 0% 100%);
            }
            .footer-size{
                height: 4.5rem;

            }
            .post-date{
                font-size: small;
                position: relative;
                bottom: 15px;
            }
            .post-user{
                font-weight: bold;
                text-decoration: none;
            }
            .profile-class{
                padding-right:10px;
            }
            .image-class{
                padding: 5px;
                margin-right: 10px;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <!--navabar-->
        
        <%@include file="navbar2.jsp" %>

        
        <!--end of navbar-->

        <!--main content of page-->

        <div class="row my-4">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="container card-header bg-dark text-white footer-size">
                        <div class="row">
                            <% UserDao dao1 = new UserDao(DBConnection.getConnection()); %>
                            <img class="mr-sm-2 ml-2"src="profile_pics/<%= dao1.getUserById(post.getUserId()).getUser_profile() %>" style="height: 40px;width: 40px; border-radius: 50%"/>
                                <div >
                                    <p><a href="#!" data-toggle="modal" data-target="#profile_modal" class="post-user "><%= dao1.getUserById(post.getUserId()).getUser_name() %></a> has posted</p>
                                    <i class="post-date"><%= user.getReg_date().toLocaleString()%></i>
                                </div>
                        </div>
                                
                                <!--add delete icon-->
                                <div >
                                    <!--<img src="img/delete.png" height="10px" width="10px" />-->
                                </div>
                    </div>
                    <div class="card-body">
                        <h3 class="pots-title"><%= post.getpTitle()%></h3>
                        <br>
                        <pre><p class="post-content"><%= post.getpContent()%></p></pre>
                        <br>
                        <h5>Code</h5>
                        <div class="post-code ">
                            <code><pre><%= post.getpCode()%></pre></code>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-md-4">
                                <%
                                    LikeDao ld = new LikeDao(DBConnection.getConnection());
                                %>
                                <a href="#" onclick="doLike(<%= post.getpId() %>,<%= user.getId() %>)" class="btn btn-outline-primary btn-sm"><b><i class="fa fa-heart-o"></i><span class="like-update">&nbsp;<%= ld.countLikes(postId) %></span></b></a>
                                &nbsp;<a href="#" class="btn btn-outline-primary btn-sm "><b><i class="fa fa-comment-o"> </i><span> 5</span></b></a>
                            </div>
                            <div class="col-md-8">
                                <!--<button type="button"  id="btn-post-back" class="btn btn-secondary float-right">Back</button>-->
                                <a class="btn btn-secondary float-right" href="loadPost.jsp" role="button">Back</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--end of main content of page-->

        <!-- start of profile modal -->

        <!-- Modal -->
        <div class="modal fade" id="profile_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header login-bg">
                        <h5 class="modal-title" id="exampleModalLongTitle">Tech Blog</h5>
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
                        </div>
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
        <script src="js/myJS.js" type="text/javascript"></script>
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
            function getPosts(catId, ref) {
                $('.c-link').removeClass('active');
                $('.c-link').removeClass('bg-dark');
                $.ajax({
                    url: "loadPost.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#show-post").html(data);
                        $(ref).addClass('bg-dark');
                        $(ref).addClass('active');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    }
                });
            }
            $(document).ready(function (e) {
                let allCatRef = $('.c-link')[0];
                getPosts(0, allCatRef);
            });
        </script>
    </body>
</html>
