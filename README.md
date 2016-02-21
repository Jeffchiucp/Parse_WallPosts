# Parse_WallPosts

This photo sharing app allows users to add pictures to their posts. It let users logins, uploads photo, and share photo on a wall. The App allows users to add picture to their posts. This app allows users to save picture posts and allows other users to view it. 

How to run the project:

Download the folder. After downloading it, unzip it and open the XCode project. 
Build and run the app in the iPhone simulator. 

Instruction for the First time user: 

After logged-in to the App, user can tap the “Upload” button on the Wall view to take them to the upload screen shown below.

The user can enter an optional comment and tap “Select Picture” to select something from the library to upload using the standard image picker. Users then can press the “Send” button on the Navigation Toolbar – that sends the picture and comment to the server.



The project consists of four main views:
1. Log In: A Login screen with user and password text fields. There’s a “Sign Up” button to go to the Sign Up view to create a new user.
2. Sign Up: In this view, the user introduces the username and password to create a new account with the backend service.
3. Wall: This is the main screen of the app. Here the user can see all of the other users uploaded images, the creation date and the comment associated with them.
4. Upload: In this view, a user can upload their own images to the wall and (optionally) add a comment.
Each view has its own UIViewController in the storyboard, but you’ll notice that the Wall view has two representations. That’s because you’re going to see two ways to implement this view with Parse.


Known Issues:
1. The app would not build successfully because the implementation of Core Data is not complete.  
I document the issues at the tickets Issue 20. 
I create a reference to the Core Data. 
The file that holds the image name. 
I wrote the image Name and I set the image to the Cache, and store the image, and write it to the Path (imageCache). 
More work needs to be resolved at WallPostViewController.
The project needs to be set up to use Core Data persistence. We just need to save and fetch the managed objects.
