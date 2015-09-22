//
//  Profession+RestProfession.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "Profession+RestProfession.h"

@implementation Profession (RestProfession)

+ (instancetype)fromRestProfession:(RestProfession *)restObj{
   
    Profession *obj = [Profession MR_findFirstByAttribute:@"nameProfession" withValue:restObj.nameProfession];

    if (obj==nil) {
        obj =[Profession MR_createEntity];
        
    }
    obj.nameProfession  = restObj.nameProfession;
 
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    return obj;
}

- (RestProfession *)toRestProfession;{
    RestProfession *robj = [RestProfession new];
    robj.nameProfession = self.nameProfession;
    return robj;
}
@end
