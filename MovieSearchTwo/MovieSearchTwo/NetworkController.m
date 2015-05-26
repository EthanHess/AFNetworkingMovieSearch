//
//  NetworkController.m
//  MovieSearchTwo
//
//  Created by Ethan Hess on 5/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "NetworkController.h"


@implementation NetworkController

+ (AFHTTPSessionManager *)api {
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/"]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
        api.requestSerializer = [AFJSONRequestSerializer serializer];
        [api.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    });
    
    return api;
}


+ (NSDictionary *)requestApiKey:(NSDictionary *)parameters {
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc]initWithDictionary:parameters];
    
    [mutableDictionary setObject:API_KEY forKey:@"api_key"];
    
    return mutableDictionary;
    
    
}

@end
