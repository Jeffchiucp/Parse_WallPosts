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

var sharedContext: NSManagedObjectContext {
  return CoreDataStackManager.sharedInstance().managedObjectContext
}


class WallPostViewController : UITableViewController, NSFetchedResultsControllerDelegate{

  
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
  
  
  // Step 1 - Add the lazy fetchedResultsController property. See the reference sheet in the lesson if you
  // want additional help creating this property.
  
  lazy var fetchedResultsController: NSFetchedResultsController = {
    
    let fetchRequest = NSFetchRequest(entityName: "ManagedWallPost")
    
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
    
    let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStackManager.sharedInstance().managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
    
    return fetchedResultsController
    
  }()
  
  
  // Step 5: Remove the fetchAllWallPicture() method, and the invocation
  // REMOVED
  
  // Mark: - Actions
  
  //func () {
  //  let controller = self.storyboard!.instantiateViewControllerWithIdentifier("WallPostViewController.swift") as! WallPostViewController
    
    //controller.delegate = self
    
  //  self.presentViewController(controller, animated: true, completion: nil)
  //}
  
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
  
  // Step 6: Replace the PFfile array in the table view methods. See the comments below
  
  // This one is particularly tricky. You will need to get the "section" object for section 0, then
  // get the number of objects in this section. See the reference sheet for an example.
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let sectionInfo = self.fetchedResultsController.sections![section]
    return sectionInfo.numberOfObjects
  }
  
  
  // This one is easy. Get the actor using the following statement:
  //
  //      fetchedResultsController.objectAtIndexPath(:) as PFfile
  //
  override func tableView(tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let CellIdentifier = "PFfile"
      
      // Here is how to replace the Pffile array using objectAtIndexPath

      let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as!
      WallPostTableViewCell
      
      let file = fetchedResultsController.objectAtIndexPath(indexPath) as! ManagedWallPost
      
      configureCell(cell, PFFile: file )
      // This is the new configureCell method
      
      return cell
  }
  
  // This one is also fairly easy. You can get the WallPost files in the same way as cellForRowAtIndexPath above.
  override func tableView(tableView: UITableView,
    didSelectRowAtIndexPath indexPath: NSIndexPath) {
      let controller =
      storyboard!.instantiateViewControllerWithIdentifier("")
        as! UploadImageViewController
      
      // Similar to the method above
       let file = fetchedResultsController.objectAtIndexPath(indexPath) as! PFfile
      
       // controller.file = file
      
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
        let file = fetchedResultsController.objectAtIndexPath(indexPath) as! PFfile
        sharedContext.deleteObject(file)
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
//issues with this cases?
//      case .Move:
//        self.tableView.moveSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
//      case .Update:
//        self.tableView.updateSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
      default:
        return
      }
  }
  
  //
  // This is the most interesting method. Take particular note of way the that newIndexPath
  // parameter gets unwrapped and put into an array literal: [newIndexPath!]
  //
  
    
    // let cell = tableView.cellForRowAtIndexPath(indexPath!) as! PFTableViewCell let cell = tableView.cellForRowAtIndexPath(indexPath!) as! WallPostTableViewCell let file = controller.objectAtIndexPath(indexPath!) as! PFfile self.configureCell(cell, PFFile:file) case .Move: tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade) tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade) } }

    
  func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
    
      switch type {
        
      case .Update:
        let cell = tableView.cellForRowAtIndexPath(indexPath!) as! WallPostTableViewCell
        let file = controller.objectAtIndexPath(indexPath!) as! PFfile
        self.configureCell(cell, PFFile:file)
        
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
  
  func configureCell(cell: WallPostTableViewCell, PFFile : PFfile) {
    
    //if there is an image, shows here
    
    //else
    
    
    //wallPost.image.getDataInBackgroundWithBlock
    
    wallPost.image.getDataInBackgroundWithBlock
    
    cell.postImage.image = PFFile.data
    cell.createdByLabel!.text = PFFile.imagefiletoWall.user
    cell.commentLabel!.text = PFFile.imagefiletoWall.comments
    
    
//    @IBOutlet weak var postImage: PFImageView!
//    @IBOutlet weak var createdByLabel: UILabel!
//    @IBOutlet weak var commentLabel: UILabel!
//    @IBOutlet weak var progressView: UIProgressView!
//  }

    
    
//    cell.nameLabel!.text = PFTableViewCell.name
//    cell.frameImageView.image = UIImage(named: )
//    cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    
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
