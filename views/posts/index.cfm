<cfoutput>
    <h1>Posts</h1>
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
                    <h5 class="card-title">#post.getTitle()#</h5>
                    <p class="card-text">#post.getBody()#</p>
                </div>
            </div>
        </cfloop>
    </cfif>
</cfoutput>