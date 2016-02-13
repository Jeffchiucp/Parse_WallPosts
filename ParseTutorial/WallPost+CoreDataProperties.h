//
//  WallPost+CoreDataProperties.h
//  ParseTutorial
//
//  Created by Jeff_Chiu on 2/13/16.
//  Copyright © 2016 Ron Kliffer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WallPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface WallPost (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *pffile;
@property (nullable, nonatomic, retain) NSString *user;
//@property (nullable, nonatomic, retain) PFfile *pffile;

@end

NS_ASSUME_NONNULL_END
