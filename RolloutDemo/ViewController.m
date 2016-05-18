//
//  ViewController.m
//  RolloutDemo
//
//  Created by Harry on 16/5/17.
//  Copyright © 2016年 HarryDeng. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
#import "MTLJSONAdapter.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSString *)quote:(NSString *)s{
    return [NSString stringWithFormat:@"quote %@", s];
}

- (IBAction)downloadData{
    
    NSString *news = [self quote:@"harry"];
    NSLog(@"news : %@", news);
    
    
    void (^ handleResponse)(NSData *data, NSURLResponse *response, NSError *error) = ^(NSData *data, NSURLResponse *response, NSError *error){
        UIImage *img = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imageView.image = img;
        });
    };
    
    NSString *url = @"https://httpbin.org/image/png";
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithURL:[NSURL URLWithString:url]
                                                   completionHandler:handleResponse];

    /*
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithURL:[NSURL URLWithString:url]
                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                       
                                                       UIImage *img = [UIImage imageWithData:data];
                                                       dispatch_async(dispatch_get_main_queue(), ^{
                                                           _imageView.image = img;
                                                       });
                                                       
                                                   }];
     */
    
    [sessionDataTask resume];
    
    [self testBlock];
}

- (void)testBlock{
    
    void (^ blockH)(NSString *result, BOOL success) = ^(NSString *result, BOOL success){
        if (success) {
            NSLog(@"success");
        }
        else {
            NSLog(@"%@", result);
        }
    };
    
    [self request:@"thanks rollout help me so much" compeltion:blockH];
}

- (void)request:(NSString *)test compeltion:(void (^)(NSString *result, BOOL success))handleIT{
    if (rand() % 2) {
        handleIT([NSString stringWithFormat:@"hd:%@", test], YES);
    }
    else{
        handleIT([NSString stringWithFormat:@"fail:%@", test], NO);
    }
}

- (IBAction)uploadData{
    NSLog(@"上传日志");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
