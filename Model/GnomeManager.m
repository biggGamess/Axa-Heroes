//
//  GnomeManager.m
//  Axa Heroes
//
//  Created by Marc Gallardo on 15/9/15.
//  Copyright (c) 2015 Gallardos. All rights reserved.
//

#import "GnomeManager.h"
#import "RestGnome.h"
#import "Gnome.h"
#import "Gnome+RestGnome.h"
#import <AFNetworking/AFHTTPRequestOperation.h>

static NSString * const kURLGnomes = @"https://raw.githubusercontent.com/AXA-GROUP-SOLUTIONS/mobilefactory-test/master/data.json";

@interface GnomeManager ()
@property(nonatomic, strong) NSMutableArray *aux;

@end
@implementation GnomeManager

+ (id)sharedManager {
    static GnomeManager *sharedManager = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedManager = [[GnomeManager alloc] init];

    });
    
    return sharedManager;
}

- (void)attemptGetGnomesWithSuccess:(GetGnomesResponse)success{
NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kURLGnomes]];
AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
operation.responseSerializer = [AFJSONResponseSerializer serializer];
operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    // 3
    _aux = [NSMutableArray array];
    NSArray *personatges = responseObject[@"Brastlewark"];
    for(NSDictionary *pj in personatges) {
        RestGnome *restGnome = [RestGnome fromDictionary:pj];
        Gnome *gnome = [Gnome fromRestGnome:restGnome];
     
        [_aux addObject:gnome];
      
    }
 
    dispatch_async(dispatch_get_main_queue(), ^{
        success(_aux);
    });
    
    
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
    // 4
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                        message:[error localizedDescription]
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];

}];

// 5
[operation start];
}
@end
