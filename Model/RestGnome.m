//
//  RestGnome.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "RestGnome.h"
#import "RestFriend.h"
#import "RestProfession.h"
@implementation RestGnome

+ (instancetype)fromDictionary:(NSDictionary *)dict {
    RestGnome *obj = [[RestGnome alloc] init];
    
   
        obj.gnomeid   = dict[@"id"]?:@"";
        obj.name      = dict[@"name"]?:@"";
        obj.thumbnail   = dict[@"thumbnail"]?:@"";
        obj.age   = dict[@"age"]?:@"";
        obj.weight   = dict[@"weight"]?:@"";
        obj.height   = dict[@"height"]?:@"";
    
    if (dict[@"hair_color"]!=(id)[NSNull null]) {
        obj.haircolor   = dict[@"hair_color"];
    }
    
    if (dict[@"professions"]) {
        NSMutableArray *arr     = [NSMutableArray array];
        NSMutableArray *arr2     = [NSMutableArray array];
        NSArray *dicProfessions = dict[@"professions"];
        NSArray *dicFriends = dict[@"friends"];

        for (NSString *auxprof in dicProfessions) {
            RestProfession *cp = [RestProfession fromString:auxprof];
            [arr addObject:cp];
            
        }
        
        obj.professions = [NSArray arrayWithArray:arr];
        
        for (NSString *auxfriend in dicFriends) {
            RestFriend *cf = [RestFriend fromString:auxfriend];
            [arr2 addObject:cf];
            }
        
        obj.friends = [NSArray arrayWithArray:arr2];
    }

    
    
    return obj;
    
}

@end
