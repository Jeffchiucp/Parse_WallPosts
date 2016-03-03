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


class ManagedWallPost1: NSManagedObject {

  struct Keys {
    static let Name = "name"
    static let User = "user"
    static let Image = "image"
    static let Comment = "comments"
    //static let Data = "data"

  }
// Insert code here to add functionality to your managed object subclass

  
  @NSManaged var name: String?
  @NSManaged var user: String?
  @NSManaged var comment: String?
  @NSManaged var image: NSData?
  var wallImage:UIImage?
  
//  let imageCache = (UIApplication.sharedApplication().delegate as! AppDelegate).imageCache
  // 0 unread message below
  
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

//  var data: UIImage {
//    return imageCache.imageWithIdentifier()!
//  }
  
//  var Image: UIImage? {
//    get {
//      return imageCache.storeImage(data, withIdentifier: name)
// imageCache.imageWithIdentifier(data)
//    }
//
//    set {
//      return imageCache.storeImage(data, withIdentifier: name)
//    }
//  }
}

