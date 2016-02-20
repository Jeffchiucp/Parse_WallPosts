//
//  WallPostViewController.swift
//  ParseTutorial
//
//  Created by Jeff_Chiu on 2/16/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//
//
//  FavoriteActorViewController.swift
//  FavoriteActors
//
//  Created by Jason on 1/31/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import UIKit
import CoreData

/**
 * Challenge 1: Convert Wall Posts to Fetched Results View Controller.
 */
 
//var username: String?
//var pffiles = [PFFile]()

 // Step 8: Add NSFetchedResultsControllerDelegate to class declaration
class WallPostViewController : UITableViewController, NSFetchedResultsControllerDelegate{
  
  // Step 3: Remove the actors array
  
  // MARK: - Life Cycle
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
   // self.navigationItem.leftBarButtonItem = self.editButtonItem()
   // self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addActor")
    
    // This will be removed in step 4
    // REMOVED
    
    // Step 2: invoke fetchedResultsController.performFetch(nil) here
    do {
      try fetchedResultsController.performFetch()
    } catch {}
    
    // Step 9: set the fetchedResultsController.delegate = self
    fetchedResultsController.delegate = self
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    tableView.reloadData()
  }
  
  // MARK: - Core Data Convenience. This will be useful for fetching. And for adding and saving objects as well.
  
  
  var sharedContext: NSManagedObjectContext {
    return CoreDataStackManager.sharedInstance().managedObjectContext
  }

  
  // Step 1 - Add the lazy fetchedResultsController property. See the reference sheet in the lesson if you
  // want additional help creating this property.
  
  lazy var fejtchedResultsController: NSFetchedResultsController = {
    
    let fetchRequest = NSFetchRequest(entityName: "PFfile")
    
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
    
    let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
      managedObjectContext: self.sharedContext,
      sectionNameKeyPath: nil,
      cacheName: nil)
    
    return fetchedResultsController
    
  }()
  
  
  // Step 5: Remove the fetchAllWallPicture() method, and the invocation
  // REMOVED
  
  // Mark: - Actions
  
  func () {
    let controller = self.storyboard!.instantiateViewControllerWithIdentifier("WallPostViewController.swift") as! WallPostViewController
    
    //controller.delegate = self
    
    self.presentViewController(controller, animated: true, completion: nil)
  }
  
  // MARK: - Wall Picker Delegate
  
  // func WallPicker(WallPost: WallPostViewController, WallPost ,name: WallPost?) {
    
    
    //if let Wall = WallPost {
      
      // Debugging output
     // print("picked actor with name: \(newActor.name),  id: \(newActor.id), profilePath: \(newActor.imagePath)")
      
      //let Wall: [String : AnyObject] = [

      //]
      
      // Now we create a new WallPost, using the shared Context
      //let _ = Wall(dictionary: dictionary, context: sharedContext)
      
      // Step 3: Do not add WallPosts to the Wall array.
      // This is no longer necessary once we are modifying our table through the
      // fetched results controller delefate methods
      // REMOVED
      
      //CoreDataStackManager.sharedInstance().saveContext()
    //}
  //}
  
  // MARK: - Table View
  
  // Step 6: Replace the actors array in the table view methods. See the comments below
  
  // This one is particularly tricky. You will need to get the "section" object for section 0, then
  // get the number of objects in this section. See the reference sheet for an example.
  
  //override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  //  let sectionInfo = self.fetchedResultsController.sections![section]
  //  return sectionInfo.numberOfObjects
  //}
  
  
  // This one is easy. Get the actor using the following statement:
  //
  //        fetchedResultsController.objectAtIndexPath(:) as Person
  //
  override func tableView(tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let CellIdentifier = "PFfile"
      
      // Here is how to replace the actors array using objectAtIndexPath
      //let pffiles = fetchedResultsController.objectAtIndexPath(indexPath) as! PFFile
      
      let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as!
      PFTableViewCell
      
      // This is the new configureCell method
      configureCell(cell, PFFile: PFfile)
      
      return
  }
  
  // This one is also fairly easy. You can get the actor in the same way as cellForRowAtIndexPath above.
  func tableView(tableView: UITableView,
    didSelectRowAtIndexPath indexPath: NSIndexPath) {
      let controller =
      storyboard!.instantiateViewControllerWithIdentifier("UploadImageViewController")
        as! UploadImageViewController
      
      // Similar to the method above
      // let actor = fetchedResultsController.objectAtIndexPath(indexPath) as! Person
      
      // controller.actor = actor
      
      self.navigationController!.pushViewController(controller, animated: true)
  }
  
  // This one is a little tricky. Instead of removing from the pfFile array you want to delete the actor from
  // Core Data.
  // You can accomplish this in two steps. First get the actor object in the same way you did in the previous two methods.
  // Then delete the actor using this invocation
  //
  //        sharedContext.delete(actor)
  //
  // After that you do not need to delete the row from the table. That will be handled in the delegate. See reference sheet.
  override func tableView(tableView: UITableView,
    commitEditingStyle editingStyle: UITableViewCellEditingStyle,
    forRowAtIndexPath indexPath: NSIndexPath) {
      
      switch (editingStyle) {
      case .Delete:
        
        // Here we get the actor, then delete it from core data
        //let actor = fetchedResultsController.objectAtIndexPath(indexPath) as! Person
        //sharedContext.deleteObject(actor)
        CoreDataStackManager.sharedInstance().saveContext()
        
      default:
        break
      }
  }
  
  
  func controllerWillChangeContent(controller: NSFetchedResultsController) {
    self.tableView.beginUpdates()
  }
  
  func controller(controller: NSFetchedResultsController,
    didChangeSection sectionInfo: NSFetchedResultsSectionInfo,
    atIndex sectionIndex: Int,
    forChangeType type: NSFetchedResultsChangeType) {
      
      switch type {
      case .Insert:
        self.tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        
      case .Delete:
        self.tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        
      default:
        return
      }
  }
  
  //
  // This is the most interesting method. Take particular note of way the that newIndexPath
  // parameter gets unwrapped and put into an array literal: [newIndexPath!]
  //
  
  func controller(controller: NSFetchedResultsController,
    didChangeObject anObject: NSManagedObject,
    atIndexPath indexPath: NSIndexPath?,
    forChangeType type: NSFetchedResultsChangeType,
    newIndexPath: NSIndexPath?) {
      
      switch type {
        
      case .Update:
        let cell = tableView.cellForRowAtIndexPath(indexPath!) as! PFTableViewCell
        let Wall = controller.objectAtIndexPath(indexPath!) as! PFTableViewCell
        self.configureCell(cell, PFFile:PFfile)
        
      case .Move:
        tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
      }
  }
  
  func controllerDidChangeContent(controller: NSFetchedResultsController) {
    self.tableView.endUpdates()
  }
  
  
  // MARK: - Configure Cell
  
  // This method is new. It contains the code that used to be in cellForRowAtIndexPath.
  // Refactoring it into its own method allow the logic to be reused in the fetch results
  // delegate methods
  
  func configureCell(cell: PFTableViewCell, PFFile : PFfile) {
    cell.nameLabel!.text = PFTableViewCell.name
    cell.frameImageView.image = UIImage(named: )
    cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    
//    if let localImage = PFfile {
//      cell.PFImageView.image = localImage
//    } else if UIImage.imagePath == nil || PFfile.imagePath == "" {
//      cell.actorImageView.image = UIImage(named: "personNoImage")
//    }
      
      // If the above cases don't work, then we should download the image
      
//    else {
      
      // Set the placeholder
 //     cell.actorImageView.image = UIImage(named: "personPlaceholder")
      
      
//      let size = TheMovieDB.sharedInstance().config.profileSizes[1]
//      let task = TheMovieDB.sharedInstance().taskForImageWithSize(size, filePath: actor.imagePath!) { (imageData, error) -> Void in
        
//        if let data = imageData {
//          dispatch_async(dispatch_get_main_queue()) {
//            let image = UIImage(data: data)
//            actor.image = image
//            cell.actorImageView.image = image
//          }
//        }
//      }
      
//      cell.taskToCancelifCellIsReused = task
//    }
//  }
  
  
  // MARK: - Saving the array
  
//  var actorArrayURL: NSURL {
//    let filename = "favoriteActorsArray"
//    let documentsDirectoryURL: NSURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    
//    return documentsDirectoryURL.URLByAppendingPathComponent(filename)
//  }
//}


}

}
