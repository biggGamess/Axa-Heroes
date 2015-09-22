//
//  RestGnome.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface RestGnome : NSObject


@property (nonatomic) NSNumber *gnomeid;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *thumbnail;
@property (nonatomic) NSNumber *age;
@property (nonatomic) NSNumber *weight;
@property (nonatomic) NSNumber *height;
@property (nonatomic, retain) NSString *haircolor;

@property (nonatomic, retain) NSArray *professions;
@property (nonatomic, retain) NSArray *friends;

@property (nonatomic, retain) NSString *nameFriend;
@property (nonatomic, retain) NSString *nameProfession;

+ (instancetype)fromDictionary:(NSDictionary *)dict;


@end
