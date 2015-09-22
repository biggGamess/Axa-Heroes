//
//  RestProfession.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "RestProfession.h"

@implementation RestProfession

+ (instancetype)fromDictionary:(NSDictionary *)dict{
    RestProfession *obj = [[RestProfession alloc] init];
        obj.nameProfession=dict[@"nameProfession"]?:@"";
    
    return obj;
}

+ (instancetype)fromArray:(NSArray *)dict{
    
    RestProfession *obj = [[RestProfession alloc] init];
    
    for (NSString *auxprofession in dict) {
        obj.nameProfession=auxprofession;
    }

    return obj;
    
}

+ (instancetype)fromString:(NSString *)dict{
    
    RestProfession *obj = [[RestProfession alloc] init];
    obj.nameProfession=dict;
    
    return obj;

    
}
@end
