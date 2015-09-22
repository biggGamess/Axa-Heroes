//
//  AppStyles.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 17/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppStyles : NSObject
+ (void)initAppStyles;
+ (UIColor *)appColorReed;
+ (UIColor *)appColorGrey;
+(UIBarButtonItem *)addButton;
+ (void)compareByDeliveryTime:(id)otherTime;
@end
