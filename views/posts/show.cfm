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
        <p>#prc.post.getBody()#</p>
    </article>
	<a href="#event.buildLink( "posts" )#">Back</a>
    <hr />
	<h3>Comments</h3>
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