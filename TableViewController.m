//
//  TableViewController.m
//  Heylets
//
//  Created by prasanthi on 1/12/15.
//  Copyright (c) 2015 prasanthi. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "ExperienceTableViewCell.h"


#define HeyletsURL [NSURL URLWithString:@"http://mobile.heylets.com:8080/HeyLets/EN/100/SYD/getExperiences?page=1&orderBy=nearby&resultCount=10&lat=-33.866667&lon=+151.210000&userToken=e14700240e72f45053a64ebed72b73e9"]



@interface TableViewController ()

@end

@implementation TableViewController

@synthesize experienceDataArray;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSData* data = [NSData dataWithContentsOfURL:HeyletsURL];
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSDictionary *experiences = [json objectForKey:@"experiences"];
    
    experienceDataArray = [[NSMutableArray alloc]init];
    NSMutableArray *personaList;
    
    NSDictionary *tempdic = [[NSDictionary alloc]init];
    NSDictionary *memberArraylist=[[NSDictionary alloc]init];
    
    // Loops thru all the objects.
    
    for (NSDictionary *theValue in experiences) {
        
        personaList  = [[NSMutableArray alloc]init];
        
       
        Experiance *testObj = [[Experiance alloc]init];
        testObj.category = theValue[@"category"];
        testObj.imageId=theValue[@"imageId"];
        testObj.description = theValue[@"description"];
        memberArraylist = theValue[@"member"];
        tempdic = theValue[@"place"];
        
        
        Member *mObje = [[Member alloc]init];
        mObje.imgId = [memberArraylist valueForKey:@"imgId"];
        mObje.memberId =[memberArraylist valueForKey:@"memberId"];
        mObje.name = [memberArraylist valueForKey:@"name"];
        
        
        Place *pObje = [[Place alloc]init];
        pObje.city = [tempdic valueForKey:@"city"];
        pObje.address =[tempdic valueForKey:@"address"];
        pObje.placename = [tempdic valueForKey:@"placeName"];
        
        [personaList addObject:pObje];
        
        
        
     testObj.memberData=mObje;
     testObj.placeData = pObje;
     
     [experienceDataArray addObject:testObj] ;
     
     
     }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [experienceDataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
 ExperienceTableViewCell    *cell = (ExperienceTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Experiance * expobj=  [self.experienceDataArray objectAtIndex:indexPath.row];
    cell.personNameLabel.text = expobj.memberData.name;
    cell.placeNameLabel.text = expobj.placeData.placename;
    cell.expDescription.text = expobj.description;
    
    if (expobj.memberData.personImage) {
        cell.personImg.image = expobj.memberData.personImage;
    }
    else {
        cell.personImg.image = [UIImage imageNamed:@"Person.png"];
        [self getImgeForCellAtIndex:indexPath];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


-(void)getImgeForCellAtIndex:(NSIndexPath*)indexPath
{
    
    Experiance * expobj=  [self.experienceDataArray objectAtIndex:indexPath.row];
    NSString *str = [NSString stringWithFormat:@"https://s3-us-west-2.amazonaws.com/hlimages/release/%@/%@_L.jpg",expobj.memberData.imgId,expobj.memberData.imgId];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:str]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        expobj.memberData.personImage = [UIImage imageWithData:data];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }];

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
            NSIndexPath *path = [self.tableView indexPathForSelectedRow];
            
            ViewController *vc = [segue destinationViewController];
            
            vc.currentExperieceSelected = [self.experienceDataArray objectAtIndex:path.row];

    }
   



@end
