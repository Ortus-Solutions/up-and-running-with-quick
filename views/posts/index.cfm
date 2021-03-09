<cfoutput>
    <h1>Posts</h1>
    <a href="#event.buildLink( "posts.new" )#">Write a new post</a>
    <cfif prc.posts.isEmpty()>
        <div class="card mb-3">
            <div class="card-body">
                <p class="card-text">No posts yet.</p>
            </div>
        </div>
    <cfelse>
        <cfloop array="#prc.posts#" index="post">
            <div class="card mb-3">
                <div class="card-body">
                    <a href="#event.buildLink( "posts.#post.getID()#" )#">
                        <h5 class="card-title">#post.getTitle()#</h5>
                    </a>
                    <h6 class="card-subtitle">By <a href="#event.buildLink( "authors.#post.getUserID()#" )#">#post.getAuthorName()#</a></h6>
                    <p class="card-text">#post.getBody()#</p>
                </div>
                <cfif post.getTags().len()>
                    <div class="card-footer">
                        <div class="text-primary">
                            <span class="mr-3">
                                <i class="far fa-comments"></i>
                                #post.getCommentsCount()# #post.getCommentsCount() == 1 ? 'comment' : 'comments'#
                            </span>
                            <span>
                                <i class="far fa-thumbs-up"></i>
                                #post.getLikesCount()# #post.getLikesCount() == 1 ? 'like' : 'likes'#
                            </span>

                        </div>
                        <div>
                            <cfloop array="#post.getTags()#" index="tag">
                                <span class="badge badge-pill badge-primary">#tag.getName()#</span>
                            </cfloop>
                        </div>
                    </div>
                </cfif>
            </div>
        </cfloop>
    </cfif>
</cfoutput>