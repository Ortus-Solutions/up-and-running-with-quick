1. Scaffold app and start server
2. Install and configure Quick
3. Scaffold User entity and migration
4. Install and configure cbauth and cbguard

5. Scaffold Post entity and migration
6. List all Posts (index route) - empty for now
7. Eager load Post Author
8. Create a Post (new and create routes)
    a. Ensure logged in
    b. Redirect with message - install cbmessagebox
9. View a Post (show route)
10. Edit a Post (edit and update routes)
    a. Ensure logged in
    b. Ensure they authored the Post
11. Delete a Post (delete route)
    a. Ensure logged in
    b. Ensure they authored the Post

12. Add a Comment to a Post (hasMany relationship and belongsToRelationship)
    a. Ensure logged in
13. Show all Comments on a Post
14. Eager load Comment Author
15. Delete Comment
    a. Ensure logged in
    b. Ensure Comment Author

15. Add Tags to a Post (belongsToMany relationship)
    a. Should autocomplete tags and create tags if they don't exist
16. Show Tags in Post list
    a. Eager load Tags
17. Show Tags in Post view

## Testing
18. Test Post list