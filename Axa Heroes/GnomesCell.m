//
//  GnomesCell.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "GnomesCell.h"
#import "Profession.h"
#import "Friend.h"
#import "UIImageView+Webcache.h"
#import "NSString+MD5.h"
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

@implementation GnomesCell

- (void)awakeFromNib {
    self.viewGnome.layer.cornerRadius=7;
    self.viewGnome.layer.masksToBounds=YES;
    self.viewGnome.layer.borderColor= [UIColor colorWithRed:238.0f/255.0 green: 238.0f/255.0 blue:238.0f/255.0 alpha:1.0f/1.0].CGColor;
    self.viewGnome.layer.borderWidth=2.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setNameString:(NSString *)nameString{
    self.nameGnome.text = nameString;
}

-(void)setIdString:(NSNumber *)idString{
    self.idGnome.text = [NSString stringWithFormat:@"%@",idString];
}

-(void)setAgeString:(NSNumber *)ageString{
    self.ageGnome.text = [NSString stringWithFormat:@"%@",ageString];
}

-(void)setWeightString:(NSNumber *)weightString{
    self.weightGnome.text = [NSString stringWithFormat:@"%@",weightString];
}

-(void)setHeightString:(NSNumber *)heightString{
    self.heightGnome.text = [NSString stringWithFormat:@"%@",heightString];
}

-(void)setImageHeroe:(UIImageView *)imageHeroe pictureURL:(NSURL *)pictureURL{
  
    NSURL *imageURL = pictureURL;
    [self.imgGnome sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"anonymous_user.png"]options:SDWebImageDelayPlaceholder];
  
}

-(void)gnomeFriends:(NSSet *)gnomeFriends{
    NSMutableString *namefriends = [[NSMutableString alloc]init];
    
    if ( IDIOM == IPAD ) {
        for (Friend *friend in gnomeFriends) {
            [namefriends appendString:[NSString stringWithFormat:@"%@,",friend.nameFriend]];
        }
        self.friendsGnome.editable=NO;
        
        if (namefriends.length!=0) {
            NSString *newString = [namefriends substringToIndex:[namefriends length]-1];
            [self.friendsGnome setText:newString];
        }else{
  
            [self.friendsGnome setText:namefriends];
        }
     
    } else {
        for (Friend *friend in gnomeFriends) {
            [namefriends appendString:[NSString stringWithFormat:@"%@\n",friend.nameFriend]];
        }
        self.friendsGnome.editable=NO;
        self.friendsGnome.contentSize = CGSizeMake(300,300);

        [self.friendsGnome setScrollEnabled:NO];
        [self.friendsGnome setText:namefriends];
    }
    

}

-(void)setLine:(UIView *)line{
    [self.contentView addSubview:line];
}


-(void)gnomeProfession:(NSSet *)gnomeProfession{
    NSMutableString *namesprofessions = [[NSMutableString alloc]init];
    
    
    if ( IDIOM == IPAD ) {
        for (Profession *profession in gnomeProfession){
            [namesprofessions appendString:[NSString stringWithFormat:@"%@,",profession.nameProfession]];
        }
         self.professionsGnome.editable=NO;
        
            if (namesprofessions.length!=0) {
                NSString *newString = [namesprofessions substringToIndex:[namesprofessions length]-1];

                [self.professionsGnome setText:newString];
            }else{
                [self.professionsGnome setText:namesprofessions];
            }
        
    } else {
        for (Profession *profession in gnomeProfession){
            [namesprofessions appendString:[NSString stringWithFormat:@"%@ \n",profession.nameProfession]];
        }
        self.professionsGnome.editable=NO;
        [self.professionsGnome setScrollEnabled:NO];
        
        [self.professionsGnome setText:namesprofessions];
    }
}






@end
