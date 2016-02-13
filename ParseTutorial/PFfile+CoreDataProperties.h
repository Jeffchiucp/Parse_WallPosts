//
//  PFfile+CoreDataProperties.h
//  ParseTutorial
//
//  Created by Jeff_Chiu on 2/13/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PFfile.h"

NS_ASSUME_NONNULL_BEGIN

@interface PFfile (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *data;
@property (nullable, nonatomic, retain) WallPost *imagefiletoWall;

@end

NS_ASSUME_NONNULL_END
