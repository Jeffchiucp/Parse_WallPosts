//
//  WallPicturesTableViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/8/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit

class WallPicturesTableViewController: PFQueryTableViewController {
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    getWallImages()
  }
  
  //1
  override func viewWillAppear(animated: Bool) {
    loadObjects()
  }
  
  //2
  override func queryForTable() -> PFQuery {
    let query = WallPost.query()
    return query!
  }
  
  
  func getWallImages() {
    //1
    let query = WallPost.query()!
    query.findObjectsInBackgroundWithBlock { objects, error in
      if error == nil {
        //2
        if let objects = objects as? [WallPost] {
         // self.loadWallViews(objects)
          
          for wallPost: WallPost in objects{
            let managedWallPost = ManagedWallPost(wallPost: wallPost, context:sharedContext)
            wallPost.image.getDataInBackgroundWithBlock{ data, error in
              if let data = data {
                if let image = UIImage(data: data) {
                  managedWallPost.wallImage = image
                }
              }
              
              CoreDataStackManager.sharedInstance().saveContext()
            }
          }
        }
      } else if let error = error {
        //3
        self.showErrorView(error)
      }
    }
  }

  
  
  //3
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
    //4
    let cell = tableView.dequeueReusableCellWithIdentifier("WallPostCell", forIndexPath: indexPath) as! WallPostTableViewCell
    
    //5
    let wallPost = object as! WallPost
    
    //6
    cell.postImage.file = wallPost.image
    cell.postImage.loadInBackground({(image, error)-> Void in
      print(error)
      }) { percent in
      cell.progressView.progress = Float(percent)*0.01
      print("\(percent)%")
      // - (void)loadInBackground:(nullable PFImageViewImageResultBlock)completion
      // progressBlock:(nullable void (^)(int))progressBlock;
    }
    
    //7
    let creationDate = wallPost.createdAt
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "HH:mm dd/MM yyyy"
    let dateString = dateFormatter.stringFromDate(creationDate!)
    
    if let username = wallPost.user.username {
      cell.createdByLabel.text = "Uploaded by: \(username), \(dateString)"
    } else {
      cell.createdByLabel.text = "Uploaded by anonymous: , \(dateString)"
    }
    
    cell.commentLabel.text = wallPost.comment
    
    return cell
  }
  
  // MARK: - Actions
  @IBAction func logOutPressed(sender: AnyObject) {
    PFUser.logOut()
    navigationController?.popToRootViewControllerAnimated(true)
  }
}
