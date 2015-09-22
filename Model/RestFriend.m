//
//  RestFriend.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "RestFriend.h"

@implementation RestFriend

+ (instancetype)fromDictionary:(NSDictionary *)dict{
    RestFriend *obj = [[RestFriend alloc] init];
        obj.nameFriend=dict[@"nameFriend"]?:@"";
   
    return obj;
}

+ (instancetype)fromArray:(NSArray *)dict{
    RestFriend *obj = [[RestFriend alloc] init];
    
    for (NSString *auxfriend in dict) {
        obj.nameFriend=auxfriend;
    }
    return obj;
}

+ (instancetype)fromString:(NSString *)dict{
    RestFriend *obj = [[RestFriend alloc] init];
    
  
        obj.nameFriend=dict;
    
    return obj;
}
@end
