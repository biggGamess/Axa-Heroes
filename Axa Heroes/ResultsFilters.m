//
//  ResultsFilters.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 16/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "ResultsFilters.h"
#import "GnomesCell.h"
#import "Gnome.h"
#import "AppStyles.h"
@interface ResultsFilters ()
@property(nonatomic, strong) NSMutableArray *filtersgnomes;
@end

@implementation ResultsFilters

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationItem setTitle:@"Results Filters"];
    self.navigationItem.rightBarButtonItem=[AppStyles addButton];
  
  
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    GnomesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resultscell"];
    if (!cell) {
        cell = [[GnomesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"resultscell"];
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


@end
