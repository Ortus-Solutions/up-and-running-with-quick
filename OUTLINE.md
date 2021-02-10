1. Scaffold app and start server
2. Install and configure Quick
3. Scaffold User entity and migration
    + Make sure to include a unique `username` for later
4. Install and configure cbauth and cbguard
5. When this is all done, show off `quick-with-auth` template.

6. Scaffold Post entity and migration
7. List all Posts (index route) - empty for now
9. Create a Post (new and create routes)
    a. Ensure logged in
    b. Validate entity using cbvalidation
    c. Redirect with message - install cbmessagebox
10. Create a second post
    a. Order the list in descending order by created date
    b. Refactor to a scope - `latest`
11. View a Post (show route)
    a. Create a 404 page.
12. Edit a Post (edit and update routes)
    a. Ensure logged in
    b. Ensure they authored the Post
13. Delete a Post (delete route)
    a. Ensure logged in
    b. Ensure they authored the Post


14. Add a Comment to a Post (hasMany relationship and belongsToRelationship)
    a. Ensure logged in
15. Show all Comments on a Post
16. Install cbdebugger
17. Eager load Comment Author
18. Use subselect for author name
    a. Show qb subselect
    b. Show relationships shorthand
19. Delete Comment (optional)
    a. Ensure logged in
    b. Ensure Comment Author
20. Show Comment total on Post view and Post list
    a. Show qb subselect
    b. Show `withCount`

20. Add Tags to a Post (belongsToMany relationship)
    a. Should autocomplete tags and create tags if they don't exist
21. Show Tags in Post list
    a. Eager load Tags
22. Show Tags in Post view
    a. Eager loading doesn't help here since there is only 1 tag.

23. Allow liking Posts. (No disliking.  That's stupid.)
    a. This will be done via ajax.
24. Create API endpoint. (`/posts/:postID/likes`)
    a. Handle `POST` and `DELETE` events.
    b. Return data using `getMemento`.
    c. Refactor to `asMemento`.
25. Wire it up.

26. Add pagination to Posts
    a. [Use Bootstrap component](https://getbootstrap.com/docs/4.6/components/pagination/)
27. EXERCISE:
    b. Add pagination to a Post's Comments
    a. Bonus points for encapsulating pagination in a [View Partial](https://coldbox.ortusbooks.com/the-basics/layouts-and-views/views/rendering-with-local-variables)

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

30. EXERCISE: View an author's Posts on their profile page (`/authors/:username`)
    a. Do this all with TDD.
    b. Add new route
    c. Validate Author exists or return to a 404 page. (`findOrFail`)
    d. Grab the author's latest Posts and paginate them.
    e. Bonus points for reusing other parts of the blog, like the Posts list.

## Testing
29. Test Post list

## Migrating from ColdFusion ORM
30. Migration from ColdFusion ORM

31. When not to use Quick
    a. Picklists, reports, lots of data
    b. Escape hatch to qb - best of both worlds

## Ideas?
+ Distinguish between Authors and Users
    + Users can comment, Authors can create posts
    + This can be done using inheritance and global scopes



+ Follow authors - be notified of their new posts via email
    + cbmailservices
    + ColdBox Async Scheduled Tasks