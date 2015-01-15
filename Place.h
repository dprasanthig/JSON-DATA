//
//  Place.h
//  Heylets
//
//  Created by Prasanthi on 1/12/15.
//  Copyright (c) 2015 prasanthi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject
{
NSString *city;
NSString *address;
NSString *placename;


}
@property(nonatomic,strong)  NSString *city;
@property(nonatomic,strong) NSString *address;
@property(nonatomic,strong)NSString *placename;

@end
