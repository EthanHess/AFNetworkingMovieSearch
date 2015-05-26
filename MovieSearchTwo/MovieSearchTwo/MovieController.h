//
//  MovieController.h
//  MovieSearchTwo
//
//  Created by Ethan Hess on 5/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieController : NSObject

+ (MovieController *)sharedInstance;

@property (nonatomic, strong) NSArray *resultMovies;
@property (nonatomic, strong) NSDictionary *movieInfo;

- (void)searchMoviesWithName:(NSString *)name completion:(void (^)(BOOL success))completion;

- (void)searchMoviesWithID:(NSString *)ID completion:(void (^)(BOOL succuess))completion;

@end
