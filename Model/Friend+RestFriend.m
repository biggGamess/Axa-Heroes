//
//  Friend+RestFriend.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "Friend+RestFriend.h"

@implementation Friend (RestFriend)

+ (instancetype)fromRestFriend:(RestFriend *)restObj{
    
    Friend *obj = [Friend MR_findFirstByAttribute:@"nameFriend" withValue:restObj.nameFriend];
  
    if (obj==nil) {
        obj =[Friend MR_createEntity];
        
    }
    obj.nameFriend  = restObj.nameFriend;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    return obj;
}

- (RestFriend *)toRestFriend{
    RestFriend *robj = [RestFriend new];
    robj.nameFriend = self.nameFriend;
    return robj;
}
@end
