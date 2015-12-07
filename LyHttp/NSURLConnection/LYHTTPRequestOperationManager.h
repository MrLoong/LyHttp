//
//  LYHTTPRequestOperationManager.h
//  LyHttp
//
//  Created by LastDay on 15/12/5.
//  Copyright © 2015年 LastDay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYHTTPRequestOperationManager : NSObject


-(void)driveTask:(nullable void(^)(NSData *__nullable data,NSURLResponse * __nullable response))success
         failure:(nullable void (^)(NSError *__nullable error))failure;


- (instancetype) initWithMethod:(NSString *)method URL:(NSString *)URL parameters:( id)parameters;


@end
