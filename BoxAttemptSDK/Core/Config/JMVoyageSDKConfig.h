//
//  JMVoyageSDKConfig.h
//  JMVoyageSDK
//
//  Created by ZhengXianda on 11/08/2022.
//  Copyright (c) 2022 ZhengXianda. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <JMRktCommon/JMRktCommon.h>
#import <JMVoyageSDKBase/JMVoyageSDKConfigFacebook.h>
#import <JMVoyageSDKBase/JMVoyageSDKConfigGoogle.h>
#import <JMVoyageSDKBase/JMVoyageSDKConfigLine.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMVoyageSDKConfig : NSObject

#pragma mark - shared

+ (JMVoyageSDKConfig *)shared;

@property (nonatomic, assign) BOOL isShadowMode;

+ (NSString *)version;
+ (NSString *)environment;
+ (NSString *)requestBaseURL;
+ (NSString *)webBaseURL;

@property (nonatomic, assign) NSInteger antiAddictionInterval;//防沉迷间隔(秒)
@property (nonatomic, strong) JMVoyageSDKConfigFacebook *facebookConfig;
@property (nonatomic, strong) JMVoyageSDKConfigGoogle *googleConfig;
@property (nonatomic, strong) JMVoyageSDKConfigLine *lineConfig;
@property (nonatomic, strong) NSArray<NSString *> *loginStyle;//登录样式顺序, 枚举: chuanglan,phone,guest
@property (nonatomic, assign) NSInteger loginSwitchTime;//切换登录等待时间(秒)
@property (nonatomic, assign) BOOL logoMark;//Logo显示 1开 0关
@property (nonatomic, assign) NSInteger logoutMaxWaitingDys;//注销账号最大等待期
@property (nonatomic, assign) NSInteger logoutMinWaitingDys;//注销账号最小等待期
@property (nonatomic, strong) NSString *privacyPolicy;//用户协议提示文案
@property (nonatomic, strong) NSString *privacyPolicyVersion;//用户协议版本号
@property (nonatomic, strong) NSArray<NSString *> *purchaseChannel;//充值渠道列表, 枚举: alipay, wxpay
@property (nonatomic, assign) BOOL sandboxMark;//沙盒标记显示 1开 0关

- (void)queryBaseURLWithCallback:(JMRktCommonCallback)callback;
- (void)queryConfigWithCallback:(JMRktCommonCallback)callback;

@end

NS_ASSUME_NONNULL_END
