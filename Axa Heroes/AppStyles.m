//
//  AppStyles.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 17/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "AppStyles.h"
#import <UIKit/UIKit.h>
@interface AppStyles()

@end
@implementation AppStyles

+ (void)initAppStyles {
    
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{NSForegroundColorAttributeName : [UIColor whiteColor],
       NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:20.0f]
       }];
    
    [[UINavigationBar appearance] setBarTintColor:[AppStyles appColorReed]];
    [[UINavigationBar appearance]setTranslucent:NO];
  
    
    [[UITabBar appearance]setBarTintColor:[AppStyles appColorGrey]];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:10.0f],                                                    NSForegroundColorAttributeName : [UIColor whiteColor]
                                                        } forState:UIControlStateSelected];
  
    
    [UITabBarItem.appearance setTitleTextAttributes:
  @{NSForegroundColorAttributeName : [UIColor colorWithRed:1 green:1 blue:1 alpha:1]}
                                           forState:UIControlStateNormal];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance]setTranslucent:NO];

   
    

}
+(UIBarButtonItem *)addButton{
    
    UIImage *faceImage2 = [UIImage imageNamed:@"exit.png"];
    UIButton *face2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [face2 addTarget:self action:@selector(compareByDeliveryTime:) forControlEvents:UIControlEventTouchDown];
  
    face2.bounds = CGRectMake( 0, 0, 20, 20 );
    [face2 setImage:faceImage2 forState:UIControlStateNormal];

    UIBarButtonItem *faceBtn2 = [[UIBarButtonItem alloc] initWithCustomView:face2];
    
    faceBtn2.tintColor = [UIColor whiteColor];
   
    
    return faceBtn2;

}


+ (void)compareByDeliveryTime:(id)otherTime{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Exit App"
                                                    message:@"Do you want to exit?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}
+(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        exit(0);
    }
}
+ (UIColor *)appColorGrey {
    return [UIColor colorWithRed:66.0f/255.0 green: 72.0f/255.0 blue:87.0f/255.0 alpha:1.0f/1.0];
}

+ (UIColor *)appColorReed {
    return [UIColor colorWithRed:207.0f/255.0 green: 16.0f/255.0 blue:44.0f/255.0 alpha:1.0f/1.0];
}
@end
