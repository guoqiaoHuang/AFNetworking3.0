//
//  ViewController.m
//  AFNetworking3.0
//
//  Created by shizi on 16/4/14.
//  Copyright © 2016年 黄小黄. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+AFNetworking.h"
#import "RuntimeViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=@"网络框架升级";
//    兼容https先修改plist文件字段配置好工程环境
    DLog(@"HELLO WORLD");
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//
//    });
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"runtime" style:UIBarButtonItemStylePlain target:self action:@selector(runTest)];
    [self.webImage setImageWithURL:[NSURL URLWithString:@"http://static.oschina.net/uploads/space/2016/0410/095439_jGXF_2356355_thumb.jpg"]];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"20131129", @"date", @"1", @"startRecord", @"5", @"len", @"1234567890", @"udid", @"Iphone", @"terminalType", @"213", @"cid", nil];
    [BaseRequest requestWithParam:dic address:@"" result:^(BOOL isSuccessful, id result, NSString *error) {
       
        if (isSuccessful) {
            DLog(@"%@",result);
             [MBProgressHUD hideHUDForView:self.view animated:YES];
        }else{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    }];
    [BaseRequest requestWithoutdownParam:dic address:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?" result:^(BOOL isSuccessful, id result, NSString *error) {
        if (isSuccessful) {
            DLog(@"0000%@",result);
            NSArray *temp=result[@"news"];
            NSDictionary  *tempdic=temp[0];
            DLog(@"xinwen %@",tempdic[@"summary"]);
            self.newsText.text=tempdic[@"summary"];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }else{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    }];
}
-(void)runTest{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"pageCurl";
    animation.subtype = kCATransitionFromLeft;
    [self.view.window.layer addAnimation:animation forKey:nil];
    [self.navigationController pushViewController:[RuntimeViewController new] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
