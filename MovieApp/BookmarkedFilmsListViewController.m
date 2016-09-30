//
//  BookmarkedFilmsListViewController.m
//  MovieApp
//
//  Created by almodad on 04/08/2016.
//  Copyright © 2016 almodad. All rights reserved.
//

#import "BookmarkedFilmsListViewController.h"
#import "PreviewViewController.h"

@interface BookmarkedFilmsListViewController ()

@end

@implementation BookmarkedFilmsListViewController
@synthesize managedObjectContext = _managedObjectContext;

-(NSMutableArray *)masterFilmList{
    if (!_masterFilmList) {
        _masterFilmList = [[NSMutableArray alloc] init];
        
    }
    return _masterFilmList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"BookMarked Films";

    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    //  1
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    
    //fetch data
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    // Fetching Records and saving it in "fetchedRecordsArray" object
    _masterFilmList = [[self getAllBookmarkedFilms] mutableCopy];
    
    [self.myTableview reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Table view data source
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return 1;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    // Return the number of rows in the section.
    //    if ([_masterFilmList count] == 0) {
    //        return 1; // a single cell to report no data
    //    }
    return [_masterFilmList count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    Movie *film = ((Movie *) _masterFilmList[indexPath.row]);
    
    cell.textLabel.text = film.title;
    [cell.detailTextLabel setText:film.type];
    
    cell.imageView.image = [UIImage imageNamed:@"newapp-icon"];
    
    // download the image asynchronously
    if (![film.poster  isEqual: @"N/A"]) {
        [self downloadImageWithURL:[NSURL URLWithString:film.poster] completionBlock:^(BOOL succeeded, UIImage *image) {
            if (succeeded) {
                // change the image in the cell
                cell.imageView.image = image;
                
            }
        }];
    }
    
    return cell;
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSInteger index = [self.myTableview indexPathForSelectedRow].row;
    
    if ([segue.identifier isEqualToString:@"previewFilm2"]){
        [(PreviewViewController *)segue.destinationViewController setFilm:
         [self objectInListAtIndex:
          index]];
    }
}


-(Movie *)objectInListAtIndex: (NSUInteger)index{
    return [_masterFilmList objectAtIndex:index];
}




-(NSArray*) getAllBookmarkedFilms
{
    // initializing NSFetchRequest
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    //Setting Entity to be Queried
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Movie"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    
    // Query on managedObjectContext With Generated fetchRequest
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    // Returning Fetched Records
    return fetchedRecords;
}


@end
