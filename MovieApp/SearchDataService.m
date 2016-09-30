//
//  DataService.m
//  MovieApp
//
//  Created by almodad on 25/07/2016.
//  Copyright © 2016 almodad. All rights reserved.
//

#import "SearchDataService.h"
#import "Film.h"

@implementation SearchDataService
@synthesize delegate=_delegate;

-(NSMutableArray *) getSearchedFilmFromAPI:(NSString *)searchParam{
    NSMutableArray *masterList = [[NSMutableArray alloc] init];
    NSString *s_response = [self makeApiCall:searchParam];
    NSError __autoreleasing **error = nil;

    NSData *dataStream = [self converResponseToDataStream:s_response];
    
    if (dataStream != nil) {
        NSDictionary *s_dict = [NSJSONSerialization JSONObjectWithData:dataStream options:kNilOptions error:error];

        NSArray *searchResult = [s_dict objectForKeyedSubscript:@"Search"];

        if ([searchResult count] > 0) {
            for (NSDictionary *movie in searchResult) {
                    Film * i_film = [[Film alloc] initWithAttributes:movie];
                    
                    [masterList addObject:i_film];
                    
                }
        }

    }
    
    return masterList;
}







@end
