//
//  ViewController.m
//  Heylets
//
//  Created by prasanthi on 1/11/15.
//  Copyright (c) 2015 prasanthi. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define HeyletsURL [NSURL URLWithString:@"http://mobile.heylets.com:8080/HeyLets/EN/100/SYD/getExperiences?page=1&orderBy=nearby&resultCount=10&lat=-33.866667&lon=+151.210000&userToken=e14700240e72f45053a64ebed72b73e9"]

#import "ViewController.h"

@implementation ViewController
@synthesize currentExperieceSelected;

@synthesize description;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    description.text = currentExperieceSelected.description;
    personImage.image = currentExperieceSelected.memberData.personImage;
    
    // Get Location Image
    
    NSString *str = [NSString stringWithFormat:@"https://s3-us-west-2.amazonaws.com/hlimages/release/%@/%@_L.jpg",currentExperieceSelected.imageId,currentExperieceSelected.imageId];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:str]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
    self.Placeimage.image = [UIImage imageWithData:data];

    }];

 
}
@end

