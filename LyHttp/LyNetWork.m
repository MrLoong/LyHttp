//
//  LyNetWork.m
//  LyHttp
//
//  Created by LastDay on 15/12/1.
//  Copyright © 2015年 LastDay. All rights reserved.
//

#import "LyNetWork.h"
#import "LYURLRequestSerialization.h"
#import "LYHTTPRequestOperationManager.h"


@interface LyNetWork()



@end

@implementation LyNetWork


//+(void)requestMethod:(NSString *)method
//                 URL:(NSString *)URL
//          parameters:(id) parameters
//             success:(void (^)(NSData *__nullable data,NSURLResponse * __nullable response))success
//             failure:(void (^)(NSError *__nullable error))failure
//{
//    
//    LYHTTPRequestOperationManager *manange = [[LYHTTPRequestOperationManager alloc] initWithMethod:method URL:URL parameters:parameters];
//    [manange driveTask:success failure:failure];
//}

//不带parameters
+(void)requestWithMethod:(NSString *)method
                 URL:(NSString *)URL
             success:(void (^)(NSData *__nullable data,NSURLResponse * __nullable response))success
             failure:(void (^)(NSError *__nullable error))failure
{
    
    LYHTTPRequestOperationManager *manange = [[LYHTTPRequestOperationManager alloc] initWithMethod:method URL:URL parameters:nil];
    [manange driveTask:success failure:failure];
}


//GET不带parameters
+(void)requestGetWithURL:(NSString *)URL
             success:(void (^)(NSData *__nullable data,NSURLResponse * __nullable response))success
             failure:(void (^)(NSError *__nullable error))failure
{
    
    LYHTTPRequestOperationManager *manange = [[LYHTTPRequestOperationManager alloc] initWithMethod:@"GET" URL:URL parameters:nil];
    [manange driveTask:success failure:failure];
}
//GET带parameters
+(void)requestGetWithURL:(NSString *)URL
          parameters:(id) parameters
             success:(void (^)(NSData *__nullable data,NSURLResponse * __nullable response))success
             failure:(void (^)(NSError *__nullable error))failure
{
    
    LYHTTPRequestOperationManager *manange = [[LYHTTPRequestOperationManager alloc] initWithMethod:@"GET" URL:URL parameters:parameters];
    [manange driveTask:success failure:failure];
}



//POST不带parameters
+(void)requestPostWithURL:(NSString *)URL
                 success:(void (^)(NSData *__nullable data,NSURLResponse * __nullable response))success
                 failure:(void (^)(NSError *__nullable error))failure
{
    
    LYHTTPRequestOperationManager *manange = [[LYHTTPRequestOperationManager alloc] initWithMethod:@"POST" URL:URL parameters:nil];
    [manange driveTask:success failure:failure];
}
//POST带parameters
+(void)requestPostWithURL:(NSString *)URL
              parameters:(id) parameters
                 success:(void (^)(NSData *__nullable data,NSURLResponse * __nullable response))success
                 failure:(void (^)(NSError *__nullable error))failure
{
    
    LYHTTPRequestOperationManager *manange = [[LYHTTPRequestOperationManager alloc] initWithMethod:@"POST" URL:URL parameters:parameters];
    [manange driveTask:success failure:failure];
}



@end


