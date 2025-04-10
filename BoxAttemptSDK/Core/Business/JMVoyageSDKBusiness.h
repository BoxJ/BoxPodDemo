//
//  JMVoyageSDKBusiness.h
//  JMVoyageSDK
//
//  Created by ZhengXianda on 11/08/2022.
//  Copyright (c) 2022 ZhengXianda. All rights reserved.
//

#import <JMBusiness/JMBusiness.h>

#import <JMVoyageSDKBase/JMVoyageSDKConfig.h>
#import <JMVoyageSDKBase/JMVoyageSDKInfo.h>
#import <JMVoyageSDKBase/JMVoyageSDKRequest.h>
#import <JMVoyageSDKBase/JMVoyageSDKWeb.h>
#import <JMVoyageSDKBase/JMVoyageSDKEvent.h>
#import <JMVoyageSDKBase/JMVoyageSDKReport.h>
#import <JMVoyageSDKBase/JMVoyageSDKFlyer.h>
#import <JMVoyageSDKBase/JMVoyageSDKRisk.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMVoyageSDKBusiness : JMBusiness

#pragma mark - shared

+ (JMVoyageSDKBusiness *)shared;

+ (JMVoyageSDKConfig *)config;
+ (JMVoyageSDKInfo *)info;
+ (JMVoyageSDKRequest *)request;
+ (JMVoyageSDKWeb *)web;
+ (JMVoyageSDKEvent *)event;
+ (JMVoyageSDKFlyer *)flyer;
+ (JMVoyageSDKRisk *)risk;

@end

NS_ASSUME_NONNULL_END
