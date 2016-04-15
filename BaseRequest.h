//
//  BaseRequest.h
//  AFNetworking3.0
//
//  Created by shizi on 16/4/15.
//  Copyright © 2016年 黄小黄. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseRequest : NSObject
typedef void (^ProtocolBlock)(BOOL isSuccessful,id result,NSString* error);
@property(nonatomic,copy) ProtocolBlock complete;

//post
+(void)requestWithParam:(NSDictionary *)dictionary address:(NSString *)apiStr result:(ProtocolBlock)resultblock;
//get
+(void)requestGetWithParam:(NSDictionary *)dictionary address:(NSString *)apiStr result:(ProtocolBlock)resultblock;

@end
