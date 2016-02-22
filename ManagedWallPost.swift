//
//  ManagedWallPost.swift
//  ParseTutorial
//
//  Created by Jeff_Chiu on 2/21/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.



//
//  ActorPickerViewController.swift
//  FavoriteActors
//
//  Created by Jason on 1/31/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import UIKit
import CoreData


class ManagedWallPost: WallPostViewController,UITableViewController, NSFetchedResultsControllerDelegate{

  
  var username: String?
  var file: PFFile?
  var temporaryContext: NSManagedObjectContext!
  
  //var delegate: ActorPickerViewControllerDelegate?
  //var searchTask: NSURLSessionDataTask?
  
  // MARK: - life Cycle
  override func viewDidLoad() {
//    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "cancel")
    
    let sharedContext = CoreDataStackManager.sharedInstance().managedObjectContext
    
    // Set the temporary context
    temporaryContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
    temporaryContext.persistentStoreCoordinator = sharedContext.persistentStoreCoordinator
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
//    self.searchBar.becomeFirstResponder()
    
    
      
      // MARK: - Shared Instance
      
      /**
      *  This class variable provides an easy way to get access
      *  to a shared instance of the CoreDataStackManager class.
      */
      func sharedInstance() -> CoreDataStackManager {
        struct Static {
          static let instance = CoreDataStackManager()
        }
        
        return Static.instance
      }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   //   return
    }
    
   // func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
   //   let actor = actors[indexPath.row]
      
      // Alert the delegate
   //   delegate?.actorPicker(self, didPickActor: actor)
      
  //  self.dismissViewControllerAnimated(true, completion: nil)
    }

}

}