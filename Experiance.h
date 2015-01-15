//
//  Experiance.h
//  Heylets
//
//  Created by Prasanthi 1/12/15.
//  Copyright (c) 2015 prasanthi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"
#import "Place.h"

@interface Experiance : NSObject
{
    
    NSString *category ;
    NSString *imageId;
    NSString *description;
    NSMutableArray *memberArray;
    NSMutableArray *personArray;
    
}
@property(nonatomic,strong) NSString *imageId;
@property(nonatomic,strong) NSString *description;

@property(nonatomic,strong)NSString *category;
@property(nonatomic,strong)Member *memberData;
@property(nonatomic,strong) Place *placeData;


@end
