//
//  PFfile+CoreDataProperties.swift
//  ParseTutorial
//
//  Created by Jeff_Chiu on 2/16/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension PFfile {

    @NSManaged var name: String?
    @NSManaged var data: String?
    @NSManaged var imagefiletoWall: WallPost?

}
