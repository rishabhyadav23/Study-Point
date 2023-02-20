<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.DBConnection"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<div class="row">

    <%

        PostDao dao = new PostDao(DBConnection.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> post = null;
        if (cid == 0) {
            post = dao.getAllPosts();
        } else {
            post = dao.getPostByCatId(cid);
        }

        if (post.size() == 0) {
            out.println("<h3 class='display-1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Empty Field...</h3>");
            return;
        }

        for (Post p : post) {
    %>

    <div class="col-md-6 mt-2">

        <div class="card m-2">
            <img class="card-img-top img-fluid" src="blogPics/<%= p.getpPic()%>" alt="Card image cap" >
            <!--card header-->
            <div class="card-body">
                <h6><%= p.getpTitle()%></h6>

                <p><%= p.getpContent()%></p>
                <code><%= p.getpCode()%></code>
            </div>
            <!-- card footer -->
            <div class="card-footer text-center">

                <a href="show_post.jsp?post_id=<%= p.getpId() %>" class="btn btn-primary btn-sm">Read More...</a>
                <a href="#" class="btn btn-outline-primary btn-sm "><b><i class="fa fa-heart-o"></i><span> 10</span></b></a>
                <a href="#" class="btn btn-outline-primary btn-sm "><b><i class="fa fa-comment-o"> </i><span> 5</span></b></a>
            </div>
        </div>
    </div>
    <%
        }

    %>
</div>