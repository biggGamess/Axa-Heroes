//
//  PersonalFilters.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 16/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "PersonalFilters.h"
#import "Gnome.h"
#import "AppStyles.h"
#import "ResultsFilters.h"
@interface PersonalFilters ()
@property(nonatomic, strong) NSMutableArray *filtersgnomes;
@property(nonatomic, strong) NSArray *resultsgnomes;
@end

@implementation PersonalFilters

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ScreenStyle];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationItem setTitle:@"Results Filters"];
    self.navigationItem.rightBarButtonItem=[AppStyles addButton];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    

    [self.view addGestureRecognizer:tap];
    
}

-(void)dismissKeyboard {
    [self.idTextField resignFirstResponder];
    [self.nameTextField resignFirstResponder];
    [self.ageTextField resignFirstResponder];
    [self.height1TextField resignFirstResponder];
    [self.height2TextField resignFirstResponder];
    [self.weight1TextField resignFirstResponder];
    [self.weight2TextField resignFirstResponder];
    
}

- (IBAction)IdFilter:(id)sender {
  
    Gnome *gnome = [Gnome MR_findFirstByAttribute:@"gnomeid"
                                           withValue:self.idTextField.text];
    [self checkgnome:gnome textgnome:self.idTextField];
   }
- (IBAction)nameFilter:(id)sender {
    Gnome *gnome = [Gnome MR_findFirstByAttribute:@"name"
                                        withValue:self.nameTextField.text];

   [self checkgnome:gnome textgnome:self.nameTextField];

}
- (IBAction)ageFilter:(id)sender {
    NSArray *gnomes = [Gnome MR_findByAttribute:@"age" withValue:self.ageTextField.text];
    [self checksgnomes:gnomes textgnome:self.ageTextField];
    
}
- (IBAction)heightFilter:(id)sender {
    
    NSPredicate *peopleFilter = [NSPredicate predicateWithFormat: @"height > %@ && height < %@",self.height1TextField.text,self.height2TextField.text];
    
    NSArray *people = [Gnome MR_findAllWithPredicate:peopleFilter];
    
    [self checksgnomestexts:people textgnomes1:self.height1TextField textgnomes2:self.height2TextField];
}
- (IBAction)weightFilter:(id)sender {
    NSPredicate *peopleFilter2 = [NSPredicate predicateWithFormat: @"weight > %@ && weight < %@",self.weight1TextField.text,self.weight2TextField.text];
    
    NSArray *people2 = [Gnome MR_findAllWithPredicate:peopleFilter2];
    [self checksgnomestexts:people2 textgnomes1:self.weight1TextField textgnomes2:self.weight2TextField];
}

//============================= Checks ==============================//

-(void)checkgnome:(Gnome *) gnome textgnome:(UITextField *) textgnome{
    if ((gnome == nil)|| (textgnome.text.length == 0)) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Don't found gnome"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"OK", nil];
        [alert show];

        
    }else{
        self.filtersgnomes = [NSMutableArray array];
        [self.filtersgnomes addObject:gnome];
        self.resultsgnomes = [NSArray arrayWithArray:self.filtersgnomes];
        ResultsFilters *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"results"];
        detailVC.gnomes = self.resultsgnomes;
        [self.navigationController pushViewController:detailVC animated:YES];
            }

}


-(void)checksgnomes:(NSArray *) gnomes textgnome:(UITextField *) textgnome{
    if (([gnomes count] == 0)|| (textgnome.text.length == 0)) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
            message:@"Don't found gnome"
            delegate:self
            cancelButtonTitle:@"Cancel"
            otherButtonTitles:@"OK", nil];
        [alert show];

    }else{
        ResultsFilters *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"results"];
        detailVC.gnomes = gnomes;
        [self.navigationController pushViewController:detailVC animated:YES];
       
    }
    
}

-(void)checksgnomestexts:(NSArray *) gnomes textgnomes1:(UITextField *) textgnomes1 textgnomes2:(UITextField *) textgnomes2{
    if (([gnomes count] == 0)|| ((textgnomes1.text.length == 0) || (textgnomes2.text.length == 0))) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Don't found gnome"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"OK", nil];
        [alert show];
        
    }else{
        ResultsFilters *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"results"];
        detailVC.gnomes = gnomes;
        [self.navigationController pushViewController:detailVC animated:YES];
        
    }
    
}

-(void)checktextfield:(UITextField *) textgnome{
    
    if (textgnome.text.length == 0) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
            message:@"Don't found gnome"
            delegate:self
            cancelButtonTitle:@"Cancel"
            otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
}

//================================ ScreenStyle =====================//

-(void)ScreenStyle{
    
    self.viewAge.layer.cornerRadius=7;
    self.viewAge.layer.masksToBounds=YES;
    self.viewAge.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    self.viewAge.layer.borderWidth=2.0f;
    
    self.viewName.layer.cornerRadius=7;
    self.viewName.layer.masksToBounds=YES;
    self.viewName.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    self.viewName.layer.borderWidth=2.0f;
    
    self.viewId.layer.cornerRadius=7;
    self.viewId.layer.masksToBounds=YES;
    self.viewId.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    self.viewId.layer.borderWidth=2.0f;
    
    self.buttonAge.layer.cornerRadius=7;
    self.buttonAge.layer.masksToBounds=YES;
    self.buttonAge.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    
    
    self.buttonName.layer.cornerRadius=7;
    self.buttonName.layer.masksToBounds=YES;
    self.buttonName.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    
    
    self.buttonId.layer.cornerRadius=7;
    self.buttonId.layer.masksToBounds=YES;
    self.buttonId.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    
    self.buttonHeigth.layer.cornerRadius=7;
    self.buttonHeigth.layer.masksToBounds=YES;
    self.buttonHeigth.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    
    self.buttonWeight.layer.cornerRadius=7;
    self.buttonWeight.layer.masksToBounds=YES;
    self.buttonWeight.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    
    
    self.viewHeight.layer.cornerRadius=7;
    self.viewHeight.layer.masksToBounds=YES;
    self.viewHeight.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    self.viewHeight.layer.borderWidth=2.0f;
    
    self.viewWeight.layer.cornerRadius=7;
    self.viewWeight.layer.masksToBounds=YES;
    self.viewWeight.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    self.viewWeight.layer.borderWidth=2.0f;
    
}

#define kOFFSET_FOR_KEYBOARD 50

-(void)keyboardWillShow {
    // Animate the current view out of the way
    
    if (self.view.frame.origin.y >= 30)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 30)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 30)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 30)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if (([sender isEqual:self.height1TextField])||([sender isEqual:self.height2TextField])||([sender isEqual:self.weight1TextField])||([sender isEqual:self.weight2TextField])){
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
    
}

-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
    
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {

        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

@end
