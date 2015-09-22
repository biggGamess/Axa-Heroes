//
//  PersonalFilters.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 16/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalFilters : UIViewController
@property (weak, nonatomic) IBOutlet UIView *viewId;
@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UIButton *buttonId;
- (IBAction)IdFilter:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewName;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIButton *buttonName;
- (IBAction)nameFilter:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewAge;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UIButton *buttonAge;
- (IBAction)ageFilter:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *viewHeight;
@property (weak, nonatomic) IBOutlet UITextField *height1TextField;
@property (weak, nonatomic) IBOutlet UITextField *height2TextField;
@property (weak, nonatomic) IBOutlet UIButton *buttonHeigth;
- (IBAction)heightFilter:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *weight1TextField;
@property (weak, nonatomic) IBOutlet UITextField *weight2TextField;
@property (weak, nonatomic) IBOutlet UIButton *buttonWeight;
- (IBAction)weightFilter:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewWeight;









@end
