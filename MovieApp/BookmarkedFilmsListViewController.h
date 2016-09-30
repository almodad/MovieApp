//
//  BookmarkedFilmsListViewController.h
//  MovieApp
//
//  Created by almodad on 04/08/2016.
//  Copyright © 2016 almodad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "AppDelegate.h"
#import "BaseController.h"
#import "Film.h"

@interface BookmarkedFilmsListViewController : BaseController

@property (weak, nonatomic) IBOutlet UITableView *myTableview;

@property (strong, nonatomic) NSMutableArray *masterFilmList;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
//core data
@property (nonatomic,strong)NSArray* fetchedRecordsArray;

-(Film *)objectInListAtIndex:(NSUInteger)theIndex;

@end
