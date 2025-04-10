//
//  JMVoyageSDKConfig.m
//  JMVoyageSDK
//
//  Created by ZhengXianda on 11/08/2022.
//  Copyright (c) 2022 ZhengXianda. All rights reserved.
//

#import "JMVoyageSDKConfig.h"

#import "JMVoyageSDKBaseEnv.h"
#import "JMVoyageSDKReport.h"

#import "JMVoyageSDKRequest+JMVoyageSDKConfig.h"

@interface JMVoyageSDKConfig()

@property (nonatomic, strong) NSString *baseURL;

@end

@implementation JMVoyageSDKConfig

#pragma mark - shared

+ (JMVoyageSDKConfig *)shared {
    static JMVoyageSDKConfig * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JMVoyageSDKConfig alloc] init];
    });
    return instance;
}

+ (NSString *)version {
    return JMVoyageSDKBase_Version;
}

+ (NSString *)environment {
    return JMVoyageSDKBase_Environment;
}

+ (NSString *)requestBaseURL {
    if ([self shared].baseURL && [self shared].baseURL.length > 0) {
        return [self shared].baseURL;
    } else {
        return [self shared].isShadowMode ? JMVoyageSDKBase_RequestBaseURLForShadow : JMVoyageSDKBase_RequestBaseURL;
    }
}

+ (NSString *)webBaseURL {
    return [self shared].isShadowMode ? JMVoyageSDKBase_WebBaseURLForShadow : JMVoyageSDKBase_WebBaseURL;
}

- (void)queryBaseURLWithCallback:(JMRktCommonCallback)callback {
    [[JMVoyageSDKRequest shared] fetchBaseURLWithCallback:^(NSDictionary * _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            JMLog(@"获取BaseURL失败，使用预设地址: %@", self.baseURL);
            callback(nil, nil);
        } else {
            NSString *baseURL = responseObject[@"result"];
            if (baseURL && baseURL.length > 0 && baseURL.isHTTPLink) {
                self.baseURL = baseURL;
                callback(responseObject, error);
            } else {
                NSError *locelError = [NSError voyage_initialized_baseurl_failed];
                callback(locelError.responseValue, locelError);
            }
        }
    }];
}

- (void)queryConfigWithCallback:(JMRktCommonCallback)callback {
    [[JMVoyageSDKRequest shared] fetchConfigWithCallback:^(NSDictionary * _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            callback(responseObject, error);
        } else {
            NSDictionary *result = responseObject[@"result"];
            self.antiAddictionInterval = [result[@"antiAddictionInterval"] integerValue];//防沉迷间隔(秒)
            self.facebookConfig = [[JMVoyageSDKConfigFacebook alloc] initWithData:result[@"facebookConfig"]];
            self.googleConfig = [[JMVoyageSDKConfigGoogle alloc] initWithData:result[@"googleConfig"]];
            self.lineConfig = [[JMVoyageSDKConfigLine alloc] initWithData:result[@"lineConfig"]];
            self.loginStyle = result[@"loginStyle"];//登录样式顺序, 枚举: chuanglan,phone,guest
            self.logoutMaxWaitingDys = [result[@"logoutMaxWaitingDys"] integerValue];//注销账号最大等待期
            self.logoutMinWaitingDys = [result[@"logoutMinWaitingDys"] integerValue];//注销账号最小等待期
            self.privacyPolicy = result[@"privacyPolicy"];//用户协议提示文案
            self.privacyPolicyVersion = result[@"privacyPolicyVersion"];//用户协议版本号
            self.purchaseChannel = result[@"purchaseChannel"];//充值渠道列表, 枚举: alipay, wxpay
            self.sandboxMark = [result[@"sandboxMark"] boolValue];//沙盒标记显示 1开 0关
            
            callback(responseObject, error);
        }
    }];
}

@end
