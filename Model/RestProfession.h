//
//  RestProfession.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestProfession : NSObject

@property (nonatomic, retain) NSString *nameProfession;

+ (instancetype)fromDictionary:(NSDictionary *)dict;

+ (instancetype)fromArray:(NSArray *)dict;

+ (instancetype)fromString:(NSString *)dict;
@end
