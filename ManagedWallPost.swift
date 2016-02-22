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
//    static let Data = "data"
    static let User = "user"
    static let Image = "image"
    static let Comment = "comments"
  }
// Insert code here to add functionality to your managed object subclass

  
  @NSManaged var name: String?
  @NSManaged var user: String?
  @NSManaged var comment: String?
  @NSManaged var imagefiletoWall: String?
  
  init(dictionary: [String : AnyObject], context: NSManagedObjectContext) {
    
    // Core Data
    let entity =  NSEntityDescription.entityForName("ManageWallPost", inManagedObjectContext: context)!
    super.init(entity: entity, insertIntoManagedObjectContext: context)
    
    // Dictionary
    name = PFfile[Keys.Name] as! String
    
//    if let dateString = dictionary[Keys.ReleaseDate] as? String {
//      if let date = TheMovieDB.sharedDateFormatter.dateFromString(dateString) {
//        releaseDate = date
      }
    }
  }
  var data: UIImage {
    return ImageCache().imageWithIdentifier(name)!
  }
  
  var Image: UIImage? {
    get {
      return
//      ImageCache().storeImage(data, withIdentifier: self.name)
// imageCache.imageWithIdentifier(data)
    }
    
    set {
//      TheMovieDB.Caches.imageCache.storeImage(newValue, withIdentifier: posterPath!)
    }
  }
}

