//
//  JMVoyageSDKInfo.m
//  JMVoyageSDK
//
//  Created by ZhengXianda on 11/08/2022.
//  Copyright (c) 2022 ZhengXianda. All rights reserved.
//

#import "JMVoyageSDKInfo.h"

#import <JMRktCommon/JMRktCommon.h>

#import "JMVoyageSDKReport.h"

#define kJMVoyageSDKInfoTokenKey @"kJMVoyageSDKInfoTokenKey"
#define kJMVoyageSDKInfoLoginTypeKey @"kJMVoyageSDKInfoLoginTypeKey"
#define kJMVoyageSDKInfoThirdTypeKey @"kJMVoyageSDKInfoThirdTypeKey"
#define kJMVoyageSDKInfoNicknameKey @"kJMVoyageSDKInfoNicknameKey"

@implementation JMVoyageSDKInfo

@synthesize token = _token;
@synthesize loginType = _loginType;
@synthesize thirdType = _thirdType;
@synthesize nickname = _nickname;

#pragma mark - shared

+ (JMVoyageSDKInfo *)shared {
    static JMVoyageSDKInfo *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark - 扩展数据 App Extend Info

- (void)loadExtendInfo {
    self.token = self.token ?: @"";
    self.loginType = self.loginType ?: @"";
    self.nickname = self.nickname ?: @"";
}

- (void)clearExtendInfo {
    self.token = @"";
    self.loginType = @"";
    self.nickname = @"";
}

- (void)resetLoginInfo {
    self.openId = @"";
    self.isRegister = NO;
}

#pragma mark - extract

- (void)extractLoginResponseObject:(NSDictionary *)responseObject {
    NSDictionary *result = responseObject[@"result"];
    if ([result isKindOfClass:[NSDictionary class]]) {
        self.token = result[@"token"]?:@"";
        self.openId = result[@"openId"]?:@"";
        self.isRegister = [result[@"register"]?:@(NO) boolValue];
        self.cancelClosing = [result[@"cancelLogout"]?:@(NO) boolValue];
        self.loginType = result[@"loginType"]?:@"";
        self.thirdType = result[@"thirdType"]?:@"";
    }
}

- (void)extractUniqueIdCheckResponseObject:(NSDictionary *)responseObject {
    if ([responseObject[@"result"]?:@(NO) boolValue]) {
        
    } else {
        [[JMVoyageSDKInfo shared] CreateNewUniqueId];
    }
}

- (void)extractUniqueIdLocalCheckResponseObject:(NSDictionary *)responseObject {
    if ([responseObject[@"result"]?:@(NO) boolValue]) {
        
    } else {
        [[JMVoyageSDKInfo shared] CreateNewUniqueIdLocal];
    }
}

- (void)extractUserInfoResponseObject:(NSDictionary *)responseObject {
    NSDictionary *result = responseObject[@"result"];
    if ([result isKindOfClass:[NSDictionary class]]) {
        self.nickname = result[@"nickName"]?:@"";
        self.loginType = result[@"loginType"]?:@"";
        self.thirdType = result[@"thirdType"]?:@"";
    }
}

#pragma mark - 状态验证

- (BOOL)checkInitializedWithCallback:(JMBusinessCallback)callback {
    BOOL pass = YES;
    if (pass) {
        pass = self.isInitialized;
        if (!pass) {
            NSError *error = [NSError voyage_global_uninitialized];
            if (callback) callback([error responseValue], error);
        }
    }
    return pass;
}

- (BOOL)checkSignedWithCallback:(JMBusinessCallback)callback {
    BOOL pass = [self checkInitializedWithCallback:callback];
    if (pass) {
        pass = self.token.length > 0;
        if (!pass) {
            NSError *error = [NSError voyage_global_unsigned];
            if (callback) callback([error responseValue], error);
        }
    }
    return pass;
}

- (BOOL)checkGuestWithCallback:(JMBusinessCallback)callback {
    BOOL pass = [self checkSignedWithCallback:callback];
    if (pass) {
        JMVoyageThirdType thirdType = self.thirdType.integerValue;
        pass = thirdType == JMVoyageThirdType_Guest;
        if (!pass) {
            NSError *error = [NSError voyage_global_noguest];
            if (callback) callback([error responseValue], error);
        }
    }
    return pass;
}

#pragma mark setter

- (void)setToken:(NSString *)token {
    _token = token;
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:kJMVoyageSDKInfoTokenKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setLoginType:(NSString *)loginType {
    _loginType = loginType;
    [[NSUserDefaults standardUserDefaults] setObject:loginType forKey:kJMVoyageSDKInfoLoginTypeKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setThirdType:(NSString *)thirdType {
    _thirdType = thirdType;
    [[NSUserDefaults standardUserDefaults] setObject:thirdType forKey:kJMVoyageSDKInfoThirdTypeKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setNickname:(NSString *)nickname {
    _nickname = nickname;
    [[NSUserDefaults standardUserDefaults] setObject:nickname forKey:kJMVoyageSDKInfoNicknameKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark getter

- (NSString *)token {
    if (!_token) {
        _token = [[NSUserDefaults standardUserDefaults] objectForKey:kJMVoyageSDKInfoTokenKey];
    }
    return _token;
}

- (NSString *)loginType {
    if (!_loginType) {
        _loginType = [[NSUserDefaults standardUserDefaults] objectForKey:kJMVoyageSDKInfoLoginTypeKey];
    }
    return _loginType;
}

- (NSString *)thirdType {
    if (!_thirdType) {
        _thirdType = [[NSUserDefaults standardUserDefaults] objectForKey:kJMVoyageSDKInfoThirdTypeKey];
    }
    return _thirdType;
}

- (NSString *)nickname {
    if (!_nickname) {
        _nickname = [[NSUserDefaults standardUserDefaults] objectForKey:kJMVoyageSDKInfoNicknameKey];
    }
    return _nickname;
}

@end
