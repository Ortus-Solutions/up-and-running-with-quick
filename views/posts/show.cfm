<cfoutput>
    <article>
		<h2>#prc.post.getTitle()#</h2>
		<small class="mb-4">By #prc.post.getAuthor().getFullName()#</small>
        <p>#prc.post.getBody()#</p>
    </article>
	<a href="#event.buildLink( "posts" )#">Back</a>
</cfoutput>