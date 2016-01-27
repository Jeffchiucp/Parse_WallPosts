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
  
  //3
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
    //4
    let cell = tableView.dequeueReusableCellWithIdentifier("WallPostCell", forIndexPath: indexPath) as! WallPostTableViewCell
    
    //5
    let wallPost = object as! WallPost
    
    //6
    cell.postImage.file = wallPost.image
    cell.postImage.loadInBackground(nil) { percent in
      cell.progressView.progress = Float(percent)*0.01
      print("\(percent)%")
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
