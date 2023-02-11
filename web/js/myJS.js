function doLike(postId, userId){
    //console.log(postId+","+userId);
    const d = {
        postId:postId,
        userId: userId,
        operation: 'like'
    };
    
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim()==='true'){
                let l = $(".like-update").html();
                console.log(l);
                l++;
                console.log(l);
                $(".like-update").html(l);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    });
}