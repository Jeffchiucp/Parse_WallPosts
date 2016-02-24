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
  
  //PFfile is my dictionary for storing all of the data.
// Insert code here to add functionality to your managed object subclass
  
  struct Keys {
    static let Name = "name"
    static let Data = "data"
  }
  
  @NSManaged var name: String
  @NSManaged var imagefiletoWall: Wall

  var data: UIImage {
    return ImageCache().imageWithIdentifier(name)!
  }
  
  override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
    super.init(entity: entity, insertIntoManagedObjectContext: context)
  }
  
  init(PFfile: [String : AnyObject], context: NSManagedObjectContext) {
    let entity =  NSEntityDescription.entityForName("Photo", inManagedObjectContext: context)!
    super.init(entity: entity,insertIntoManagedObjectContext: context)
    
    name = PFfile[Keys.Name] as! String
    
    if let data = PFfile[Keys.Data] as? UIImage {
      ImageCache().storeImage(data, withIdentifier: self.name)
    }
    

  }
  
}