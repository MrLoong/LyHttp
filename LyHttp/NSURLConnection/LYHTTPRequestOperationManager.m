//
//  LYHTTPRequestOperationManager.m
//  LyHttp
//
//  Created by LastDay on 15/12/5.
//  Copyright © 2015年 LastDay. All rights reserved.
//

#import "LYHTTPRequestOperationManager.h"
#import "LYURLRequestSerialization.h"

@interface LYHTTPRequestOperationManager()

@property(nonatomic,strong) NSString *URL;
@property(nonatomic,strong) NSString *method;
@property(nonatomic,strong) NSDictionary *parameters;
@property(nonatomic,strong) NSMutableURLRequest *request;
@property(nonatomic,strong) NSURLSession *session;
@property(nonatomic,strong) NSURLSessionDataTask *task;

@end

@implementation LYHTTPRequestOperationManager


- (instancetype)initWithMethod:(NSString *)method URL:(NSString *)URL parameters:(id)parameters
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.URL = URL;
    self.method = method;
    self.parameters = parameters;
    self.request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL]];
    self.session = [NSURLSession sharedSession];
    return self;
}

-(void)test{
    NSLog(@"URL = %@",self.URL);
}

-(void)setRequest{
    if ([self.method isEqual:@"GET"]&&self.parameters.count>0) {
        
        self.request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[[self.URL stringByAppendingString:@"?"] stringByAppendingString: [LYURLRequestSerialization LYQueryStringFromParameters:self.parameters]]]];
    }
    self.request.HTTPMethod = self.method;
    
    if (self.parameters.count>0) {
        [self.request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    }
}


-(void)setBody{
    if (self.parameters.count>0&&![self.method isEqual:@"GET"]) {
       
        self.request.HTTPBody = [[LYURLRequestSerialization LYQueryStringFromParameters:self.parameters] dataUsingEncoding:NSUTF8StringEncoding];
    }
}


-(void)setTaskWithSuccess:(void(^)(NSData *__nullable data,NSURLResponse * __nullable response))success
                  failure:(void (^)(NSError *__nullable error))failure
{
    self.task = [self.session dataTaskWithRequest:self.request completionHandler:^(NSData * data,NSURLResponse *response,NSError *error){
                if (error) {
                    failure(error);
                }else{
                    if (success) {
                        success(data,response);
                    }
                }
            }];
    [self.task resume];
}


-(void)driveTask:(void(^)(NSData *__nullable data,NSURLResponse * __nullable response))success
         failure:(void (^)(NSError *__nullable error))failure
{
    [self setRequest];
    [self setBody];
    [self setTaskWithSuccess:success failure:failure];
}
@end
