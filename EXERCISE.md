# Exercises

## Step 5 Exercise

Goal: Allow for editing, updating, and deleting of Posts

1. Add an edit form.  Ensure that only the author of a Post can view this form.
2. Handle validation and updating of Posts.  Ensure that only the author of a Post can edit the Post. Relocate back to the `posts.show` route.
3. Add a link to delete a Post on the edit page when the logged in User is the author of the Post.
4. Handle deleting a Post.  Ensure that only the author of a Post can delete the Post.  Relocate back to the `posts.index` route.

## Step 4 Exercise

Goal: Display a single Post

1. Create a new action for `show` to load the Post with the given id in the url.
2. Display the post in a new `posts.show` view. Include a link back to the `posts.index` page.
3. Link the title of each Post on the `posts.index` page to the new `posts.show` route.
4. Handle the `EntityNotFound` exception thrown by Quick to show a 404 page.

## Step 3 Exercise

Goal: Create a new Post from the UI

1. Create a new form for creating a Post.  Ensure the user must be logged in to access it.
2. Handle validation and saving of a new Post. On success, `relocate` to the `posts.index` page with a `cbmessagebox` message.
3. Show the author's name on the Post card.
4. Create a second Post from the UI. Notice the Posts are sorting in ascending order by `id`.
5. Order the posts in descending order by `createdDate`.

## Step 2 Exercise

Goal: Show all existing Posts

1. Create a migration for a `posts` table.
2. Create a Quick entity for a `Post`.
3. Create a `posts` handler and `index` action to show all posts.
4. Show all posts on the `index` view.
5. Provide an empty state view in `posts.index`.
6. Add a link to create a new post.
7. Link to the new `posts.index` route from the navbar.

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