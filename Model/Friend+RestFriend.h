//
//  Friend+RestFriend.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "Friend.h"
#import <MagicalRecord.h>
#import "RestFriend.h"
@interface Friend (RestFriend)

+ (instancetype)fromRestFriend:(RestFriend *)restObj;
- (RestFriend *)toRestFriend;
@end
