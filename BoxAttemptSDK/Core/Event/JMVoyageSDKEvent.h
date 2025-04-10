//
//  JMVoyageSDKEvent.h
//  JMVoyageSDK
//
//  Created by ZhengXianda on 11/01/2022.
//  Copyright (c) 2022 ZhengXianda. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <JMVoyageSDKBase/JMVoyageSDKEventItem.h>

static const NSInteger JMVoyageSDKEventId_Initialize_Failed = 10;///<初始化SDK -> 初始化失败
static const NSInteger JMVoyageSDKEventId_Initialize_Successed = 11;///<初始化SDK -> 初始化成功
static const NSInteger JMVoyageSDKEventId_InitializeAuth_Failed = 12;///<初始化SDK第三方登录 -> 初始化失败; ex1(2:Google, 3:Facebook, 4:Line, 5:Apple, 6:playgame, 7:gamecenter)
static const NSInteger JMVoyageSDKEventId_PermissionError = 20;///<安卓：用户IMIE或者AAID未获取; IOS：IDFA未获取 ->  用户设备识别信息获取失败
static const NSInteger JMVoyageSDKEventId_SDKError = 30;///<SDK错误码 -> SDK报错后 ;(ex1:错误码)
            
static const NSInteger JMVoyageSDKEventId_TrackLogin = 100;///<第三方授权登录 -> 调起; ex1(1:匿名登录, 2:Google, 3:Facebook, 4:Line, 5:Apple); ex2(0: 为授权登录, 1: 为自动登录);
static const NSInteger JMVoyageSDKEventId_TrackBound = 101;///<第三方授权绑定 -> 调起; ex1(1:匿名登录, 2:Google, 3:Facebook, 4:Line, 5:Apple); ex2(0: 为授权登录, 1: 为自动登录);
static const NSInteger JMVoyageSDKEventId_LoginAuth_Failed = 110;///<第三方授权登录 -> 第三方授权失败; ex1(1:匿名登录, 2:Google, 3:Facebook, 4:Line, 5:Apple);
static const NSInteger JMVoyageSDKEventId_LoginAuth_Successed = 111;///<第三方授权登录 -> 第三方授权成功; ex1(1:匿名登录, 2:Google, 3:Facebook, 4:Line, 5:Apple);
static const NSInteger JMVoyageSDKEventId_Login_Failed = 120;///<登录 -> 登录失败; ex1(1:匿名登录, 2:Google, 3:Facebook, 4:Line, 5:Apple); ex2(0: 为授权登录, 1: 为自动登录);
static const NSInteger JMVoyageSDKEventId_Login_Successed = 121;///<登录 -> 登录成功; ex1(1:匿名登录, 2:Google, 3:Facebook, 4:Line, 5:Apple); ex2(0: 为授权登录, 1: 为自动登录);
static const NSInteger JMVoyageSDKEventId_Login_Registered = 122;///<登录 -> 用户通过SDK注册成功; ex1(1:匿名登录, 2:Google, 3:Facebook, 4:Line, 5:Apple); ex2(0: 为授权登录, 1: 为自动登录);
            
static const NSInteger JMVoyageSDKEventId_BoundAuthAwake_Failed = 200;///<第三方授权绑定 -> 调起第三方授权失败; ex1(2:Google, 3:Facebook, 4:Line, 5:Apple);
static const NSInteger JMVoyageSDKEventId_BoundAuthAwake_Successed = 200;///<第三方授权绑定 -> 调起第三方授权成功; ex1(2:Google, 3:Facebook, 4:Line, 5:Apple);
static const NSInteger JMVoyageSDKEventId_BoundAuth_Failed = 210;///<第三方授权绑定 -> 第三方授权失败; ex1(2:Google, 3:Facebook, 4:Line, 5:Apple);
static const NSInteger JMVoyageSDKEventId_BoundAuth_Successed = 211;///<第三方授权绑定 -> 第三方授权成功; ex1(2:Google, 3:Facebook, 4:Line, 5:Apple);
static const NSInteger JMVoyageSDKEventId_Bound_Failed = 212;///<第三方绑定 -> 第三方绑定失败; ex1(2:Google, 3:Facebook, 4:Line, 5:Apple);
static const NSInteger JMVoyageSDKEventId_Bound_Successed = 213;///<第三方绑定 -> 第三方绑定成功; ex1(2:Google, 3:Facebook, 4:Line, 5:Apple);
            
static const NSInteger JMVoyageSDKEventId_PayOrder_Failed = 300;///<订单生成 - > 支付订单生成失败; ex1(1: Google支付 2: 苹果支付);
static const NSInteger JMVoyageSDKEventId_PayOrder_Successed = 301;///<订单生成 - > 支付订单生成成功; ex1(1: Google支付 2: 苹果支付);
static const NSInteger JMVoyageSDKEventId_PayEvent_Failed = 310;///<订单支付 - > 支付失败; ex1(1: Google支付 2: 苹果支付);
static const NSInteger JMVoyageSDKEventId_PayEvent_Successed = 311;///<订单支付 - > 支付成功; ex1(1: Google支付 2: 苹果支付);

NS_ASSUME_NONNULL_BEGIN

@interface JMVoyageSDKEvent : NSObject

+ (instancetype)shared;

- (void)uploadEvent:(JMVoyageSDKEventItem *)event;

- (void)uploadHistory;

- (void)recordEvent:(JMVoyageSDKEventItem *)event;

@end

NS_ASSUME_NONNULL_END
