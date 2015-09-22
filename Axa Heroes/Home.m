//
//  Home.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "Home.h"
#import "GnomeManager.h"
#import "Gnome.h"
#import "GnomesCell.h"
#import "AppStyles.h"
#import "MBProgressHUD.h"


@interface Home ()

@property(nonatomic, strong) NSArray *gnomes;

@end

@implementation Home
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationItem setTitle:@"Gnomes of town"];
    self.navigationItem.rightBarButtonItem=[AppStyles addButton];
  
    
    self.gnomes = [Gnome MR_findAll];
    
    // Initialize the refresh control.
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor whiteColor];
    self.refreshControl.tintColor = [UIColor blackColor];
    [self.refreshControl addTarget:self
                            action:@selector(getLatestLoans)
                  forControlEvents:UIControlEventValueChanged];


}

- (void)getLatestLoans
{
    // Reload table data
    [self.tableView reloadData];
    
    if (self.refreshControl) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor blackColor]
                                                                    forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        self.refreshControl.attributedTitle = attributedTitle;

        [[GnomeManager sharedManager] attemptGetGnomesWithSuccess:^(NSArray *gnomes) {
         self.gnomes = [Gnome MR_findAll];
         [self.tableView reloadData];
         [self.refreshControl endRefreshing];
         }];

        
    
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    if([self.gnomes count] == 0){
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    if (!hud) {
        hud = [[MBProgressHUD alloc]initWithView:self.view];
        [self.view addSubview:hud];
    }
    
    [hud setLabelText:@"Loading..."];
    [hud setMode:MBProgressHUDModeIndeterminate];
    //[hud setAnimationType:MBProgressHUDAnimationZoom];
    
    [hud show:YES];
    [[GnomeManager sharedManager] attemptGetGnomesWithSuccess:^(NSArray *gnomes) {
        self.gnomes = [Gnome MR_findAll];
        
        [self.tableView reloadData];
        
        
        [[MBProgressHUD HUDForView:self.view] hide:YES];
    }];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    GnomesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gnomescell"];
    if (!cell) {
        cell = [[GnomesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"gnomescell"];
    }
 
    
    [self configureCell:cell withAtIndexPath:indexPath];
    return cell;
    
}
- (void)configureCell:(GnomesCell *)cell withAtIndexPath:(NSIndexPath *)indexPath {
    Gnome *gnome = [self.gnomes objectAtIndex:indexPath.row];

    [cell setNameString:gnome.name];
    [cell setAgeString:gnome.age];
    [cell setHeightString:gnome.height];
    [cell setWeightString:gnome.weight];
    [cell setIdString:gnome.gnomeid];
    NSURL *picture = [NSURL URLWithString:gnome.thumbnail];
    [cell setImageHeroe:cell.imgGnome pictureURL:picture];
    [cell gnomeFriends:gnome.friend];
    cell.line = [[UIView alloc] initWithFrame:CGRectMake(18, 150, cell.viewGnome.frame.size.width+100, 2)];
    cell.line.backgroundColor = [UIColor blackColor];
    [cell setLine:cell.line];
    [cell gnomeProfession:gnome.profession];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return self.gnomes.count;
  
}

- (CGFloat) tableView: (UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 314;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 3.f;
}

@end
