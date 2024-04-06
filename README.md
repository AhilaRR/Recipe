# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version 3.0.3

- System dependencies - PostgreSql

- Configuration

- Database creation

- Database initialization

- Deployment instructions

- The Recipe Sharing Application allows users to create, view, edit, and delete recipes, categorize them, and comment on them. It incorporates user authentication to manage access and actions within the app.
  Overview of the application flow:

User Registration and Authentication
• Registration: New users can sign up by providing their email and creating a password. Devise handles user registration and authentication.

• Login: Registered users log in to access their profiles, create recipes, and interact with other users' recipes.

• Logout: Users can log out of the application.

Recipe Management
• Viewing Recipes: All visitors, including unregistered users, can view recipes listed on the site. Each recipe shows details such as title, ingredients, instructions, and associated categories.

• Creating Recipes: Logged-in users can create new recipes by filling out a form with the recipe's title, ingredients, instructions, and categories (input as comma-separated values).

• Editing and Deleting Recipes: Users can only edit or delete their own recipes. The edit and delete options are visible only to the recipe's creator.

Categories
• Category Creation: Categories can be created by users (or restricted to admins, depending on the app's rules) to organize recipes.

• Viewing Categories: All visitors, Users can view a list of all categories. Clicking on a category shows all recipes associated with it.

Comments
• Commenting on Recipes: Logged-in users can comment on recipes to engage with the recipe creator and other users.

• Deleting Comments: Users can delete their own comments.

User Profiles
• Profile Viewing: Users can view their own or other users' profiles, which might include user information and a list of recipes created by the user.

• Profile Editing: Users can edit their own profiles, updating information such as their bio or website.

Entity Relationship:

User and Profile:
One-to-One: Each user has one profile, and each profile is associated with one user.

User and Recipe:
One-to-Many: A user can have many recipes, but each recipe belongs to one user.

User and Comment:
One-to-Many: A user can have many comments, but each comment is posted by one user.

Recipe and Category through Categorization:

Many-to-Many: A recipe can belong to many categories, and a category can include many recipes. The Categorization table serves as a join table facilitating this relationship.

Textual Representation

(User) 1 -------- _ (Recipe) 1 -------- _ (Comment)
| |
|1 |_
| |
| (Category) _ ------ \* (Categorization)
|
|1
|
(Profile)

1 -- \* represents a one-to-many relationship.

- -- 1 represents a many-to-one relationship, noting a direct relationship between Recipes and Categories.
  1 -- 1 represents a one-to-one relationship.
- -- \*represents a many-to-many relationship

Test user:
email: 'user1@example.com', password: 'password'
email: 'user2@example.com', password: 'password'

Instruction to run :

1. Install PostgreSQL
2. Run “bundle install”
3. Edit “config/database.yml” file to match the PostgreSQL settings (username, password)
4. Run “rails db:create”
5. Run “rails db:migrate”
6. Run “rails db:seed”
7. Run “rails s”

Heroku Link:
https://recipe-v9kb.onrender.com

THUS, ALL THE TECHNICAL AND FUNCTIONAL REQUIREMENTS ARE SATISFIED.
