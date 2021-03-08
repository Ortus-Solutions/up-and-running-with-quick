# OUTLINE

## Installation and Setup (30 minutes)
1. Scaffold app from `quick-with-auth` template
2. Configure application
3. Start Server
4. Show off the template working

## **EXERCISE:** Installation and Setup (30 minutes)
1. Scaffold app from `quick-with-auth` template
2. Configure application
3. Start Server
4. Make sure the registration and log in pages are working.

## The Quick Philosophy (15 minutes)
+ ORM: Map database tables to CFCs
+ ActiveRecord
+ Give relevant names to important collections of SQL code. (scopes, relationships, etc.)
+ Make queries easy to compose at runtime to get the exact data you want in the most efficient way (subselects, eager loading, etc.)
+ Get out of your way when you need or want to write barebones SQL.

## Tour the App (30 minutes)
1. Talk about each dependency and why it is there.
2. Show the User migration and a little bit about cfmigrations.
3. Dive in to the User entity.
    a. Properties
    b. Helper methods
    c. cbauth and cbsecurity integration

## **EXERCISE:** Capture Additional User Information (30 minutes)
1. Change the migration or add a new migration to add `firstName` and `lastName` fields to the `users` table.
2. Add attributes for `firstName` and `lastName` to `User`
3. Capture the User's first and last name on the registration form.
4. Modify the `layouts/Main.cfm` to show the logged in user's full name in the navbar. BONUS: Do this with a helper method (i.e. `getFullName()`).

## Defining Entities and `belongsTo` Relationships (15 minutes)
## **EXERCISE:** Define a Post entity and list all Posts (`index` route) (30 minutes)
+ Define a `Post` entity (by hand)
+ Create a `create_posts_table` migration.
+ `posts` handler and `index` action.
    + `getInstance( "User" )` vs `inject="quickService:User`.
    + How to query multiple entities
        + `get()` method
        + mention other options like `all()` and `paginate()`
+ Handle empty state in `posts.index` view.
+ Add a link in `posts.index` to create a new post.

## Creating Entities (15 minutes)
+ Manually set `userId` attribute when saving
9. Create a Post (new and create routes)
    a. Ensure logged in
    b. Validate entity using cbvalidation
    c. Redirect with message - install cbmessagebox
10. Create a second post
    a. Order the list in descending order by created date
    b. Refactor to a scope - `latest`

## **EXERCISE:** Create a Post (`new` and `create` routes) (30 minutes)

## Viewing Entities (15 minutes)
11. View a Post (show route)
    a. Create a 404 page.

## **EXERCISE:** View a single Post (`show` route) (20 minutes)

## Updating and Deleting Entites (20 minutes)
12. Edit a Post (edit and update routes)
    a. Ensure logged in
    b. Ensure they authored the Post
13. Delete a Post (delete route)
    a. Ensure logged in
    b. Ensure they authored the Post

## **EXERCISE:** Edit (`edit` and `update` routes) and Delete (`delete` route) a Post (20 minutes)

## Scopes and Using Relationships as Scopes (15 minutes)

## **EXERCISE:** Refactor to `latest` in `posts.index` and use `auth().user().posts().create()` in `posts.create`. (15 minutes)

## `HasMany` Relationships (15 minutes)

## **EXERCISE:** Add Comment Form and Show Comments on a Post (30 minutes)
14. Add a Comment to a Post (hasMany relationship and belongsToRelationship)
    a. Ensure logged in
15. Show all Comments on a Post

## The N+1 Problem and Eager Loading (15 minutes)
+ This is one of the points Quick solves so nicely.  You can do this manually for each
of your entities, but making it composible at runtime for every type of relationship is quite complex.  With Quick you get it for free.

## **EXERCISE:** Use cbdebugger and eager loading to fix the N+1 problem on Comments and Post index (15 minutes)
16. Install cbdebugger
17. Eager load Comment Author

## `ManyToMany` Relationships (15 minutes)

## **EXERCISE:** Add tags to Posts (30 minutes)
20. Add Tags to a Post (belongsToMany relationship)
    a. Should autocomplete tags and create tags if they don't exist
21. Show Tags in Post list
    a. Eager load Tags
22. Show Tags in Post view
    a. Eager loading doesn't help here since there is only 1 tag.

## Using Quick in an API (15 minutes)

## **EXERCISE:** Add likes to Posts (15 minutes)
23. Allow liking Posts. (No disliking.  That's stupid.)
    a. This will be done via ajax.
24. Create API endpoint. (`/posts/:postID/likes`)
    a. Handle `POST` and `DELETE` events.
    b. Return data using `getMemento`.
    c. Refactor to `asMemento`.
25. Wire it up.

## Subselects and Relationship Counts (15 minutes)

## **EXERCISE:** Use subselects for author name, comments count, and likes count (15 minutes)
18. Use subselect for author name
    a. Show qb subselect
    b. Show relationships shorthand
20. Show Comment total on Post view and Post list
    a. Show qb subselect
    b. Show `withCount`
20. Show Likes count on Post view and Post list
    b. Show `withCount`

## Testing with Quick (30 minutes)

## **EXERCISE:** Add Author Profile page using TDD (30 minutes)

## **EXERCISE:** Add future publishing feature using TDD and Quick (30 minutes)
26. Add a future publishing feature.
27. First we want tests around our Posts list.
28. Introduce a testing database and the test philosophy of Quick.
    a. Show setting up automatic migrations and database transactions.
29. Add a basic test for viewing Posts in reverse order.
30. Introduce failing test for a non-published Post. Let the test drive the implementation.
27. Add `publishedDate` to `Post`.
    a. Create new migration to add `publishedDate`.
    b. Add property to entity.
28. Logic is `NULL` means published and `NOW() >= publishedDate` means published.
    a. Modify `latest` scope - point out how we didn't have to change the handler.
29. Now that the test is passing, create a `published` scope to encapsulate the above logic. Use the tests to ensure it works.

## Q&A (30 minutes)
30. Migration from ColdFusion ORM
31. When not to use Quick
    a. Picklists, reports, lots of data
    b. Escape hatch to qb - best of both worlds

## Extra Ideas?
+ Author Profile page
    **EXERCISE:** View an author's Posts on their profile page (`/authors/:username`)
    a. Do this all with TDD.
    b. Add new route
    c. Validate Author exists or return to a 404 page. (`findOrFail`)
    d. Grab the author's latest Posts and paginate them.
    e. Bonus points for reusing other parts of the blog, like the Posts list.
+ Likes can be Posts or Comments (polymorphic relationships)
+ Distinguish between Authors and Users
    + Users can comment, Authors can create posts
    + This can be done using inheritance and global scopes
    + Ties into cbsecurity permissions as well.
+ Follow authors - be notified of their new posts via email
    + cbmailservices
    + ColdBox Async Scheduled Tasks
+ Add pagination to Posts
    + [Use Bootstrap component](https://getbootstrap.com/docs/4.6/components/pagination/)
    + **EXERCISE:**
        + Add pagination to a Post's Comments
        + Bonus points for encapsulating pagination in a [View Partial](https://coldbox.ortusbooks.com/the-basics/layouts-and-views/views/rendering-with-local-variables)