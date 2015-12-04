//
//  LyNetWork.h
//  LyHttp
//
//  Created by LastDay on 15/12/1.
//  Copyright © 2015年 LastDay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LyNetWork : NSObject

+(void)requestMethod:(nullable NSString *)method
                 URL:(nullable NSString *)URL
            parameters:(nullable id) parameters
             success:(nullable void (^)(NSData *__nullable data,NSURLResponse * __nullable response))success
             failure:(nullable void (^)(NSError *__nullable error))failure;



@end
