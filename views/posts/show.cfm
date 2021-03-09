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
</cfoutput>