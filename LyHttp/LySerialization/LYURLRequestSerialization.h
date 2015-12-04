//
//  LYURLRequestSerialization.h
//  LyHttp
//
//  Created by LastDay on 15/12/3.
//  Copyright © 2015年 LastDay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYURLRequestSerialization : NSObject

+(NSString *)LYQueryStringFromParameters:(NSDictionary *)parameters;

@end
