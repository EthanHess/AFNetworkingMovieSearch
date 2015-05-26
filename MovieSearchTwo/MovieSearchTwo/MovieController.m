//
//  MovieController.m
//  MovieSearchTwo
//
//  Created by Ethan Hess on 5/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "MovieController.h"
#import "NetworkController.h"


@implementation MovieController

+ (MovieController *)sharedInstance {
    
    static MovieController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MovieController new];
    });
    return sharedInstance;
    
}

- (void)searchMoviesWithName:(NSString *)name completion:(void (^)(BOOL success))completion {
    
    [[NetworkController api] GET:@"search/movie" parameters:[NetworkController requestApiKey:@{@"query": name}] success:^(NSURLSessionDataTask *task, id responseObject) {
        [MovieController sharedInstance].resultMovies = [responseObject objectForKey:@"results"];
        completion(YES);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(NO);
    }];
    
}

- (void)searchMoviesWithID:(NSString *)ID completion:(void (^)(BOOL success))completion {
    
    NSString *iDString = [NSString stringWithFormat:@"movie/%@", ID];
    
    [[NetworkController api] GET:iDString parameters:@{@"api_key":@"9d2a17cbe8a72490cc74d7aeb605a43f"} success:^(NSURLSessionDataTask *task, id responseObject) {
        self.movieInfo = responseObject;
        completion(YES);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        completion(NO);
    }];
    
    
}

@end
