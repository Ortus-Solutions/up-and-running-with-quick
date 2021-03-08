<cfoutput>
    <h3>Register for an account</h3>
    <hr />
    <form method="POST" action="#event.buildLink( "registrations" )#">
        <input type="hidden" name="_token" value="#csrfGenerateToken()#" />
        <div class="form-group">
            <label for="email">Email Address:</label>
            <input name="email" type="email" class="form-control" id="email" />
            <cfif prc.errors.keyExists( "email" )>
                <small class="form-text text-danger">
                    <cfloop array="#prc.errors.email#" index="error">
                        <p>#error.message#</p>
                    </cfloop>
                </small>
            </cfif>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input name="password" type="password" class="form-control" id="password" />
            <cfif prc.errors.keyExists( "password" )>
                <small class="form-text text-danger">
                    <cfloop array="#prc.errors.password#" index="error">
                        <p>#error.message#</p>
                    </cfloop>
                </small>
            </cfif>
        </div>
        <div class="form-group">
            <label for="passwordConfirmation">Password Confirmation:</label>
            <input name="passwordConfirmation" type="password" class="form-control" id="passwordConfirmation" />
            <cfif prc.errors.keyExists( "passwordConfirmation" )>
                <small class="form-text text-danger">
                    <cfloop array="#prc.errors.passwordConfirmation#" index="error">
                        <p>#error.message#</p>
                    </cfloop>
                </small>
            </cfif>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Sign Up</button>
        </div>
    </form>
</cfoutput>
