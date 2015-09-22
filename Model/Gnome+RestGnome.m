//
//  Gnome+RestGnome.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "Gnome+RestGnome.h"
#import "Friend+RestFriend.h"
#import "Profession+RestProfession.h"
#import "RestFriend.h"
#import "RestProfession.h"

@implementation Gnome (RestGnome)

+ (instancetype)fromRestGnome:(RestGnome *)restObj{
    Gnome *obj = [Gnome MR_findFirstByAttribute:@"gnomeid" withValue:restObj.gnomeid];
    
    if (obj==nil) {
        obj = [Gnome MR_createEntity];
    }
    
    obj.gnomeid  = restObj.gnomeid;
    obj.name   = restObj.name;
    obj.thumbnail       = restObj.thumbnail;
    obj.age  = restObj.age;
    obj.weight    = restObj.weight;
    obj.height   = restObj.height;
    obj.haircolor   = restObj.haircolor;
    
    
    NSMutableArray *comicsAux = [NSMutableArray array];
    
    for (RestFriend *rc in restObj.friends) {
        Friend *friend = [Friend fromRestFriend:rc];
        
        [comicsAux addObject:friend];
        
        
    }
    obj.friend = [NSSet setWithArray:comicsAux];
    
    NSMutableArray *seriesAux = [NSMutableArray array];
    
    for (RestProfession *rs in restObj.professions) {
        
        Profession *profession = [Profession fromRestProfession:rs];
        [seriesAux addObject:profession];
        
    }
    obj.profession = [NSSet setWithArray:seriesAux];

    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    return obj;

}

- (RestGnome *)toRestGnome:(Gnome *)obj {
    RestGnome *robj = [RestGnome new];
    robj.gnomeid  = obj.gnomeid;
    robj.name   = obj.name;
    robj.thumbnail       = obj.thumbnail;
    robj.age  = obj.age;
    robj.weight    = obj.weight;
    robj.height    = obj.height;
    robj.haircolor   = obj.haircolor;
    
    
    
    NSMutableArray *aux = [NSMutableArray array];
    for (Profession *ceprofession in obj.profession) {
        RestProfession *rccomic = [ceprofession toRestProfession];
        [aux addObject:rccomic];
        robj.professions = [NSArray arrayWithArray:aux];
    }
    
    NSMutableArray *aux2 = [NSMutableArray array];
    for (Friend *ceserie in obj.friend) {
        RestFriend *rcseries = [ceserie toRestFriend];
        [aux2 addObject:rcseries];
        robj.friends = [NSArray arrayWithArray:aux2];
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    return robj;
}

@end
