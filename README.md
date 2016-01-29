# Parse_WallPosts

Build and run the app in the iPhone simulator. 

The intended user experience:
Users can use WallPost App to add picture to your posts. This app has the ability to show Pictures on the Wall that allows other users to view it. 

First time user: 

After logged-in to the App, user can tap the “Upload” button on the Wall view to take them to the upload screen shown below.

The user can enter an optional comment and tap “Select Picture” to select something from the library to upload using the standard image picker.
Users then can press the “Send” button on the Navigation Toolbar – that sends the picture and comment to the server.

Parse UI login feature.

Parse makes it easy to upload files. Open UploadImageViewController.swift, which is where you’ll do the work to upload files.

Design of this upload the image using a PFFile object; second, attach it to a PFObject, and upload it to the server.