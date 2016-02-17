//
//  Wall.swift
//  ParseTutorial
//
//  Created by Jeff_Chiu on 2/16/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//

import Foundation

struct Keys {
  static let User = "user"
}

@NSManaged var user: String

override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
  super.init(entity: entity, insertIntoManagedObjectContext: context)
}

init(dictionary: [String : AnyObject], context: NSManagedObjectContext) {
  let entity =  NSEntityDescription.entityForName("user", inManagedObjectContext: context)!
  super.init(entity: entity,insertIntoManagedObjectContext: context)
  
  user = dictionary[Keys.user] as! String
  
}

var image: UIImage? {
get {
  return
