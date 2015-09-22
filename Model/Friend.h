//
//  Friend.h
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
@class Gnome;
@interface Friend : NSManagedObject
@property (nonatomic, retain) NSString *nameFriend;
@property (nonatomic, retain) NSSet *gnome;
@end
