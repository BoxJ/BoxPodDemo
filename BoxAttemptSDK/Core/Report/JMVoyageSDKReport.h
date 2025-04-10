//
//  JMVoyageSDKReport.h
//  JMVoyageSDKReport
//
//  Created by ZhengXianda on 08/04/2021.
//  Copyright (c) 2021 ZhengXianda. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSInteger JMVoyageSDKReportCode_Common = -1;///<【通用】客户端通用错误码(Client error)
static const NSInteger JMVoyageSDKReportCode_Global_Uninitialized = -1001;///<【全局】客户端未初始化(Client is not initialized)
static const NSInteger JMVoyageSDKReportCode_Global_Unsigned = -1002;///<【全局】用户未登录(User is not logined)
static const NSInteger JMVoyageSDKReportCode_Global_AuthExpired = -1003;///<【全局】用户凭证已失效(Authorization has expired)
static const NSInteger JMVoyageSDKReportCode_Global_AuthCanceled = -1004;///<【全局】用户中止第三方授权(Authorization process has been canceled)
static const NSInteger JMVoyageSDKReportCode_Initialized_Failed = -2001;///<【初始化】初始化失败(Initialize failed with Network problem)
static const NSInteger JMVoyageSDKReportCode_InitializedThirdparty_Failed = -2002;///<【初始化第三方服务】缺少配置，第三方服务初始化失败(Missing configuration, third-party service initialization failed)
static const NSInteger JMVoyageSDKReportCode_Bound_Failed = -2015;///< 当前非游客账号，绑定失败
static const NSInteger JMVoyageSDKReportCode_Recharge_Canceled = -4000;///<【支付】用户关闭支付界面(There is an order in progress
static const NSInteger JMVoyageSDKReportCode_Recharge_Repeated = -4001;///<【支付】重复调用充值接口(Order has been canceled) now, please dont open another one)
static const NSInteger JMVoyageSDKReportCode_Recharge_Incompleted = -4002;///<【支付】CP请求参数为空(Order parameters was incomplete)
static const NSInteger JMVoyageSDKReportCode_Recharge_NoAppleProduct = -4003;///<【支付】查询苹果商品信息失败(Query Apple Product Info Failed)

NS_ASSUME_NONNULL_BEGIN

@interface NSError (JMVoyageSDKReport)

+ (instancetype)voyage_common:(NSString *)message;

+ (instancetype)voyage_reportWithCode:(NSInteger)code message:(NSString *)message;

+ (instancetype)voyage_common;
+ (instancetype)voyage_global_uninitialized;
+ (instancetype)voyage_global_unsigned;
+ (instancetype)voyage_global_noguest;
+ (instancetype)voyage_global_authexpired;
+ (instancetype)voyage_global_authcanceled;
+ (instancetype)voyage_initialized_baseurl_failed;
+ (instancetype)voyage_initialized_failed;
+ (instancetype)voyage_initializedThirdparty_failed;
+ (instancetype)voyage_recharge_repeated;
+ (instancetype)voyage_recharge_canceled;
+ (instancetype)voyage_recharge_incompleted;
+ (instancetype)voyage_recharge_noAppleProduct;

@end

NS_ASSUME_NONNULL_END
