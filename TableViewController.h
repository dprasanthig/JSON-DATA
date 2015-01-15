# JSON-DATA
//
//  TableViewController.h
//  Heylets
//
//  Created by prasanthi on 1/12/15.
//  Copyright (c) 2015 prasanthi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Experiance.h"
#import "Member.h"
#import "Place.h"

@interface TableViewController : UITableViewController<UITabBarDelegate,UITableViewDataSource>
{

    NSMutableArray *experienceDataArray;

}
@property(nonatomic,strong) NSMutableArray *experienceDataArray;
@property (strong, nonatomic) IBOutlet UITableView *Maintableview;



@end
