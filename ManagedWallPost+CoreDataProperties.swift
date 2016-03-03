//
//  ManagedWallPost+CoreDataProperties.swift
//  ParseTutorial
//
//  Created by Jeff_Chiu on 3/2/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ManagedWallPost {

    @NSManaged var comment: String?
    @NSManaged var image: NSData?
    @NSManaged var name: String?
    @NSManaged var user: String?

}
