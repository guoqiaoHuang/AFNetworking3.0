//
//  BaseRequest.m
//  AFNetworking3.0
//
//  Created by shizi on 16/4/15.
//  Copyright © 2016年 黄小黄. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest
+(void)requestWithParam:(NSDictionary *)dictionary address:(NSString *)apiStr result:(ProtocolBlock)resultblock{
    
    // 初始化Manager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误，因为我们要获取text/plain类型数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // post请求
    MBProgressHUD *hud=[[MBProgressHUD alloc]init];
    [hud show:YES];
    [[UIApplication sharedApplication].windows.lastObject addSubview:hud];
    [manager POST:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?" parameters:dictionary constructingBodyWithBlock:^(id  _Nonnull formData) {
        // 拼接data到请求体，这个block的参数是遵守AFMultipartFormData协议的。
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
                // 这里可以获取到目前的数据请求的进度
//        DLog(@"%d",uploadProgress.version);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

//         请求成功，解析数据
        NSLog(@"%@", responseObject);
        [hud hide:YES];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        resultblock(YES,responseObject,@"chenggong");
        NSLog(@"%@", dic);
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        resultblock(NO,nil,error.description);
        [hud hide:YES];
        NSLog(@"%@", [error localizedDescription]);
    }];
}
+(void)requestWithoutdownParam:(NSDictionary *)dictionary address:(NSString *)apiStr result:(ProtocolBlock)resultblock{
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manger POST:apiStr parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData){
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        resultblock(YES,dic,@"chenggong");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         resultblock(NO,nil,error.description);
    }];
}


+(void)requestGetWithParam:(NSDictionary *)dictionary address:(NSString *)apiStr result:(ProtocolBlock)resultblock{
    
    
    // 初始化Manager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误，因为我们要获取text/plain类型数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // GET请求
    [manager GET:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?" parameters:dictionary progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultblock(YES,responseObject,@"chenggong");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        resultblock(NO,error.description,@"chenggong");
    }];
}

@end
