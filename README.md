# Up and Running with Quick

_(This is a companion repo for use in Ortus Solution's Introduction to Quick workshop.)_

Interact with your database with ease using Quick, a ColdBox ORM framework.

Quick is an ORM (Object Relational Mapper) written in CFML for CFML.

With it, you can map database tables to entities (CFCs), create relationships between entities,query and manipulate data, and persist all your changes to your database. Quick helps you give relevant names to important bits of SQL code, compose queries at runtime to get exactly the data you want in the most efficient way, and gets out of your way when you need or want to write barebones SQL.

This workshop will teach you how to use and configure Quick while building a real-world blogging application. By the end of the workshop, attendees will have the tools and knowledge to implement Quick in their own new or existing projects.

## What We'll Cover

In this workshop you will learn the basics of Quick:
1. Installation and Configuration
2. The Quick philosophy
3. Mapping database tables to Entities
4. Defining relationships between Entities
5. Encapsulating query logic in scopes and relationships

We will also cover some specific use cases, such as:
1. Solving the N+1 problem with Quick
2. Profiling SQL performance using cbDebugger
3. Improving execution time with subselects
4. Recommendations for testing Quick Entities

## Follow Along

This repo is split into different branches for each step of the workshop, i.e. `step-0`, `step-1`, etc.
In each step, you will find an `EXERCISE.md` file that describes the exercise for the section.
Follow the steps in the exercise to follow along with the workshop.
The next step branch will be the solution for the previous exercise.  For example, `step-3` would include
the solution for the `step-2` exercise.  A `git diff` between the branches will show you what changed and
can help you if you feel lost.  A `git checkout` can let you keep pace with the workshop if needed.

