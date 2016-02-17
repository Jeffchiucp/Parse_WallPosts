//
//  PFfile.swift
//  ParseTutorial
//
//  Created by Jeff_Chiu on 2/16/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//


import Foundation
import CoreData


@objc(PFfile)
class PFfile: NSManagedObject {
  
// Insert code here to add functionality to your managed object subclass
  
  struct Keys {
    static let Name = "name"
    static let Data = "data"
  }
  
  @NSManaged var name: String
  @NSManaged var data: String
  
  override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
    super.init(entity: entity, insertIntoManagedObjectContext: context)
  }
  
  init(dictionary: [String : AnyObject], context: NSManagedObjectContext) {
    let entity =  NSEntityDescription.entityForName("Photo", inManagedObjectContext: context)!
    super.init(entity: entity,insertIntoManagedObjectContext: context)
    
    name = dictionary[Keys.Name] as! String
    
    if let data = dictionary[Keys.Data] as? String {
      data = pathForImage
    }
    
  }
  
}