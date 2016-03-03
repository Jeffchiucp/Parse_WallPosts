//
//  ManagedWallPost.swift
//  ParseTutorial
//
//  Created by Jeff_Chiu on 2/22/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//

import Foundation
import CoreData
@objc(ManagedWallPost)


class ManagedWallPost: NSManagedObject {
  
  struct Keys {
    static let Name = "name"
    static let User = "user"
    static let Image = "image"
    static let Comment = "comments"
    //static let Data = "data"
    
  }
  // Insert code here to add functionality to your managed object subclass
  
  var wallImage:UIImage?
//init method to insert object into core data
  override init(entity: NSEntityDescription, insertIntoManagedObjectContext context:NSManagedObjectContext?) {
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

