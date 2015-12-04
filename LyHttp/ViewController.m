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
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)test:(id)sender {
    
    NSString *URL = @"http://cityuit.sinaapp.com/p.php";
    id parmenters = @{
                      @"username":@"1",
                      @"password":@"222"
                      };
    

    [LyNetWork requestMethod:@"POST"
                         URL:URL
                  parameters:parmenters
                     success:^(NSData *data,NSURLResponse *response){
                         NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                         NSLog(@"%@",string);
                     }
                     failure:^(NSError *error){
                         NSLog(@"%@",error);
                     }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
