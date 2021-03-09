<cfoutput>
    <article>
		<h2>
            #prc.post.getTitle()#
            <cfif auth().check() AND prc.post.getAuthor().isSameAs( auth().user() )>
                <a title="Edit Post" href="#event.buildLink( "posts.#prc.post.getId()#.edit")#">
                    <small class="h6">Edit</small>
                </a>
            </cfif>
        </h2>
		<small class="mb-4">By #prc.post.getAuthor().getFullName()#</small>
        <div class="mb-4">
            <cfloop array="#prc.post.getTags()#" index="tag">
                <span class="badge badge-pill badge-primary">#tag.getName()#</span>
            </cfloop>
        </div>
        <p>#prc.post.getBody()#</p>
    </article>
    <form id="likeForm">
        <cfif NOT auth().check()>
            <button title="Log in to like this post" type="submit" class="btn btn-outline-secondary" disabled>
                <i class="far fa-thumbs-up"></i> Like
            </button>
        <cfelseif prc.post.hasLikeFrom( auth().user() )>
            <input type="hidden" name="liked" value="true" />
            <button name="submit" type="submit" class="btn btn-success">
                <i id="like-icon" class="fas fa-thumbs-up"></i>
                Like
                <span id="likes-count" class="ml-2 badge badge-dark">#prc.post.getLikesCount()#</span>
            </button>
        <cfelse>
            <input type="hidden" name="liked" value="false" />
            <button name="submit" type="submit" class="btn btn-outline-secondary">
                <i id="like-icon" class="far fa-thumbs-up"></i>
                Like
                <span id="likes-count" class="ml-2 badge badge-dark">#prc.post.getLikesCount()#</span>
            </button>
        </cfif>
    </form>
	<a href="#event.buildLink( "posts" )#">Back</a>
    <hr />
	<h3>Comments (#prc.post.getCommentsCount()#)</h3>
    <cfif prc.post.getComments().isEmpty()>
	    <div class="card card-body bg-light mb-2">
	        <p>No comments yet.</p>
	    </div>
	<cfelse>
	    <cfloop array="#prc.post.getComments()#" index="comment">
	        <div class="card card-body bg-light mb-2">
	            <small>#dateTimeFormat( comment.getCreatedDate(), "full" )# by #comment.getCommenter().getFullName()#</small>
	            <p>#comment.getBody()#</p>
	        </div>
	    </cfloop>
	</cfif>
    <cfif auth().check()>
        <hr />
        #html.startForm( method = "POST", action = event.buildLink( "posts.#prc.post.getId()#.comments" ) )#
  	        <div class="form-group">
  		        <label for="body">Add a comment</label>
      		    <textarea class="form-control" name="body" id="body" rows="3"></textarea>
                <cfif prc.errors.keyExists( "body" )>
                    <small class="form-text text-danger">
                        <cfloop array="#prc.errors.body#" index="error">
                            <p>#error.message#</p>
                        </cfloop>
                    </small>
                </cfif>
  	        </div>
  	        <div class="form-group">
  		        <button type="submit" class="btn btn-primary">Comment</button>
  	        </div>
        #html.endForm()#
    </cfif>
</cfoutput>

<script>
    <cfoutput>var #toScript(prc.post.getID(), "postId")#;</cfoutput>
    var likeIcon = document.querySelector("#like-icon");
    var likesCount = document.querySelector("#likes-count");
    document.querySelector("#likeForm").addEventListener("submit", function(e) {
        e.preventDefault();
        var liked = e.target.elements.liked.value === "true";
        fetch(`/posts/${postId}/likes`, {
            method: liked ? "DELETE" : "POST"
        }).then(function() {
            e.target.elements.liked.value = String(!liked);
            likesCount.textContent = String(parseInt(likesCount.textContent) + (liked ? -1 : 1));
            e.target.elements.submit.classList.toggle("btn-success", !liked);
            e.target.elements.submit.classList.toggle("btn-outline-secondary", liked);
            likeIcon.classList.toggle("fas", !liked);
            likeIcon.classList.toggle("far", liked);
        });
    });
</script>