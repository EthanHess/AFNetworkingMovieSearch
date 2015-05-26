//
//  NetworkController.h
//  MovieSearchTwo
//
//  Created by Ethan Hess on 5/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class AFHTTPSessionManager;
static NSString *const API_KEY = @"9d2a17cbe8a72490cc74d7aeb605a43f";

@interface NetworkController : NSObject

+ (AFHTTPSessionManager *)api;

+ (NSDictionary *)requestApiKey:(NSDictionary *)parameters;


@end
