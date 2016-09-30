//
//  PreviewFilm.m
//  TrailerTrail
//
//  Created by almodad on 9/26/14.
//  Copyright (c) 2016 almodad. All rights reserved.
//

#import "PreviewFilm.h"

static NSMutableArray *_bookmark;


@implementation PreviewFilm

@synthesize rated=_rated, released=_released, runtime=_runtime, director=_director, writer=_writer, plot=_plot, poster=_poster, language=_language, imdbVotes=_imdbVotes, genre=_genre, starRating =_starRating;

-(NSMutableArray *) previewFilms{
    if(!_previewFilms){
        _previewFilms = [[NSMutableArray alloc] init];
    }
    return _previewFilms;
}

-(NSMutableArray *)bookmarkedFilms{
    
    if (!_bookmarkedFilms) {
        _bookmarkedFilms = [[NSMutableArray alloc] init];
    }
    return _bookmarkedFilms;
}

-(instancetype) initWithAttributes:(NSDictionary *)attributes{
    self = [ super init];
    
    if (self){
        
        self.title =[attributes objectForKey:kTitle];
        self.rated =[attributes objectForKey:kRated];
        self.released =[attributes objectForKey:kReleased];
        self.runtime =[attributes objectForKey:kRuntime];
        self.director =[attributes objectForKey:kDirector];
        self.writer =[attributes objectForKey:kWriter];
        self.plot =[attributes objectForKey:kPlot];
        self.poster =[attributes objectForKey:kPoster];
        self.language =[attributes objectForKey:kLanguage];
        self.imdbVotes =[attributes objectForKey:kimdbVotes];
        self.genre =[attributes objectForKey:kGenre];
        self.starRating =[attributes objectForKey:kImdbRating];
    }
    return self;
}


@end
