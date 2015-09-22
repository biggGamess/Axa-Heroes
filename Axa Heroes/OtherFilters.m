//
//  OtherFilters.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 16/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//
#import "ARSPopover.h"
#import "OtherFilters.h"
#import "Friend.h"
#import "Profession.h"
#import "Gnome.h"
#import "ResultsFilters.h"
#import "Home.h"
#import "AppStyles.h"
@interface OtherFilters ()
@property(nonatomic, strong) NSArray *gnomes;
@property(nonatomic, strong) NSMutableArray *auxfriend;
@property(nonatomic, strong) NSMutableArray *auxprofession;
@property(nonatomic, strong) NSMutableArray *auxprofession2;
@property(nonatomic, strong) NSMutableArray *autocompleteUrls;
@property(nonatomic, strong) UITableView *autocompleteTableView;
@property(nonatomic) BOOL checkstate;
@end

@implementation OtherFilters


- (void)viewDidLoad {
    [super viewDidLoad];
    self.gnomes = [Gnome MR_findAll];
    [self ScreenStyle];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationItem setTitle:@"Other Filters"];
    self.navigationItem.rightBarButtonItem=[AppStyles addButton];

    [self.friendTextField addTarget:self action:@selector(textFieldDidChangeFriend:) forControlEvents:UIControlEventEditingChanged];
     [self.friendTextField addTarget:self action:@selector(searchAutocompleteEntriesWithSubstring:) forControlEvents:UIControlEventEditingChanged];
    
    [self.txtFieldProfession addTarget:self action:@selector(textFieldDidChangeProfession:) forControlEvents:UIControlEventEditingChanged];
    [self.txtFieldProfession addTarget:self action:@selector(searchAutocompleteEntriesWithSubstringProfession:) forControlEvents:UIControlEventEditingChanged];
    
    _autocompleteUrls = [NSMutableArray array];
  
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
  
}

-(void)dismissKeyboard {
    [self.txtFieldProfession resignFirstResponder];
    [self.friendTextField resignFirstResponder];
}
//============================== ACTIONS =======================================//

- (IBAction)filterFriend:(id)sender {
    NSArray *friends = [Friend MR_findByAttribute:@"nameFriend"
                                        withValue:self.friendTextField.text];
    NSMutableArray *arrayVaciaJobs = [[NSMutableArray alloc]init];
    
    
    for (Gnome *gnomesfriend in self.gnomes) {
              for (Friend *f in gnomesfriend.friend) {
                  for (Friend *f2 in friends) {
                      if ([f2.nameFriend isEqualToString:f.nameFriend])
                      {
                          BOOL isTheObjectThere = TRUE;
                          if (isTheObjectThere) {

                          [arrayVaciaJobs addObject:gnomesfriend];
                          isTheObjectThere=false;
                          }else{
                          isTheObjectThere=false;
                          }
                      }
                      
                  }
              }
    }
    
    ResultsFilters *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"results"];
    detailVC.gnomes = arrayVaciaJobs;
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
    
}

- (IBAction)filterProfession:(id)sender {
    NSArray *profession = [Profession MR_findByAttribute:@"nameProfession"
                                        withValue:self.txtFieldProfession.text];
    NSMutableArray *arrayVaciaJobs = [[NSMutableArray alloc]init];
    for (Gnome *gnomesprofession in self.gnomes) {
        for (Profession *p in gnomesprofession.profession) {
            for (Profession *p2 in profession) {
                if ([p2.nameProfession isEqualToString:p.nameProfession])
                {
                        [arrayVaciaJobs addObject:gnomesprofession];
                }
                
            }
        }
    }
    ResultsFilters *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"results"];
    detailVC.gnomes = arrayVaciaJobs;
    [self.navigationController pushViewController:detailVC animated:YES];
   
}

//============================== STYLES =======================================//



-(void)ScreenStyle{
    
    self.viewFriend.layer.cornerRadius=7;
    self.viewFriend.layer.masksToBounds=YES;
    self.viewFriend.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    self.viewFriend.layer.borderWidth=2.0f;
    
    self.viewProfession.layer.cornerRadius=7;
    self.viewProfession.layer.masksToBounds=YES;
    self.viewProfession.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    self.viewProfession.layer.borderWidth=2.0f;
    
    self.buttonFriend.layer.cornerRadius=7;
    self.buttonFriend.layer.masksToBounds=YES;
    
    self.buttonProfession.layer.cornerRadius=7;
    self.buttonProfession.layer.masksToBounds=YES;
}


// =============================== Autocomplete Friend ================= //

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    _auxfriend = [NSMutableArray array];
    for (Gnome *gnomesfriend in self.gnomes) {
        for (Friend *f in gnomesfriend.friend) {
            NSString *auxstring = [NSString string];
            auxstring = f.nameFriend;
            [_auxfriend addObject:auxstring];
        }
    }
    
    [_autocompleteUrls removeAllObjects];
    
    NSString *match = self.friendTextField.text;
    
    
    NSPredicate *sPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", match];
    
    _autocompleteUrls = [[_auxfriend filteredArrayUsingPredicate:sPredicate] mutableCopy];
    
    [_autocompleteTableView reloadData];
  
    _checkstate = true;
}

- (void)textFieldDidChangeFriend:(UITextField *)txtFld {
    
    ARSPopover *popoverController = [ARSPopover new];
    popoverController.sourceView = self.friendTextField;
    popoverController.sourceRect = CGRectMake(CGRectGetMidX(self.friendTextField.bounds), CGRectGetMaxY(self.friendTextField.bounds), 0, 0);
    popoverController.contentSize = CGSizeMake(250, 300);
    popoverController.arrowDirection = UIPopoverArrowDirectionUp;
    
    [self presentViewController:popoverController animated:YES completion:^{
        [popoverController insertContentIntoPopover:^(ARSPopover *popover, CGSize popoverPresentedSize, CGFloat popoverArrowHeight) {
    
            _autocompleteTableView = [[UITableView alloc] initWithFrame:CGRectMake(popover.view.frame.origin.x, popover.view.frame.origin.y, popover.view.frame.size.width, popover.view.frame.size.height) style:UITableViewStylePlain];
            _autocompleteTableView.delegate = self;
            _autocompleteTableView.dataSource = self;
            _autocompleteTableView.scrollEnabled = YES;
            _autocompleteTableView.hidden = NO;
            [popover.view addSubview:_autocompleteTableView];
        
            
        }];
    }];
    
}

// =============================== Autocomplete Profession ================= //

- (void)searchAutocompleteEntriesWithSubstringProfession:(NSString *)substring {
    _auxprofession = [NSMutableArray array];
    _auxprofession2 = [NSMutableArray array];
    for (Gnome *gnomesprofession in self.gnomes) {
        for (Profession *p in gnomesprofession.profession) {
            NSString *auxstring = [NSString string];
            auxstring = p.nameProfession;
            [_auxprofession addObject:auxstring];

        }
    }
    
    for (id obj in _auxprofession) {
        if (![_auxprofession2 containsObject:obj]) {
            [_auxprofession2 addObject:obj];
        }
    }
   
    [_autocompleteUrls removeAllObjects];
    NSString *match = self.txtFieldProfession.text;
    
    
    NSPredicate *sPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", match];
    
    _autocompleteUrls = [[_auxprofession2 filteredArrayUsingPredicate:sPredicate] mutableCopy];

    [_autocompleteTableView reloadData];
    _checkstate = false;
}

- (void)textFieldDidChangeProfession:(UITextField *)txtFld {
    
    ARSPopover *popoverController = [ARSPopover new];
    popoverController.sourceView = txtFld;
    popoverController.sourceRect = CGRectMake(CGRectGetMidX(txtFld.bounds), CGRectGetMaxY(txtFld.bounds), 0, 0);
    popoverController.contentSize = CGSizeMake(250, 300);
    popoverController.arrowDirection = UIPopoverArrowDirectionUp;
    
    [self presentViewController:popoverController animated:YES completion:^{
        [popoverController insertContentIntoPopover:^(ARSPopover *popover, CGSize popoverPresentedSize, CGFloat popoverArrowHeight) {
            
            _autocompleteTableView = [[UITableView alloc] initWithFrame:CGRectMake(popover.view.frame.origin.x, popover.view.frame.origin.y, popover.view.frame.size.width, popover.view.frame.size.height) style:UITableViewStylePlain];
            _autocompleteTableView.delegate = self;
            _autocompleteTableView.dataSource = self;
            _autocompleteTableView.scrollEnabled = YES;
            _autocompleteTableView.hidden = NO;
            [popover.view addSubview:_autocompleteTableView];
            
            
        }];
    }];
    
}

// =========================== Table View Methods =================== //

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section {
    return _autocompleteUrls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"AutoCompleteRowIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AutoCompleteRowIdentifier"];
    }
    
    cell.textLabel.text = [_autocompleteUrls objectAtIndex:indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    if (_checkstate == true) {
        self.friendTextField.text = selectedCell.textLabel.text;


    }else{
        self.txtFieldProfession.text = selectedCell.textLabel.text;
    }
    
}





@end
