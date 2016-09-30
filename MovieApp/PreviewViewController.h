//
//  ListViewController.h
//  MovieApp
//
//  Created by almodad on 22/07/2016.
//  Copyright © 2016 almodad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Film.h"
#import "Movie.h"
#import "PreviewFilm.h"
#import "BaseController.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PreviewViewController : BaseController
{
    AVAudioPlayer *audioPlayer;
    MPMoviePlayerViewController *moviePlayer;
}
@property (weak, nonatomic) IBOutlet UIImageView *imgPoster;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@property(nonatomic,retain) Film *film;
@property(nonatomic,retain) PreviewFilm *filmPreview;
@property (nonatomic, strong) Movie *filmSaved;
- (IBAction)playVideo:(id)sender;
- (IBAction)playAudio:(id)sender;



//data persistent with core data
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;


-(void)fetchData:(NSString *)urlParameter;
-(void) designUI:(PreviewFilm *) preview;
- (IBAction)bookmarkFilm:(id)sender;

@end
