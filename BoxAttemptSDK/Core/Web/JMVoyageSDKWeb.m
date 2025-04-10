//
//  JMVoyageSDKWeb.m
//  JMVoyageSDK
//
//  Created by ZhengXianda on 11/08/2022.
//  Copyright (c) 2022 ZhengXianda. All rights reserved.
//

#import "JMVoyageSDKWeb.h"

#import "JMVoyageSDKConfig.h"
#import "JMVoyageSDKRequest.h"
#import "JMVoyageSDKInfo.h"

@implementation JMVoyageSDKWeb

#pragma mark - shared

+ (JMVoyageSDKWeb *)shared {
    static JMVoyageSDKWeb *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self registerBaseURL:JMVoyageSDKConfig.webBaseURL
                    paramHook:^NSDictionary<NSString *,id> * _Nonnull{
            return @{
                @"header": [[JMVoyageSDKRequest shared].baseHeaderConfig
                            infoByAppendingInfo:@{}
                            signKey:@""
                            signOrder:@[]
                            secretKey:[JMVoyageSDKInfo shared].secretKey],
                @"origin": [JMVoyageSDKConfig.webBaseURL stringByAppendingString:@"/"],
            };
        } themeHook:^NSDictionary<NSString *,id> * _Nonnull{
            return @{};
        }];
    }
    return self;
}

@end
