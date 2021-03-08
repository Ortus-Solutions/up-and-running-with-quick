<cfoutput>
    <h1>Posts</h1>
    <cfloop array="#prc.posts#" index="post">
        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title">#post.getTitle()#</h5>
                <p class="card-text">#post.getBody()#</p>
            </div>
        </div>
    </cfloop>
</cfoutput>