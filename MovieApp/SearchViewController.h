//
//  SearchViewController.h
//  MovieApp
//
//  Created by almodad on 21/07/2016.
//  Copyright © 2016 almodad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"
#import "Film.h"

@interface SearchViewController : BaseController <UISearchBarDelegate>
{
    NSString *noResultText;

}

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(strong, nonatomic) NSMutableArray *masterFilmList;

-(void)fetchData: (NSString *)parameters;
-(Film *)objectInListAtIndex: (NSUInteger)index;
@end
