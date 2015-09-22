//
//  Home.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppStyles.h"
@interface Home : UITableViewController
@property (nonatomic, retain) UIRefreshControl *refresh;
- (void)getLatestLoans;
@end
