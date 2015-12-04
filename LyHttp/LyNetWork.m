//
//  LyNetWork.m
//  LyHttp
//
//  Created by LastDay on 15/12/1.
//  Copyright © 2015年 LastDay. All rights reserved.
//

#import "LyNetWork.h"
#import "LYURLRequestSerialization.h"


@interface LyNetWork()


@end

@implementation LyNetWork

+(void)requestMethod:(NSString *)method
                 URL:(NSString *)URL
          parameters:(id) parameters
             success:(void (^)(NSData *__nullable data,NSURLResponse * __nullable response))success
             failure:(void (^)(NSError *__nullable error))failure
{
    NSString *newURL;
    if ([method isEqual:@"GET"]) {
        newURL = [[URL stringByAppendingString:@"?"] stringByAppendingString: [LYURLRequestSerialization LYQueryStringFromParameters:parameters]];
        NSLog(@"%@",newURL);
    }else{
        newURL = URL;
    }
    
    NSURL *url = [NSURL URLWithString:newURL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = method;
    
    if([method isEqual:@"POST"]){
        [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        request.HTTPBody =[[LYURLRequestSerialization LYQueryStringFromParameters:parameters] dataUsingEncoding:NSUTF8StringEncoding];
    }
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * data,NSURLResponse *response,NSError *error){
        if (error) {
            failure(error);
        }else{
            if (success) {
                success(data,response);
            }
        }
    }];
    [task resume];
}








@end


