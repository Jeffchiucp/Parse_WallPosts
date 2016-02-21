//
//  Wall.swift
//  ParseTutorial
//
//  Created by Jeff_Chiu on 2/16/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//

import Foundation
import CoreData

@objc(Wall)
class Wall: NSManagedObject {
  // Insert code here to add functionality to your managed object subclass


  struct Keys {
  static let User = "user"
  static let Image = "image"
  
  
}

@NSManaged var user: String
@NSManaged var comments: String
  

override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
  super.init(entity: entity, insertIntoManagedObjectContext: context)
}

init(Wall: [String : AnyObject], context: NSManagedObjectContext) {
  let entity =  NSEntityDescription.entityForName("user", inManagedObjectContext: context)!
  super.init(entity: entity,insertIntoManagedObjectContext: context)
  
  user = Wall[Keys.User] as! String
  
}
}