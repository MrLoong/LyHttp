//
//  ViewController.m
//  LyHttp
//
//  Created by LastDay on 15/11/30.
//  Copyright © 2015年 LastDay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)test:(id)sender {
    NSString *postURL = @"http://cityuit.sinaapp.com/p.php";
    NSString *getURL= @"http://cityuit.sinaapp.com/1.php";
    
    id parmentersPost = @{
                      @"username":@"1",
                      @"password":@"1"
                      };
    id parmentersGet = @{
                      @"value":@"Lastday",
                          };

    
    
    [LyNetWork requestWithMethod:@"POST"
                             URL:@"http://cityuit.sinaapp.com/1.php?value=Lastday"
                         success:^(NSData *data,NSURLResponse *response){
                             NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                             NSLog(@"requestWithMethod = %@",string);
                         }
                         failure:^(NSError *error){
                             NSLog(@"====%@",error);
                         }];
    
    
    [LyNetWork requestPostWithURL:postURL
                       parameters:parmentersPost
                          success:^(NSData *data,NSURLResponse *response){
                              NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                              NSLog(@"requestPostWithURL(带参数) = %@",string);
                          }
                          failure:^(NSError *error){
                              
                          }];
    [LyNetWork requestPostWithURL:postURL
                          success:^(NSData *data,NSURLResponse *response){
                              NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                              NSLog(@"requestPostWithURL(不带参数) = %@",string);
                          }
                          failure:^(NSError *error){
                              
                          }];
    
    [LyNetWork requestGetWithURL:getURL
                       parameters:parmentersGet
                          success:^(NSData *data,NSURLResponse *response){
                              NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                              NSLog(@"requestGetWithURL(带参数) = %@",string);
                          }
                          failure:^(NSError *error){
                              
                          }];
    
    [LyNetWork requestGetWithURL:getURL
                          success:^(NSData *data,NSURLResponse *response){
                              NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                              NSLog(@"requestGetWithURL(不带参数) = %@",string);
                          }
                          failure:^(NSError *error){
                              
                          }];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
