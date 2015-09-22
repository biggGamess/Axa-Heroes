//
//  GnomesCell.h
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//
#import "Gnome.h"
#import <UIKit/UIKit.h>

@interface GnomesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgGnome;
@property (weak, nonatomic) IBOutlet UILabel *idGnome;
@property (weak, nonatomic) IBOutlet UILabel *nameGnome;
@property (weak, nonatomic) IBOutlet UILabel *ageGnome;
@property (weak, nonatomic) IBOutlet UILabel *weightGnome;
@property (weak, nonatomic) IBOutlet UILabel *heightGnome;
@property (weak, nonatomic) IBOutlet UITextView *friendsGnome;
@property (weak, nonatomic) IBOutlet UITextView *professionsGnome;

@property (strong, nonatomic) NSNumber *idString;
@property (strong, nonatomic) NSString *nameString;
@property (strong, nonatomic) NSNumber *ageString;
@property (strong, nonatomic) NSNumber *weightString;
@property (strong, nonatomic) NSNumber *heightString;
@property (strong, nonatomic) NSString *friendsString;
@property (strong, nonatomic) UIView *line;
-(void)setImageHeroe:(UIImageView *)imageHeroe pictureURL:(NSURL *)pictureURL;
-(void)gnomeFriends:(NSSet *)gnomeFriends;
@property (weak, nonatomic) IBOutlet UIView *viewGnome;
@property (weak, nonatomic) IBOutlet UIView *lineGnome;
-(void)gnomeProfession:(NSSet *)gnomeProfession;
@property (weak, nonatomic) IBOutlet UIView *viewidgnome;
@end
