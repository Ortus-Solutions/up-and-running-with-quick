<!-- views/posts/new.cfm -->
<cfoutput>
    <h2>Create a new post</h2>
    <form method="POST" action="#event.buildLink( "posts" )#">
		<div class="form-group">
			<label for="title">Title</label>
			<input type="text" class="form-control" name="title" id="title">
            <cfif prc.errors.keyExists( "title" )>
                <small class="form-text text-danger">
                    <cfloop array="#prc.errors.title#" index="error">
                        <p>#error.message#</p>
                    </cfloop>
                </small>
            </cfif>
		</div>
		<div class="form-group">
			<label for="body">Body</label>
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
			<label for="tags">Tags</label>
			<select name="tags" id="tags" multiple="true" class="form-control">
                <cfloop array="#prc.tags#" index="tag">
                    <option value="#tag.getID()#">#tag.getName()#</option>
                </cfloop>
            </select>
            <cfif prc.errors.keyExists( "tags" )>
                <small class="form-text text-danger">
                    <cfloop array="#prc.errors.tags#" index="error">
                        <p>#error.message#</p>
                    </cfloop>
                </small>
            </cfif>
		</div>
		<a href="#event.buildLink( "posts" )#" class="btn btn-outline">Back</a>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</cfoutput>
