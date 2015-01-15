//
//  ViewController.h
//  Heylets
//
//  Created by prasanthi on 1/11/15.
//  Copyright (c) 2015 prasanthi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Experiance.h"

@interface ViewController : UIViewController
{
    IBOutlet UIImageView *personImage;
}
@property(nonatomic,strong) NSArray *experience;
@property(nonatomic,strong)  NSDictionary *tempdic;
@property(nonatomic,strong)  NSDictionary *memberArraylist;
@property(nonatomic,strong)  NSMutableArray *personaList;
@property (strong, nonatomic) IBOutlet UIImageView *Placeimage;

@property (strong, nonatomic) IBOutlet UILabel *description;
@property(nonatomic,strong)NSData *imgData;
@property(nonatomic,strong)UIImage *imag;
@property NSInteger intLabel;

// Experience Object

@property (nonatomic, retain) Experiance *currentExperieceSelected;
@end

