# Schedule (times in CST)
## Day 1
–
09:00 AM - Introductions
    + Meet students.
    + Write down what they want to take away from the workshop/what questions they have we can answer in the workshop or tomorrow during Q&A
    + Go over course outline.
09:30 AM - Installation and Setup
10:00 AM - **EXERCISE:** Installation and Setup
    + Create an app using the quick-with-auth template, migrate the database, and get going!
10:30 AM - Break
10:45 PM - The Quick Philosophy
11:00 AM - Tour the app - dependencies, migrations, User entity, cbauth, and cbsecurity
11:30 AM - **EXERCISE:** Capture the user's first and last name and make the user interface show the logged in user's full name
12:00 PM - Lunch Break
01:00 PM - Defining Entities and `belongsTo` Relationships
01:15 PM - **EXERCISE:** Define a Post entity and list all Posts (`index` route)
           **BONUS:** Add pagination to Post
01:45 PM - Creating Entities
02:00 PM - **EXERCISE:** Create a Post (`new` and `create` routes)
02:30 PM - Break
02:45 PM - Viewing Entities
03:00 PM - **EXERCISE:** View a single Post (`show` route)
03:20 PM - Updating and Deleting Entites
03:40 PM - **EXERCISE:** Edit (`edit` and `update` routes) and Delete (`delete` route) a Post
04:00 PM - Finish

## Day 2 
09:00 AM - Scopes and Using Relationships as Scopes
09:15 AM - **EXERCISE:** Refactor to `latest` in `posts.index` and use `auth().user().posts().create()` in `posts.create`.
09:30 AM - `HasMany` Relationships
09:45 AM - **EXERCISE:** Add Comment Form and Show Comments on a Post
           **BONUS:** Add pagination to comments
10:15 AM - Break
10:30 AM - The N+1 Problem and Eager Loading
10:45 AM - **EXERCISE:** Use cbdebugger and eager loading to fix the N+1 problem on Comments and Post index
11:00 AM - `ManyToMany` Relationships
11:15 AM - **EXERCISE:** Add tags to Posts
11:45 AM - Lunch Break
12:45 PM - Using Quick in an API
01:00 PM - **EXERCISE:** Add likes to Posts
01:15 PM - Subselects and Relationship Counts
01:30 PM - **EXERCISE:** Use subselects for author name, comments count, and likes count
01:45 PM - Testing with Quick
02:15 PM - **EXERCISE:** Add Author Profile page using TDD
02:45 PM - Break
03:00 PM - **EXERCISE:** Add future publishing feature using TDD and Quick
03:30 PM - Q&A (topics depend on students)
    + When to not use Quick
    + Migrating from ColdFusion ORM
    + `____Through` relationships
04:00 PM - Finish