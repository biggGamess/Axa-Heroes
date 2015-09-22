//
//  Profession+RestProfession.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "Profession.h"
#import "RestProfession.h"
#import <MagicalRecord.h>
@interface Profession (RestProfession)

+ (instancetype)fromRestProfession:(RestProfession *)restObj;
- (RestProfession *)toRestProfession;

@end
