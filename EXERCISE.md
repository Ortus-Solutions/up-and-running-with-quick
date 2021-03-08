# Exercises

## Step 1 Exercise

Goal: Capture addition user information in the registration form.

1. Add a new migration to add `firstName` and `lastName` columns to the database.
2. Add `firstName` and `lastName` attributes to the `User` entity.
3. Add fields to the registration form for the new fields.
4. Validate that the new fields are required when submitting the form.
5. Save all the registration fields to the database.
6. Show the user's full name on the navbar when logged in.

## Step 0 Exercise

1. Scaffold a `quick-blog-example` app from the [`quick-with-auth` template](https://forgebox.io/view/cbtemplate-quick-with-auth)
2. Configure Quick in your `.env` file and application to work with your database.
3. Run your migrations against your database.
4. Start Server and ensure that registration and logging in is successful.