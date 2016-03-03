//
//  ManagedWallPost.swift
//  ParseTutorial
//  Created by Jeff_Chiu on 3/3/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//


import Foundation
import CoreData


class ManagedWallPost: NSManagedObject {
  
  // Insert code here to add functionality to your managed object subclass
  struct Keys {
    static let Name = "name"
    static let User = "user"
    static let Image = "image"
    static let Comment = "comments"
    //static let Data = "data"
    
  }
  
  var wallImage:UIImage?
  
  // Init method to insert object in core data
  override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
    super.init(entity: entity, insertIntoManagedObjectContext: context)
  }
  
  init(dictionary: [String : AnyObject], context: NSManagedObjectContext) {
    
    // Core Data
    let entity =  NSEntityDescription.entityForName("ManagedWallPost", inManagedObjectContext: context)!
    super.init(entity: entity, insertIntoManagedObjectContext: context)
  }
  
  init(wallPost: WallPost, context: NSManagedObjectContext) {
    
    // Core Data
    let entity =  NSEntityDescription.entityForName("ManagedWallPost", inManagedObjectContext: context)!
    super.init(entity: entity, insertIntoManagedObjectContext: context)
    name = wallPost.user.username!
    comment = wallPost.comment
    wallPost.image.getDataInBackgroundWithBlock{ data, error in
      if let data = data {
        self.image = data
      }
    }
  }
}
