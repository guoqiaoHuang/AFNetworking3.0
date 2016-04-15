//
//  ViewController.m
//  AFNetworking3.0
//
//  Created by shizi on 16/4/14.
//  Copyright © 2016年 黄小黄. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=@"网络框架升级";
//    兼容https先修改plist文件字段配置好工程环境
    DLog(@"HELLO WORLD");
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];

    });
    [self.webImage setImageWithURL:[NSURL URLWithString:@"http://static.oschina.net/uploads/space/2016/0410/095439_jGXF_2356355_thumb.jpg"]];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"20131129", @"date", @"1", @"startRecord", @"5", @"len", @"1234567890", @"udid", @"Iphone", @"terminalType", @"213", @"cid", nil];
    [BaseRequest requestWithParam:dic address:@"" result:^(BOOL isSuccessful, id result, NSString *error) {
       
        if (isSuccessful) {
            DLog(@"%@",result);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
