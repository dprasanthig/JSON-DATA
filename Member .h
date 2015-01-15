//
//  Member.h
//  Heylets
//
//  Created by Prasanthi on 1/12/15.
//  Copyright (c) 2015 prasanthi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<UIKit/UIKit.h>
@interface Member : NSObject
{
    NSString *imgId;
    NSString *memberId;
    NSString *name;
}
@property(nonatomic,strong) NSString *imgId;
@property(nonatomic,strong) NSString *memberId;
@property(nonatomic,strong)NSString *name;
@property (nonatomic, strong) UIImage *personImage;
@end
