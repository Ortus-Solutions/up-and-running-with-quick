# Exercises

## Step 10 Exercise

Goal: Allow async liking of posts

1. Create a migration for a `likes` table.  This is our pivot table between `users` and `posts`.
2. Create an entity for a `Like`. Define the necessary relationships between `Like`, `Post`, and `User`.
3. Create a route, handler, and action to save a User's like of a Post. This endpoint should return a memento of the `Like` entity with a 201 Created status code.
4. Add a route and action to remove a User's like of a Post. This endpoint should return nothing with a 204 No Content status code.
5. Add a thumbs up "Like" button to the bottom of the `posts.show` page. The button should show selected if the logged in user has liked the post.
6. Wire up the button to hit the correct API endpoint when clicked.

## Step 9 Exercise

Goal: Allow adding tags to posts

1. Create a migration to add a `tags` table. Populate it with some pre-made tags.
2. Create a `Tag` entity.
3. Create a migration for the `posts_tags` pivot table between `posts` and `tags`
4. Show a multiple select field on the `posts.new` form with all the tags.
5. Validate and sync tags when creating the new Post.
6. Show associated tags on the `posts.index` view.
7. Show associated tags on the `posts.show` view.
8. Show a multiple select field on the `posts.edit` form with all the tags. The currently associated tags should be pre-selected.
9. Validate and sync tags when updating the Post.
10. Make sure to eager load the tags on the `posts.index` view.


## Step 8 Exercise

Goal: Solve the N+1 problem with Eager Loading

1. Ensure you have at least 10 posts and that at least one of your posts has at least 5 comments in order to see the N+1 problem and the fix.
2. Install `cbdebugger`.
3. Load the `posts.index` view and check out the cbdebugger view. Notice that we are executing a bunch of queries for our single page.
4. Eager load the `author` relationship for our `posts.index` route.
5. Eager load the `commenter` relationship for the `posts.show` route.


## Step 7 Exercise

Goal: Make existing code cleaner, more readable, and more expressive using Scopes and Relationships

1. Convert the `orderByDesc( "createdDate" )` to a scope called `latest`.
2. Hide the implementation detail of `userId` when creating a Post by utilizing the `posts` relationship on User.
3. Remove the cbsecurity check by constraining the Posts queries to the logged in user's posts using the `posts` relationship.

## Step 6 Exercise

Goal: Add a Commenting System

1. Create a migration to create a `comments` table.
2. Create a `Comment` entity.
3. Add a relationship from `Comment` to `Post` and from `Comment` to `User`.
4. Add the inverse relationship from `Post` to `Comment`.
5. Show the new comment form on the `posts.show` view when the user is logged in.
6. Validate and create a Comment associated with a Post. (The User must be logged in to perform this action.)
7. Show all Comments underneath a Post.  Comments should display their commenter's name, the time it was posted, and the body of the Comment.

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