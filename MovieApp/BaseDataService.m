//
//  BaseDataService.m
//  MovieApp
//
//  Created by almodad on 28/07/2016.
//  Copyright © 2016 almodad. All rights reserved.
//

#import "BaseDataService.h"

@implementation BaseDataService
@synthesize delegate=_delegate, connection=_connection;


-(NSString *)makeApiCall:(NSString *)parameter{
    NSString *response = @"";
    
    //    http://www.omdbapi.com/?
    NSString *baseURL = [BaseDataService baseAPIUrl];
    
    
    
    baseURL = [baseURL stringByAppendingString:parameter];
    
    //   url =  http://www.omdbapi.com/?s=star wars
    NSURL *encodedURL = [NSURL URLWithString:[BaseDataService encodeURIComponent:baseURL]];
    
    //    jsonUrl = http://www.omdbapi.com/?s=star%20wars
    
    _delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if (_connection == nil) {
        _connection = [AppDelegate initiateURLConnection:encodedURL];
    }
    
    NSError *error = nil;
    response= [NSString stringWithContentsOfURL:encodedURL encoding:NSUTF8StringEncoding error:&error];
    
    
    return response;
    
}

- (NSData*) converResponseToDataStream: (NSString *) response{
    
    return  [response dataUsingEncoding:NSUTF8StringEncoding];
}


+(NSString *)baseAPIUrl{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    return [infoDictionary objectForKey:kBaseAPIUrl];
    
}


+ (NSString *)encodeURIComponent:(NSString *)string
{
    NSString *s = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return s;
}

+ (NSString *)decodeURIComponent:(NSString *)string
{
    NSString *s = [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return s;
}

@end
