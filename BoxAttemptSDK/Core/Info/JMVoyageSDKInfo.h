//
//  JMVoyageSDKInfo.h
//  JMVoyageSDK
//
//  Created by ZhengXianda on 11/08/2022.
//  Copyright (c) 2022 ZhengXianda. All rights reserved.
//

#import <JMRktInfo/JMRktInfo.h>

#import <JMBusiness/JMBusiness.h>

typedef NS_ENUM(NSUInteger, JMVoyageLoginType) {
    JMVoyageLoginType_Guest = 1,
    JMVoyageLoginType_Auto = 6,
};

typedef NS_ENUM(NSUInteger, JMVoyageThirdType) {
    JMVoyageThirdType_Guest = 0,
    JMVoyageThirdType_Facebook = 11,
    JMVoyageThirdType_Google = 12,
    JMVoyageThirdType_Line = 13,
    JMVoyageThirdType_Apple = 14,
    JMVoyageThirdType_GameCenter = 16,
};

NS_ASSUME_NONNULL_BEGIN

@interface JMVoyageSDKInfo: JMRktInfo

#pragma mark - shared

+ (JMVoyageSDKInfo *)shared;

///已经初始化
@property (nonatomic, assign) BOOL isInitialized;
///登录token
@property (nonatomic, strong) NSString *token;
///登录类型
@property (nonatomic, strong) NSString *loginType;
///登录授权类型
@property (nonatomic, strong) NSString *thirdType;
///用户识别Id
@property (nonatomic, strong) NSString *openId;
///用户是否刚刚注册
@property (nonatomic, assign) BOOL isRegister;
///用户通过登录行为取消注销流程
@property (nonatomic, assign) BOOL cancelClosing;
///用户昵称
@property (nonatomic, strong) NSString *nickname;

- (void)resetLoginInfo;

#pragma mark - extract

- (void)extractLoginResponseObject:(NSDictionary *)responseObject;

- (void)extractUniqueIdCheckResponseObject:(NSDictionary *)responseObject;
- (void)extractUniqueIdLocalCheckResponseObject:(NSDictionary *)responseObject;

- (void)extractUserInfoResponseObject:(NSDictionary *)responseObject;

#pragma mark - 状态验证

- (BOOL)checkInitializedWithCallback:(JMBusinessCallback)callback;

- (BOOL)checkSignedWithCallback:(JMBusinessCallback)callback;

- (BOOL)checkGuestWithCallback:(JMBusinessCallback)callback;

@end

NS_ASSUME_NONNULL_END
