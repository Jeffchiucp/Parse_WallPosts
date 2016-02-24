//
//  WallPost.swift
//  ParseTutorial
//
//  Created by Jeff Chiu on 1/17/16
//  Copyright (c) 2016 Jeff Chiu All rights reserved.
//

import Foundation

class WallPost: PFObject, PFSubclassing {
  @NSManaged var image: PFFile
  @NSManaged var user: PFUser
  @NSManaged var comment: String?

  //1
  class func parseClassName() -> String {
    return "WallPost"
  }
  
  //2
  override class func initialize() {
    var onceToken: dispatch_once_t = 0
    dispatch_once(&onceToken) {
      self.registerSubclass()
    }
  }
  
  override class func query() -> PFQuery? {
    let query = PFQuery(className: WallPost.parseClassName()) //1
    query.includeKey("user") //2
    query.orderByDescending("createdAt") //3
    return query
  }
  
  init(image: PFFile, user: PFUser, comment: String?) {
    super.init()
    
    self.image = image
    self.user = user
    self.comment = comment
  }
  
  override init() {
    super.init()
  }
  
}
