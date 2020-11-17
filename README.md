# MSM Signin

Target: [https://msm-signin.matchthetarget.com/](https://msm-signin.matchthetarget.com/)

## Standard setup

1. Start the web server by running `bin/server`.
1. Navigate to your live application preview.
1. As you work, remember to navigate to `/git` and **commit often as you work.**
1. Match [the target](https://msm-signin.matchthetarget.com/).
1. Read the specs at the bottom of this README to confirm you got everything we're testing for.
1. `rails grade` to make sure and submit.

## Initial data model

Here is how to recreate the exact same data model that we had in previous MSM projects; except this time using the `draft:resource` generator (instead of the `model` generator) to add the tables _and_ RCAVs for a basic CRUD web interface:

```
rails generate draft:resource actor name:string dob:date bio:text image:string
```

```
rails generate draft:resource director name:string dob:date bio:text image:string
```

```
rails generate draft:resource movie title:string year:integer duration:integer director_id:integer description:text image:string
```

```
rails generate draft:resource character movie_id:integer actor_id:integer name:string
```

If you re-create these tables/columns _exactly_, then you can use the included `rails sample_data` task. Other than that script, this is a blank Rails app.

## Add users

To add a `users` tables and RCAVs to allow people to sign-up/sign-in as records in this table:

```
rails generate draft:account user first_name:string last_name:string
```

(`email` and `password_digest` will be added automatically by the `draft:account` generator.)

## Add bookmarks

Let's add a join table to connect users and movies. "Bookmarks" sounds good. Since this is a regular old CRUD resource, not accounts, use the `draft:resource` generator again for the appropriate RCAVs:

```
rails generate draft:resource bookmark user_id:integer movie_id:integer
```

## Improve the interface

Now that we've generated our resources, modify/add RCAVs to make the interface match [our vision](https://msm-signin.matchthetarget.com/).

In particular,

 - `/bookmarks` should present a nice dropdown for users to add movies to their to-do list.
 - There should be a way to bookmark/un-bookmark a movie right on its details page.


## Specs

<details>
  <summary>Click here to see names of each test</summary>

<li>User has an column called 'password_digest' of type 'string' </li>

<li>User model does not have a password column </li>

<li>User model has the 'has_secure_password' helper in in the User model </li>

<li>Bookmark model has 'user_id' column </li>

<li>Bookmark model has 'movie_id' column </li>

<li>/user_sign_in has form to sign in a User </li>

<li>/user_sign_in has a <label> with the text 'Email' </li>

<li>/user_sign_in has a label 'Email' with a matching input tag. </li>

<li>/user_sign_in has a <label> with the text 'Password' </li>

<li>/user_sign_in has a label 'Password' with a matching input tag. </li>

<li>/user_sign_in redirects you to the homepage when form is submitted </li>

<li>/user_sign_in displays the 'Sign out' link when user is signed in </li>

<li>/user_sign_up has form to sign up a User </li>

<li>/user_sign_up has a <label> with the text 'Email' </li>

<li>/user_sign_up has a label 'Email' with a matching input tag. </li>

<li>/user_sign_up has a <label> with the text 'First name' </li>

<li>/user_sign_up has a label 'First name' with a matching input tag. </li>

<li>/user_sign_up has a <label> with the text 'Last name' </li>

<li>/user_sign_up has a label 'Last name' with a matching input tag. </li>

<li>/user_sign_up has a <label> with the text 'Password' </li>

<li>/user_sign_up has a label 'Password' with a matching input tag. </li>

<li>/user_sign_up has a <label> with the text 'Password Confirmation' </li>

<li>/user_sign_up has a label 'Password Confirmation' with a matching input tag. </li>

<li>/user_sign_up displays the 'Sign out' link when a user signs up </li>

<li>/user_sign_up creates a new user record when the form is submitted </li>

<li>/bookmarks has a form to create bookmarks </li>

<li>/bookmarks has a dropdown to select Movies by title </li>

<li>/bookmarks form creates a bookmark record </li>

<li>/bookmarks displays a list of the signed in user's bookmarks </li>

<li>/bookmarks has a link to delete each bookmark </li>

<li>/bookmarks has a link, 'Un-bookmark', that removes a Bookmark record </li>

<li>/movies/[MOVIE ID] does NOT have a button, 'Bookmark this movie', to create a bookmark record when user is signed out </li>

<li>/movies/[MOVIE ID] has a form to create a bookmark record when user is signed in </li>

<li>/movies/[MOVIE ID] has a link 'Un-bookmark' to delete bookmark if signed-in user has bookmarked the movie </li>

<li>/movies/[MOVIE ID] has a link, 'Un-bookmark', that removes a Bookmark record, if the signed-in user has bookmarked the movie </li>

</details>
