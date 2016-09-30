//
//  BaseController.h
//  MovieApp
//
//  Created by almodad on 02/08/2016.
//  Copyright © 2016 almodad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;

@end
