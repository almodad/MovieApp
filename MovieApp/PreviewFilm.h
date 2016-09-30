//
//  PreviewFilm.h
//  TrailerTrail
//
//  Created by almodad on 9/26/14.
//  Copyright (c) 2016 almodad. All rights reserved.
//

#import "Film.h"

@interface PreviewFilm : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *rated;
@property (strong, nonatomic) NSString *released;
@property (strong, nonatomic) NSString *runtime;
@property (strong, nonatomic) NSString *director;
@property (strong, nonatomic) NSString *writer;
@property (strong, nonatomic) NSString *plot;
@property (strong, nonatomic) NSString *poster;
@property (strong, nonatomic) NSString *language;
@property (strong, nonatomic) NSString *imdbVotes;
@property (strong, nonatomic) NSString *genre;
@property (strong, nonatomic) NSString *starRating;

@property (strong, nonatomic) NSMutableArray *previewFilms;
@property (strong, nonatomic) NSMutableArray *bookmarkedFilms;

-(instancetype) initWithAttributes:(NSDictionary *)attributes;


@end
