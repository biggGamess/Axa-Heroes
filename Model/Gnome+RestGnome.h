//
//  Gnome+RestGnome.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "Gnome.h"
#import "RestGnome.h"
#import "Gnome.h"

@interface Gnome (RestGnome)

+ (instancetype)fromRestGnome:(RestGnome *)restObj;
- (RestGnome *)toRestGnome:(Gnome *)obj;

@end
