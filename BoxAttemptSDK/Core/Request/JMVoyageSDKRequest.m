//
//  JMVoyageSDKRequest.m
//  JMVoyageSDK
//
//  Created by ZhengXianda on 11/08/2022.
//  Copyright (c) 2022 ZhengXianda. All rights reserved.
//

#import "JMVoyageSDKRequest.h"

#import "JMVoyageSDKConfig.h"
#import "JMVoyageSDKInfo.h"

@implementation JMVoyageSDKRequest

#pragma mark - shared

+ (JMVoyageSDKRequest *)shared {
    static JMVoyageSDKRequest *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self registerBaseURL:^NSString * _Nonnull{
            return JMVoyageSDKConfig.requestBaseURL;
        }
                    secretKey:^NSString * _Nonnull{
            return [JMVoyageSDKInfo shared].secretKey;
        }
                   verifyHook:^(JMRktCommonCallback _Nonnull callback) {
            if (callback) callback([JMRktResponse success], nil);
        }
                baseHeaderConfig:[JMRktRequestConfig configWithInfoHook:^NSDictionary<NSString *,id> * _Nonnull{
            return @{
                @"voyage-app-id":[JMVoyageSDKInfo shared].appId?:@"", //voyage-app-id
                @"voyage-client-model":[JMVoyageSDKInfo shared].model?:@"", //客户端 model
                @"voyage-client-ptype":[JMVoyageSDKInfo shared].ptype?:@"", //设备型号 1安卓,2ios
                @"voyage-client-source":@"none", //渠道
                @"voyage-client-token":[JMVoyageSDKInfo shared].token?:@"", //登录token
                @"voyage-client-ua":[JMVoyageSDKInfo shared].userAgent?:@"", //客户端 ua
                @"voyage-client-uuid":[JMVoyageSDKInfo shared].UID?:@"", //客户端UUID
                @"voyage-nonce":[JMVoyageSDKInfo shared].nonce?:@"", //voyage-nonce
                @"voyage-signature-method":[JMVoyageSDKInfo shared].signatureMethod?:@"", //voyage-signature-method
                @"voyage-timestamp":[JMVoyageSDKInfo shared].timestamp?:@"", //voyage-timestamp
                @"voyage-version":JMVoyageSDKConfig.version?:@"", //voyage-version
            };
         } signKeyHook:^NSString * _Nonnull{
             return @"voyage-signature";
         } signOrderHook:^NSArray<NSString *> * _Nonnull{
             return @[
                 @"voyage-app-id",
                 @"voyage-client-model",
                 @"voyage-client-ptype",
                 @"voyage-client-source",
                 @"voyage-client-token",
                 @"voyage-client-ua",
                 @"voyage-client-uuid",
                 @"voyage-nonce",
                 @"voyage-signature-method",
                 @"voyage-timestamp",
                 @"voyage-version",
             ];
         }]
          baseParameterConfig:[JMRktRequestConfig configWithInfoHook:^NSDictionary<NSString *,id> * _Nonnull{
            return @{
                @"idfa": [JMVoyageSDKInfo shared].IDFA?:@"",
                @"uuid": [JMVoyageSDKInfo shared].UID?:@"",
                @"uniqueId": [JMVoyageSDKInfo shared].uniqueId?:@"",
                @"openId": [JMVoyageSDKInfo shared].openId?:@"",
                @"bundleId": [JMVoyageSDKInfo shared].bundleId?:@"",
            };
         } signKeyHook:^NSString * _Nonnull{
             return @"";
         } signOrderHook:^NSArray<NSString *> * _Nonnull{
             return @[];
         }]];
    }
    return self;
}

@end
