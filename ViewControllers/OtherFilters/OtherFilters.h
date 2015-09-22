//
//  OtherFilters.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 16/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherFilters : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *friendTextField;
@property (weak, nonatomic) IBOutlet UIView *viewFriend;
@property (weak, nonatomic) IBOutlet UIButton *buttonFriend;
@property (weak, nonatomic) IBOutlet UITableView *tables;
- (IBAction)filterFriend:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *txtFieldProfession;
@property (weak, nonatomic) IBOutlet UIView *viewProfession;
@property (weak, nonatomic) IBOutlet UIButton *buttonProfession;
- (IBAction)filterProfession:(id)sender;




@end
