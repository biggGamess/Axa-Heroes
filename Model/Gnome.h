//
//  Gnome.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MagicalRecord.h>

@class Friend,Profession;

@interface Gnome : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *thumbnail;
@property (nonatomic) NSNumber *age;
@property (nonatomic) NSNumber *weight;
@property (nonatomic) NSNumber *gnomeid;
@property (nonatomic) NSNumber *height;
@property (nonatomic, retain) NSString *haircolor;

@property (nonatomic, retain) NSSet *profession;
@property (nonatomic, retain) NSSet *friend;

@end
