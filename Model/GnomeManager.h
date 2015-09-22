//
//  GnomeManager.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^GetGnomesResponse)(NSArray *gnomes);


@interface GnomeManager : NSObject

+ (id)sharedManager;

- (void)attemptGetGnomesWithSuccess:(GetGnomesResponse)success;


@end
